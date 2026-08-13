const DAILY_WARNING_THRESHOLD =
  25;

const DAILY_HARD_LIMIT =
  30;

const MONTHLY_HARD_LIMIT =
  500;

const SESSION_COOKIE =
  "gyan_session";

interface ShopAlertTarget {
  code: string;
  name: string;
  email:
    | string
    | null;
}

interface AnonymousLimitCheck {
  allowed: boolean;

  dailyCount: number;
  monthlyCount: number;

  status: number;

  error?:
    string;
}

function jsonDate(
  date = new Date(),
): string {
  return date
    .toISOString()
    .slice(
      0,
      10,
    );
}

function monthKey(
  date = new Date(),
): string {
  return date
    .toISOString()
    .slice(
      0,
      7,
    );
}

function cookieValue(
  request: Request,
  name: string,
): string | null {
  const cookie =
    request.headers.get(
      "cookie",
    );

  if (!cookie) {
    return null;
  }

  for (
    const item
    of cookie.split(";")
  ) {
    const [
      key,
      ...rest
    ] =
      item
        .trim()
        .split("=");

    if (
      key === name
    ) {
      return decodeURIComponent(
        rest.join("="),
      );
    }
  }

  return null;
}

function bytesToHex(
  bytes:
    Uint8Array,
): string {
  return Array.from(
    bytes,
  )
    .map(
      (value) =>
        value
          .toString(16)
          .padStart(
            2,
            "0",
          ),
    )
    .join("");
}

async function sha256(
  value: string,
): Promise<string> {
  const encoded =
    new TextEncoder()
      .encode(
        value,
      );

  const digest =
    await crypto.subtle.digest(
      "SHA-256",
      encoded,
    );

  return bytesToHex(
    new Uint8Array(
      digest,
    ),
  );
}

export async function isSignedInRequest(
  request: Request,
  env: Env,
): Promise<boolean> {
  const token =
    cookieValue(
      request,
      SESSION_COOKIE,
    );

  if (!token) {
    return false;
  }

  const tokenHash =
    await sha256(
      token,
    );

  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          user_id

        FROM user_sessions

        WHERE
          token_hash = ?
          AND expires_at >
            CURRENT_TIMESTAMP

        LIMIT 1
        `,
      )
      .bind(
        tokenHash,
      )
      .first<{
        user_id: number;
      }>();

  return Boolean(
    row,
  );
}

export async function checkAnonymousRequestLimit(
  env: Env,
  shopCode: string,
): Promise<AnonymousLimitCheck> {
  const today =
    jsonDate();

  const month =
    monthKey();

  const daily =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          request_count

        FROM anonymous_request_usage

        WHERE
          shop_code = ?
          AND usage_date = ?

        LIMIT 1
        `,
      )
      .bind(
        shopCode,
        today,
      )
      .first<{
        request_count: number;
      }>();

  const monthly =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          COALESCE(
            SUM(request_count),
            0
          ) AS request_count

        FROM anonymous_request_usage

        WHERE
          shop_code = ?
          AND substr(
            usage_date,
            1,
            7
          ) = ?
        `,
      )
      .bind(
        shopCode,
        month,
      )
      .first<{
        request_count: number;
      }>();

  const dailyCount =
    Number(
      daily?.request_count ??
      0,
    );

  const monthlyCount =
    Number(
      monthly?.request_count ??
      0,
    );

  if (
    dailyCount >=
      DAILY_HARD_LIMIT
  ) {
    return {
      allowed:
        false,

      dailyCount,
      monthlyCount,

      status:
        429,

      error:
        "This shop has reached today's anonymous request limit. Please sign in or try again tomorrow.",
    };
  }

  if (
    monthlyCount >=
      MONTHLY_HARD_LIMIT
  ) {
    return {
      allowed:
        false,

      dailyCount,
      monthlyCount,

      status:
        429,

      error:
        "This shop has reached this month's anonymous request limit. Please sign in to continue.",
    };
  }

  return {
    allowed:
      true,

    dailyCount,
    monthlyCount,

    status:
      200,
  };
}

async function reserveAlert(
  env: Env,
  shopCode: string,
  alertKey: string,
  alertScope:
    | "day"
    | "month",
  periodKey: string,
  requestCount: number,
): Promise<boolean> {
  const result =
    await env.gyan_registry
      .prepare(
        `
        INSERT OR IGNORE INTO
          request_guard_alerts (
            shop_code,
            alert_key,
            alert_scope,
            period_key,
            request_count
          )

        VALUES (
          ?,
          ?,
          ?,
          ?,
          ?
        )
        `,
      )
      .bind(
        shopCode,
        alertKey,
        alertScope,
        periodKey,
        requestCount,
      )
      .run();

  return (
    Number(
      result.meta.changes ??
      0,
    ) === 1
  );
}

function escapeHtml(
  value: string,
): string {
  return value
    .replaceAll(
      "&",
      "&amp;",
    )
    .replaceAll(
      "<",
      "&lt;",
    )
    .replaceAll(
      ">",
      "&gt;",
    )
    .replaceAll(
      '"',
      "&quot;",
    )
    .replaceAll(
      "'",
      "&#039;",
    );
}

async function sendAlertEmail(
  env: Env,
  recipients:
    string[],
  subject: string,
  html: string,
): Promise<void> {
  if (
    !env.RESEND_API_KEY ||
    recipients.length ===
      0
  ) {
    return;
  }

  const uniqueRecipients =
    Array.from(
      new Set(
        recipients
          .map(
            (email) =>
              email
                .trim()
                .toLowerCase(),
          )
          .filter(
            Boolean,
          ),
      ),
    );

  if (
    uniqueRecipients.length ===
      0
  ) {
    return;
  }

  const response =
    await fetch(
      "https://api.resend.com/emails",
      {
        method:
          "POST",

        headers: {
          authorization:
            `Bearer ${env.RESEND_API_KEY}`,

          "content-type":
            "application/json",
        },

        body:
          JSON.stringify({
            from:
              "GYAN <admin@gyan.cc>",

            to:
              uniqueRecipients,

            subject,

            html,
          }),
      },
    );

  if (
    !response.ok
  ) {
    console.error(
      "Request guard alert email failed:",
      await response.text(),
    );
  }
}

async function maybeSendUsageAlerts(
  env: Env,
  shop: ShopAlertTarget,
  dailyCount: number,
  monthlyCount: number,
): Promise<void> {
  const today =
    jsonDate();

  const month =
    monthKey();

  const recipients = [
    "admin@gyan.cc",

    ...(shop.email
      ? [
          shop.email,
        ]
      : []),
  ];

  if (
    dailyCount ===
      DAILY_WARNING_THRESHOLD +
        1
  ) {
    const shouldSend =
      await reserveAlert(
        env,
        shop.code,
        "daily-warning-26",
        "day",
        today,
        dailyCount,
      );

    if (
      shouldSend
    ) {
      await sendAlertEmail(
        env,
        recipients,
        `GYAN request-volume alert · ${shop.name}`,

        `
        <div style="font-family:Arial,sans-serif;max-width:560px;margin:auto;color:#102a56;">
          <h2>Anonymous request volume is high</h2>
          <p>
            <strong>${escapeHtml(shop.name)}</strong>
            (${escapeHtml(shop.code)}) has received
            <strong>${dailyCount}</strong> anonymous requests today.
          </p>
          <p>
            Anonymous requests will be stopped after ${DAILY_HARD_LIMIT}
            requests today. Signed-in requests remain available.
          </p>
        </div>
        `,
      );
    }
  }

  if (
    dailyCount ===
      DAILY_HARD_LIMIT
  ) {
    const shouldSend =
      await reserveAlert(
        env,
        shop.code,
        "daily-limit-30",
        "day",
        today,
        dailyCount,
      );

    if (
      shouldSend
    ) {
      await sendAlertEmail(
        env,
        recipients,
        `GYAN daily anonymous-request limit reached · ${shop.name}`,

        `
        <div style="font-family:Arial,sans-serif;max-width:560px;margin:auto;color:#102a56;">
          <h2>Daily anonymous-request limit reached</h2>
          <p>
            <strong>${escapeHtml(shop.name)}</strong>
            (${escapeHtml(shop.code)}) has received
            <strong>${dailyCount}</strong> anonymous requests today.
          </p>
          <p>
            Further anonymous requests are blocked until tomorrow.
            Signed-in customers can still submit requests.
          </p>
        </div>
        `,
      );
    }
  }

  if (
    monthlyCount ===
      MONTHLY_HARD_LIMIT
  ) {
    const shouldSend =
      await reserveAlert(
        env,
        shop.code,
        "monthly-limit-500",
        "month",
        month,
        monthlyCount,
      );

    if (
      shouldSend
    ) {
      await sendAlertEmail(
        env,
        recipients,
        `GYAN monthly anonymous-request limit reached · ${shop.name}`,

        `
        <div style="font-family:Arial,sans-serif;max-width:560px;margin:auto;color:#102a56;">
          <h2>Monthly anonymous-request limit reached</h2>
          <p>
            <strong>${escapeHtml(shop.name)}</strong>
            (${escapeHtml(shop.code)}) has received
            <strong>${monthlyCount}</strong> anonymous requests this month.
          </p>
          <p>
            Further anonymous requests are blocked for the remainder
            of the month. Signed-in customers can still submit requests.
          </p>
        </div>
        `,
      );
    }
  }
}

export async function recordAnonymousRequest(
  env: Env,
  shop: ShopAlertTarget,
): Promise<{
  dailyCount: number;
  monthlyCount: number;
}> {
  const today =
    jsonDate();

  const month =
    monthKey();

  const daily =
    await env.gyan_registry
      .prepare(
        `
        INSERT INTO
          anonymous_request_usage (
            shop_code,
            usage_date,
            request_count,
            updated_at
          )

        VALUES (
          ?,
          ?,
          1,
          CURRENT_TIMESTAMP
        )

        ON CONFLICT(
          shop_code,
          usage_date
        )
        DO UPDATE SET
          request_count =
            anonymous_request_usage
              .request_count +
            1,

          updated_at =
            CURRENT_TIMESTAMP

        RETURNING
          request_count
        `,
      )
      .bind(
        shop.code,
        today,
      )
      .first<{
        request_count: number;
      }>();

  const monthly =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          COALESCE(
            SUM(request_count),
            0
          ) AS request_count

        FROM anonymous_request_usage

        WHERE
          shop_code = ?
          AND substr(
            usage_date,
            1,
            7
          ) = ?
        `,
      )
      .bind(
        shop.code,
        month,
      )
      .first<{
        request_count: number;
      }>();

  const dailyCount =
    Number(
      daily?.request_count ??
      0,
    );

  const monthlyCount =
    Number(
      monthly?.request_count ??
      0,
    );

  /*
   * Alerts must never make the actual
   * customer request fail.
   */
  try {
    await maybeSendUsageAlerts(
      env,
      shop,
      dailyCount,
      monthlyCount,
    );
  } catch (
    error
  ) {
    console.error(
      "Request guard alert failed:",
      error,
    );
  }

  return {
    dailyCount,
    monthlyCount,
  };
}
