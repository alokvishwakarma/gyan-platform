import {
  getAdminSession,
} from "./adminAuth";

interface SettingRow {
  setting_key: string;
  setting_value: string;
}

interface UpdateStorageRequest {
  warningMegabytes?: unknown;
  stopMegabytes?: unknown;
}

function createJsonResponse(
  data: unknown,
  status = 200,
): Response {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type":
          "application/json; charset=utf-8",
        "cache-control":
          "no-store",
      },
    },
  );
}

async function requireAdmin(
  request: Request,
  env: Env,
): Promise<Response | null> {
  const session =
    await getAdminSession(
      request,
      env,
    );

  if (session) {
    return null;
  }

  return createJsonResponse(
    {
      error:
        "Administrator authentication is required.",
    },
    401,
  );
}

async function loadStorageSettings(
  env: Env,
) {
  const result =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            setting_key,
            setting_value
          FROM system_settings
          WHERE setting_key IN (
            'storage_warning_bytes',
            'storage_stop_bytes',
            'storage_used_bytes',
            'storage_warning_active',
            'uploads_enabled',
            'file_retention_days'
          )
        `,
      )
      .all<SettingRow>();

  const values =
    new Map(
      result.results.map(
        (row) => [
          row.setting_key,
          row.setting_value,
        ],
      ),
    );

  const warningBytes =
    Number(
      values.get(
        "storage_warning_bytes",
      ) ?? 0,
    );

  const stopBytes =
    Number(
      values.get(
        "storage_stop_bytes",
      ) ?? 0,
    );

  const usedBytes =
    Number(
      values.get(
        "storage_used_bytes",
      ) ?? 0,
    );

  const uploadsEnabled =
    values.get(
      "uploads_enabled",
    ) !== "false";

  const warningActive =
    values.get(
      "storage_warning_active",
    ) === "true";

  const state =
    !uploadsEnabled ||
    usedBytes >= stopBytes
      ? "stopped"
      : warningActive ||
          usedBytes >= warningBytes
        ? "warning"
        : "normal";

  return {
    state,
    warningBytes,
    stopBytes,
    usedBytes,
    uploadsEnabled,

    retentionDays:
      Number(
        values.get(
          "file_retention_days",
        ) ?? 15,
      ),
  };
}

async function handleGetStorage(
  request: Request,
  env: Env,
): Promise<Response> {
  const unauthorized =
    await requireAdmin(
      request,
      env,
    );

  if (unauthorized) {
    return unauthorized;
  }

  return createJsonResponse({
    storage:
      await loadStorageSettings(
        env,
      ),
  });
}

async function handleUpdateStorage(
  request: Request,
  env: Env,
): Promise<Response> {
  const unauthorized =
    await requireAdmin(
      request,
      env,
    );

  if (unauthorized) {
    return unauthorized;
  }

  let body:
    UpdateStorageRequest;

  try {
    body =
      (await request.json()) as
        UpdateStorageRequest;
  } catch {
    return createJsonResponse(
      {
        error:
          "Request body must be valid JSON.",
      },
      400,
    );
  }

  const warningMegabytes =
    Number(
      body.warningMegabytes,
    );

  const stopMegabytes =
    Number(
      body.stopMegabytes,
    );

  if (
    !Number.isFinite(
      warningMegabytes,
    ) ||
    !Number.isFinite(
      stopMegabytes,
    ) ||
    warningMegabytes <= 0 ||
    stopMegabytes <= 0 ||
    warningMegabytes >=
      stopMegabytes
  ) {
    return createJsonResponse(
      {
        error:
          "The warning limit must be greater than zero and lower than the stop limit.",
      },
      400,
    );
  }

  const warningBytes =
    Math.round(
      warningMegabytes *
        1024 *
        1024,
    );

  const stopBytes =
    Math.round(
      stopMegabytes *
        1024 *
        1024,
    );

  const current =
    await loadStorageSettings(
      env,
    );

  const warningActive =
    current.usedBytes >=
    warningBytes;

  const uploadsEnabled =
    current.usedBytes <
    stopBytes;

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
            'storage_warning_bytes'
        `,
      )
      .bind(
        String(
          warningBytes,
        ),
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
            'storage_stop_bytes'
        `,
      )
      .bind(
        String(
          stopBytes,
        ),
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

  return createJsonResponse({
    message:
      "Storage limits updated.",

    storage:
      await loadStorageSettings(
        env,
      ),
  });
}

export async function handleAdminStorageRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  if (
    url.pathname !==
    "/api/admin/storage"
  ) {
    return null;
  }

  if (request.method === "GET") {
    return handleGetStorage(
      request,
      env,
    );
  }

  if (request.method === "PUT") {
    return handleUpdateStorage(
      request,
      env,
    );
  }

  return createJsonResponse(
    {
      error:
        "Method not allowed.",
    },
    405,
  );
}