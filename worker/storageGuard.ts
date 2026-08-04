interface SettingRow {
  setting_key: string;
  setting_value: string;
}

interface StorageUsageSettings {
  uploadsEnabled: boolean;
  warningBytes: number;
  stopBytes: number;
  usedBytes: number;
  warningActive: boolean;
  retentionDays: number;
}

interface ExpiredStorageRow {
  total_bytes:
    | number
    | string
    | null;

  file_count:
    | number
    | string
    | null;
}

const DEFAULT_WARNING_BYTES =
  8 * 1024 * 1024 * 1024;

const DEFAULT_STOP_BYTES =
  9 * 1024 * 1024 * 1024;

const DEFAULT_RETENTION_DAYS =
  15;

/*
 * R2 lifecycle expiration may complete
 * after the exact expiration time.
 *
 * We retain the D1 storage count for one
 * additional day so the counter errs on
 * the safe side.
 */
const CLEANUP_SAFETY_DAYS = 1;

function parseBoolean(
  value: string | undefined,
  fallback: boolean,
): boolean {
  if (value === "true") {
    return true;
  }

  if (value === "false") {
    return false;
  }

  return fallback;
}

function parseNonNegativeNumber(
  value: string | undefined,
  fallback: number,
): number {
  const parsed =
    Number(value);

  if (
    !Number.isFinite(parsed) ||
    parsed < 0
  ) {
    return fallback;
  }

  return parsed;
}

export async function getStorageUsageSettings(
  env: Env,
): Promise<StorageUsageSettings> {
  const result =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            setting_key,
            setting_value

          FROM system_settings

          WHERE setting_key IN (
            'uploads_enabled',
            'storage_warning_bytes',
            'storage_stop_bytes',
            'storage_used_bytes',
            'storage_warning_active',
            'file_retention_days'
          )
        `,
      )
      .all<SettingRow>();

  const settings =
    new Map(
      result.results.map(
        (row) => [
          row.setting_key,
          row.setting_value,
        ],
      ),
    );

  return {
    uploadsEnabled:
      parseBoolean(
        settings.get(
          "uploads_enabled",
        ),
        true,
      ),

    warningBytes:
      parseNonNegativeNumber(
        settings.get(
          "storage_warning_bytes",
        ),
        DEFAULT_WARNING_BYTES,
      ),

    stopBytes:
      parseNonNegativeNumber(
        settings.get(
          "storage_stop_bytes",
        ),
        DEFAULT_STOP_BYTES,
      ),

    usedBytes:
      parseNonNegativeNumber(
        settings.get(
          "storage_used_bytes",
        ),
        0,
      ),

    warningActive:
      parseBoolean(
        settings.get(
          "storage_warning_active",
        ),
        false,
      ),

    retentionDays:
      Math.max(
        1,
        Math.floor(
          parseNonNegativeNumber(
            settings.get(
              "file_retention_days",
            ),
            DEFAULT_RETENTION_DAYS,
          ),
        ),
      ),
  };
}

export async function assertUploadCapacity(
  env: Env,
  incomingBytes: number,
): Promise<
  | {
      allowed: true;
      warningActive: boolean;
      projectedBytes: number;
      stopBytes: number;
    }
  | {
      allowed: false;
      error: string;
      status: number;
      usedBytes: number;
      projectedBytes: number;
      stopBytes: number;
    }
> {
  const settings =
    await getStorageUsageSettings(
      env,
    );

  const projectedBytes =
    settings.usedBytes +
    incomingBytes;

  if (!settings.uploadsEnabled) {
    return {
      allowed: false,

      error:
        "File uploads are temporarily paused. Please contact the shop.",

      status: 503,

      usedBytes:
        settings.usedBytes,

      projectedBytes,

      stopBytes:
        settings.stopBytes,
    };
  }

  if (
    projectedBytes >=
    settings.stopBytes
  ) {
    return {
      allowed: false,

      error:
        "File uploads are temporarily unavailable because storage capacity is nearly full. Please contact the shop.",

      status: 507,

      usedBytes:
        settings.usedBytes,

      projectedBytes,

      stopBytes:
        settings.stopBytes,
    };
  }

  return {
    allowed: true,

    warningActive:
      projectedBytes >=
      settings.warningBytes,

    projectedBytes,

    stopBytes:
      settings.stopBytes,
  };
}

export async function addStoredBytes(
  env: Env,
  addedBytes: number,
): Promise<void> {
  if (addedBytes <= 0) {
    return;
  }

  const settings =
    await getStorageUsageSettings(
      env,
    );

  const updatedBytes =
    settings.usedBytes +
    addedBytes;

  const warningActive =
    updatedBytes >=
    settings.warningBytes;

  const uploadsEnabled =
    updatedBytes <
    settings.stopBytes;

  await env.gyan_registry.batch([
    env.gyan_registry
      .prepare(
        `
          INSERT INTO system_settings (
            setting_key,
            setting_value,
            updated_at
          )
          VALUES (
            'storage_used_bytes',
            ?,
            CURRENT_TIMESTAMP
          )

          ON CONFLICT(setting_key)
          DO UPDATE SET
            setting_value =
              excluded.setting_value,

            updated_at =
              CURRENT_TIMESTAMP
        `,
      )
      .bind(
        String(updatedBytes),
      ),

    env.gyan_registry
      .prepare(
        `
          INSERT INTO system_settings (
            setting_key,
            setting_value,
            updated_at
          )
          VALUES (
            'storage_warning_active',
            ?,
            CURRENT_TIMESTAMP
          )

          ON CONFLICT(setting_key)
          DO UPDATE SET
            setting_value =
              excluded.setting_value,

            updated_at =
              CURRENT_TIMESTAMP
        `,
      )
      .bind(
        warningActive
          ? "true"
          : "false",
      ),

    env.gyan_registry
      .prepare(
        `
          INSERT INTO system_settings (
            setting_key,
            setting_value,
            updated_at
          )
          VALUES (
            'uploads_enabled',
            ?,
            CURRENT_TIMESTAMP
          )

          ON CONFLICT(setting_key)
          DO UPDATE SET
            setting_value =
              excluded.setting_value,

            updated_at =
              CURRENT_TIMESTAMP
        `,
      )
      .bind(
        uploadsEnabled
          ? "true"
          : "false",
      ),
  ]);
}

export async function removeStoredBytes(
  env: Env,
  removedBytes: number,
): Promise<void> {
  if (removedBytes <= 0) {
    return;
  }

  const settings =
    await getStorageUsageSettings(
      env,
    );

  const updatedBytes =
    Math.max(
      0,
      settings.usedBytes -
        removedBytes,
    );

  const warningActive =
    updatedBytes >=
    settings.warningBytes;

  /*
   * Automatically resume uploads when
   * usage returns below the stop limit.
   */
  const uploadsEnabled =
    updatedBytes <
    settings.stopBytes;

  await env.gyan_registry.batch([
    env.gyan_registry
      .prepare(
        `
          UPDATE system_settings

          SET
            setting_value = ?,
            updated_at =
              CURRENT_TIMESTAMP

          WHERE setting_key =
            'storage_used_bytes'
        `,
      )
      .bind(
        String(updatedBytes),
      ),

    env.gyan_registry
      .prepare(
        `
          UPDATE system_settings

          SET
            setting_value = ?,
            updated_at =
              CURRENT_TIMESTAMP

          WHERE setting_key =
            'storage_warning_active'
        `,
      )
      .bind(
        warningActive
          ? "true"
          : "false",
      ),

    env.gyan_registry
      .prepare(
        `
          UPDATE system_settings

          SET
            setting_value = ?,
            updated_at =
              CURRENT_TIMESTAMP

          WHERE setting_key =
            'uploads_enabled'
        `,
      )
      .bind(
        uploadsEnabled
          ? "true"
          : "false",
      ),
  ]);
}

export async function reconcileExpiredStorage(
  env: Env,
): Promise<{
  expiredFileCount: number;
  removedBytes: number;
}> {
  const settings =
    await getStorageUsageSettings(
      env,
    );

  const reconciliationAgeDays =
    settings.retentionDays +
    CLEANUP_SAFETY_DAYS;

  const ageModifier =
    `-${reconciliationAgeDays} days`;

  const expiredStorage =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            COALESCE(
              SUM(file_size),
              0
            ) AS total_bytes,

            COUNT(*) AS file_count

          FROM print_request_files

          WHERE
            storage_status = 'stored'

            AND created_at <=
              datetime(
                'now',
                ?
              )
        `,
      )
      .bind(ageModifier)
      .first<ExpiredStorageRow>();

  const removedBytes =
    Number(
      expiredStorage
        ?.total_bytes ?? 0,
    );

  const expiredFileCount =
    Number(
      expiredStorage
        ?.file_count ?? 0,
    );

  if (
    expiredFileCount === 0
  ) {
    return {
      expiredFileCount: 0,
      removedBytes: 0,
    };
  }

  await env.gyan_registry
    .prepare(
      `
        UPDATE print_request_files

        SET
          storage_status =
            'expired',

          storage_key = NULL

        WHERE
          storage_status =
            'stored'

          AND created_at <=
            datetime(
              'now',
              ?
            )
      `,
    )
    .bind(ageModifier)
    .run();

  await removeStoredBytes(
    env,
    removedBytes,
  );

  return {
    expiredFileCount,
    removedBytes,
  };
}