type AdminAuthEnvironment = Env & {
  GYAN_ADMIN_PASSWORD?: string;
  ADMIN_AUTH_PEPPER?: string;
};

interface AdminSessionRow {
  email: string;
  expires_at: string;
}

interface AdminLoginRequest {
  password?: unknown;
}

const SESSION_EXPIRY_HOURS = 8;
const MAX_FAILED_ATTEMPTS = 10;
const LOGIN_WINDOW_MINUTES = 30;

const ADMIN_SESSION_COOKIE =
  "gyan_admin_session";

const ADMIN_IDENTITY =
  "global-admin";

const textEncoder = new TextEncoder();

function createJsonResponse(
  data: unknown,
  status = 200,
  additionalHeaders?: HeadersInit,
): Response {
  const headers = new Headers(
    additionalHeaders,
  );

  headers.set(
    "content-type",
    "application/json; charset=utf-8",
  );

  headers.set(
    "cache-control",
    "no-store",
  );

  return new Response(
    JSON.stringify(data),
    {
      status,
      headers,
    },
  );
}

function getConfiguration(
  env: AdminAuthEnvironment,
):
  | {
      password: string;
      pepper: string;
    }
  | {
      error: string;
    } {
  const password =
    env.GYAN_ADMIN_PASSWORD?.trim();

  const pepper =
    env.ADMIN_AUTH_PEPPER?.trim();

  if (!password) {
    return {
      error:
        "GYAN_ADMIN_PASSWORD is not configured.",
    };
  }

  if (!pepper) {
    return {
      error:
        "ADMIN_AUTH_PEPPER is not configured.",
    };
  }

  return {
    password,
    pepper,
  };
}

function isConfigurationError(
  configuration:
    | {
        password: string;
        pepper: string;
      }
    | {
        error: string;
      },
): configuration is {
  error: string;
} {
  return "error" in configuration;
}

function isLocalRequest(
  request: Request,
): boolean {
  const hostname =
    new URL(request.url).hostname;

  return (
    hostname === "localhost" ||
    hostname === "127.0.0.1" ||
    hostname === "::1"
  );
}

function bytesToHex(
  bytes: Uint8Array,
): string {
  return Array.from(bytes)
    .map((byte) =>
      byte
        .toString(16)
        .padStart(2, "0"),
    )
    .join("");
}

function bytesToBase64Url(
  bytes: Uint8Array,
): string {
  let binary = "";

  for (const byte of bytes) {
    binary += String.fromCharCode(byte);
  }

  return btoa(binary)
    .replace(/\+/g, "-")
    .replace(/\//g, "_")
    .replace(/=+$/g, "");
}

async function sha256(
  value: string,
): Promise<Uint8Array> {
  const digest =
    await crypto.subtle.digest(
      "SHA-256",
      textEncoder.encode(value),
    );

  return new Uint8Array(digest);
}

async function hashSecret(
  value: string,
  pepper: string,
): Promise<string> {
  return bytesToHex(
    await sha256(
      `${value}:${pepper}`,
    ),
  );
}

async function securelyCompareSecrets(
  suppliedValue: string,
  savedValue: string,
): Promise<boolean> {
  /*
   * Hash both values to fixed-size buffers before
   * comparing them. This avoids leaking either
   * value's length or mismatch location.
   */
  const suppliedDigest =
    await sha256(suppliedValue);

  const savedDigest =
    await sha256(savedValue);

  return crypto.subtle.timingSafeEqual(
    suppliedDigest,
    savedDigest,
  );
}

function generateSessionToken(): string {
  const bytes =
    new Uint8Array(32);

  crypto.getRandomValues(bytes);

  return bytesToBase64Url(bytes);
}

function getClientIp(
  request: Request,
): string {
  return (
    request.headers.get(
      "CF-Connecting-IP",
    ) ??
    request.headers.get(
      "X-Forwarded-For",
    ) ??
    "unknown"
  );
}

function readCookie(
  request: Request,
  cookieName: string,
): string | null {
  const cookieHeader =
    request.headers.get("cookie");

  if (!cookieHeader) {
    return null;
  }

  for (
    const cookie
    of cookieHeader.split(";")
  ) {
    const separatorIndex =
      cookie.indexOf("=");

    if (separatorIndex === -1) {
      continue;
    }

    const name = cookie
      .slice(0, separatorIndex)
      .trim();

    if (name !== cookieName) {
      continue;
    }

    const encodedValue = cookie
      .slice(separatorIndex + 1)
      .trim();

    try {
      return decodeURIComponent(
        encodedValue,
      );
    } catch {
      return encodedValue;
    }
  }

  return null;
}

function createSessionCookie(
  request: Request,
  sessionToken: string,
): string {
  const isSecure =
    new URL(request.url).protocol ===
    "https:";

  return [
    `${ADMIN_SESSION_COOKIE}=${encodeURIComponent(
      sessionToken,
    )}`,
    "HttpOnly",
    "SameSite=Strict",
    "Path=/",
    `Max-Age=${
      SESSION_EXPIRY_HOURS *
      60 *
      60
    }`,
    isSecure ? "Secure" : "",
  ]
    .filter(Boolean)
    .join("; ");
}

function createExpiredSessionCookie(
  request: Request,
): string {
  const isSecure =
    new URL(request.url).protocol ===
    "https:";

  return [
    `${ADMIN_SESSION_COOKIE}=`,
    "HttpOnly",
    "SameSite=Strict",
    "Path=/",
    "Max-Age=0",
    isSecure ? "Secure" : "",
  ]
    .filter(Boolean)
    .join("; ");
}

async function cleanExpiredSessions(
  env: Env,
): Promise<void> {
  await env.gyan_registry
    .prepare(
      `
        DELETE FROM admin_sessions
        WHERE
          expires_at <= CURRENT_TIMESTAMP
          OR revoked_at IS NOT NULL
      `,
    )
    .run();
}

async function getRecentFailedAttempts(
  env: Env,
  requestIp: string,
): Promise<number> {
  /*
   * Reuse admin_login_codes as a simple login-attempt
   * log. No passkey is stored.
   */
  const result =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            COUNT(*) AS attempt_count
          FROM admin_login_codes
          WHERE
            email = ?
            AND request_ip = ?
            AND used_at IS NULL
            AND created_at >= datetime(
              'now',
              ?
            )
        `,
      )
      .bind(
        ADMIN_IDENTITY,
        requestIp,
        `-${LOGIN_WINDOW_MINUTES} minutes`,
      )
      .first<{
        attempt_count:
          number | string;
      }>();

  return Number(
    result?.attempt_count ?? 0,
  );
}

async function recordFailedAttempt(
  env: Env,
  requestIp: string,
): Promise<void> {
  await env.gyan_registry
    .prepare(
      `
        INSERT INTO admin_login_codes (
          email,
          code_hash,
          request_ip,
          expires_at,
          attempt_count
        )
        VALUES (
          ?,
          ?,
          ?,
          datetime(
            'now',
            ?
          ),
          1
        )
      `,
    )
    .bind(
      ADMIN_IDENTITY,
      "password-login-failure",
      requestIp,
      `+${LOGIN_WINDOW_MINUTES} minutes`,
    )
    .run();
}

async function clearFailedAttempts(
  env: Env,
  requestIp: string,
): Promise<void> {
  await env.gyan_registry
    .prepare(
      `
        UPDATE admin_login_codes
        SET used_at =
          CURRENT_TIMESTAMP
        WHERE
          email = ?
          AND request_ip = ?
          AND used_at IS NULL
      `,
    )
    .bind(
      ADMIN_IDENTITY,
      requestIp,
    )
    .run();
}

async function handleLogin(
  request: Request,
  env: AdminAuthEnvironment,
): Promise<Response> {
  const configuration =
    getConfiguration(env);

  if (
    isConfigurationError(
      configuration,
    )
  ) {
    console.error(
      configuration.error,
    );

    return createJsonResponse(
      {
        error:
          isLocalRequest(request)
            ? configuration.error
            : "Administrator login is not configured.",
      },
      503,
    );
  }

  let body: AdminLoginRequest;

  try {
    body =
      (await request.json()) as
        AdminLoginRequest;
  } catch {
    return createJsonResponse(
      {
        error:
          "Request body must be valid JSON.",
      },
      400,
    );
  }

  if (
    typeof body.password !==
      "string" ||
    body.password.length < 8 ||
    body.password.length > 256
  ) {
    return createJsonResponse(
      {
        error:
          "Enter the administrator password.",
      },
      400,
    );
  }

  const requestIp =
    getClientIp(request);

  const failedAttempts =
    await getRecentFailedAttempts(
      env,
      requestIp,
    );

  if (
    failedAttempts >=
    MAX_FAILED_ATTEMPTS
  ) {
    return createJsonResponse(
      {
        error:
          "Too many failed attempts. Please try again later.",
      },
      429,
    );
  }

  const passwordMatches =
    await securelyCompareSecrets(
      body.password,
      configuration.password,
    );

  if (!passwordMatches) {
    await recordFailedAttempt(
      env,
      requestIp,
    );

    return createJsonResponse(
      {
        error:
          "The administrator password is incorrect.",
      },
      401,
    );
  }

  await clearFailedAttempts(
    env,
    requestIp,
  );

  try {
    await cleanExpiredSessions(env);
  } catch (error) {
    console.error(
      "Unable to clean expired sessions:",
      error,
    );
  }

  const sessionToken =
    generateSessionToken();

  const sessionHash =
    await hashSecret(
      sessionToken,
      configuration.pepper,
    );

  await env.gyan_registry
    .prepare(
      `
        INSERT INTO admin_sessions (
          email,
          session_hash,
          expires_at
        )
        VALUES (
          ?,
          ?,
          datetime(
            'now',
            ?
          )
        )
      `,
    )
    .bind(
      ADMIN_IDENTITY,
      sessionHash,
      `+${SESSION_EXPIRY_HOURS} hours`,
    )
    .run();

  return createJsonResponse(
    {
      authenticated: true,
    },
    200,
    {
      "set-cookie":
        createSessionCookie(
          request,
          sessionToken,
        ),
    },
  );
}

export async function getAdminSession(
  request: Request,
  env: Env,
): Promise<AdminSessionRow | null> {
  const authEnvironment =
    env as AdminAuthEnvironment;

  const configuration =
    getConfiguration(
      authEnvironment,
    );

  if (
    isConfigurationError(
      configuration,
    )
  ) {
    return null;
  }

  const sessionToken =
    readCookie(
      request,
      ADMIN_SESSION_COOKIE,
    );

  if (!sessionToken) {
    return null;
  }

  const sessionHash =
    await hashSecret(
      sessionToken,
      configuration.pepper,
    );

  return env.gyan_registry
    .prepare(
      `
        SELECT
          email,
          expires_at
        FROM admin_sessions
        WHERE
          session_hash = ?
          AND revoked_at IS NULL
          AND expires_at >
            CURRENT_TIMESTAMP
        LIMIT 1
      `,
    )
    .bind(sessionHash)
    .first<AdminSessionRow>();
}

async function handleGetSession(
  request: Request,
  env: Env,
): Promise<Response> {
  const session =
    await getAdminSession(
      request,
      env,
    );

  return createJsonResponse({
    authenticated:
      Boolean(session),

    expiresAt:
      session?.expires_at,
  });
}

async function handleLogout(
  request: Request,
  env: AdminAuthEnvironment,
): Promise<Response> {
  const configuration =
    getConfiguration(env);

  const sessionToken =
    readCookie(
      request,
      ADMIN_SESSION_COOKIE,
    );

  if (
    sessionToken &&
    !isConfigurationError(
      configuration,
    )
  ) {
    const sessionHash =
      await hashSecret(
        sessionToken,
        configuration.pepper,
      );

    await env.gyan_registry
      .prepare(
        `
          UPDATE admin_sessions
          SET revoked_at =
            CURRENT_TIMESTAMP
          WHERE session_hash = ?
        `,
      )
      .bind(sessionHash)
      .run();
  }

  return createJsonResponse(
    {
      authenticated: false,
    },
    200,
    {
      "set-cookie":
        createExpiredSessionCookie(
          request,
        ),
    },
  );
}

export async function handleAdminAuthRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  const authEnvironment =
    env as AdminAuthEnvironment;

  if (
    request.method === "POST" &&
    url.pathname ===
      "/api/admin/login"
  ) {
    return handleLogin(
      request,
      authEnvironment,
    );
  }

  if (
    request.method === "GET" &&
    url.pathname ===
      "/api/admin/session"
  ) {
    return handleGetSession(
      request,
      env,
    );
  }

  if (
    request.method === "POST" &&
    url.pathname ===
      "/api/admin/logout"
  ) {
    return handleLogout(
      request,
      authEnvironment,
    );
  }

  return null;
}