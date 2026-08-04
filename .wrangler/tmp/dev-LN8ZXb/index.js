var __defProp = Object.defineProperty;
var __name = (target, value) => __defProp(target, "name", { value, configurable: true });

// worker/adminAuth.ts
var SESSION_EXPIRY_HOURS = 8;
var MAX_FAILED_ATTEMPTS = 10;
var LOGIN_WINDOW_MINUTES = 30;
var ADMIN_SESSION_COOKIE = "gyan_admin_session";
var ADMIN_IDENTITY = "global-admin";
var textEncoder = new TextEncoder();
function createJsonResponse(data, status = 200, additionalHeaders) {
  const headers = new Headers(
    additionalHeaders
  );
  headers.set(
    "content-type",
    "application/json; charset=utf-8"
  );
  headers.set(
    "cache-control",
    "no-store"
  );
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers
    }
  );
}
__name(createJsonResponse, "createJsonResponse");
function getConfiguration(env) {
  const password = env.GYAN_ADMIN_PASSWORD?.trim();
  const pepper = env.ADMIN_AUTH_PEPPER?.trim();
  if (!password) {
    return {
      error: "GYAN_ADMIN_PASSWORD is not configured."
    };
  }
  if (!pepper) {
    return {
      error: "ADMIN_AUTH_PEPPER is not configured."
    };
  }
  return {
    password,
    pepper
  };
}
__name(getConfiguration, "getConfiguration");
function isConfigurationError(configuration) {
  return "error" in configuration;
}
__name(isConfigurationError, "isConfigurationError");
function isLocalRequest(request) {
  const hostname = new URL(request.url).hostname;
  return hostname === "localhost" || hostname === "127.0.0.1" || hostname === "::1";
}
__name(isLocalRequest, "isLocalRequest");
function bytesToHex(bytes) {
  return Array.from(bytes).map(
    (byte) => byte.toString(16).padStart(2, "0")
  ).join("");
}
__name(bytesToHex, "bytesToHex");
function bytesToBase64Url(bytes) {
  let binary = "";
  for (const byte of bytes) {
    binary += String.fromCharCode(byte);
  }
  return btoa(binary).replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/g, "");
}
__name(bytesToBase64Url, "bytesToBase64Url");
async function sha256(value) {
  const digest = await crypto.subtle.digest(
    "SHA-256",
    textEncoder.encode(value)
  );
  return new Uint8Array(digest);
}
__name(sha256, "sha256");
async function hashSecret(value, pepper) {
  return bytesToHex(
    await sha256(
      `${value}:${pepper}`
    )
  );
}
__name(hashSecret, "hashSecret");
async function securelyCompareSecrets(suppliedValue, savedValue) {
  const suppliedDigest = await sha256(suppliedValue);
  const savedDigest = await sha256(savedValue);
  return crypto.subtle.timingSafeEqual(
    suppliedDigest,
    savedDigest
  );
}
__name(securelyCompareSecrets, "securelyCompareSecrets");
function generateSessionToken() {
  const bytes = new Uint8Array(32);
  crypto.getRandomValues(bytes);
  return bytesToBase64Url(bytes);
}
__name(generateSessionToken, "generateSessionToken");
function getClientIp(request) {
  return request.headers.get(
    "CF-Connecting-IP"
  ) ?? request.headers.get(
    "X-Forwarded-For"
  ) ?? "unknown";
}
__name(getClientIp, "getClientIp");
function readCookie(request, cookieName) {
  const cookieHeader = request.headers.get("cookie");
  if (!cookieHeader) {
    return null;
  }
  for (const cookie of cookieHeader.split(";")) {
    const separatorIndex = cookie.indexOf("=");
    if (separatorIndex === -1) {
      continue;
    }
    const name = cookie.slice(0, separatorIndex).trim();
    if (name !== cookieName) {
      continue;
    }
    const encodedValue = cookie.slice(separatorIndex + 1).trim();
    try {
      return decodeURIComponent(
        encodedValue
      );
    } catch {
      return encodedValue;
    }
  }
  return null;
}
__name(readCookie, "readCookie");
function createSessionCookie(request, sessionToken) {
  const isSecure = new URL(request.url).protocol === "https:";
  return [
    `${ADMIN_SESSION_COOKIE}=${encodeURIComponent(
      sessionToken
    )}`,
    "HttpOnly",
    "SameSite=Strict",
    "Path=/",
    `Max-Age=${SESSION_EXPIRY_HOURS * 60 * 60}`,
    isSecure ? "Secure" : ""
  ].filter(Boolean).join("; ");
}
__name(createSessionCookie, "createSessionCookie");
function createExpiredSessionCookie(request) {
  const isSecure = new URL(request.url).protocol === "https:";
  return [
    `${ADMIN_SESSION_COOKIE}=`,
    "HttpOnly",
    "SameSite=Strict",
    "Path=/",
    "Max-Age=0",
    isSecure ? "Secure" : ""
  ].filter(Boolean).join("; ");
}
__name(createExpiredSessionCookie, "createExpiredSessionCookie");
async function cleanExpiredSessions(env) {
  await env.gyan_registry.prepare(
    `
        DELETE FROM admin_sessions
        WHERE
          expires_at <= CURRENT_TIMESTAMP
          OR revoked_at IS NOT NULL
      `
  ).run();
}
__name(cleanExpiredSessions, "cleanExpiredSessions");
async function getRecentFailedAttempts(env, requestIp) {
  const result = await env.gyan_registry.prepare(
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
        `
  ).bind(
    ADMIN_IDENTITY,
    requestIp,
    `-${LOGIN_WINDOW_MINUTES} minutes`
  ).first();
  return Number(
    result?.attempt_count ?? 0
  );
}
__name(getRecentFailedAttempts, "getRecentFailedAttempts");
async function recordFailedAttempt(env, requestIp) {
  await env.gyan_registry.prepare(
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
      `
  ).bind(
    ADMIN_IDENTITY,
    "password-login-failure",
    requestIp,
    `+${LOGIN_WINDOW_MINUTES} minutes`
  ).run();
}
__name(recordFailedAttempt, "recordFailedAttempt");
async function clearFailedAttempts(env, requestIp) {
  await env.gyan_registry.prepare(
    `
        UPDATE admin_login_codes
        SET used_at =
          CURRENT_TIMESTAMP
        WHERE
          email = ?
          AND request_ip = ?
          AND used_at IS NULL
      `
  ).bind(
    ADMIN_IDENTITY,
    requestIp
  ).run();
}
__name(clearFailedAttempts, "clearFailedAttempts");
async function handleLogin(request, env) {
  const configuration = getConfiguration(env);
  if (isConfigurationError(
    configuration
  )) {
    console.error(
      configuration.error
    );
    return createJsonResponse(
      {
        error: isLocalRequest(request) ? configuration.error : "Administrator login is not configured."
      },
      503
    );
  }
  let body;
  try {
    body = await request.json();
  } catch {
    return createJsonResponse(
      {
        error: "Request body must be valid JSON."
      },
      400
    );
  }
  if (typeof body.password !== "string" || body.password.length < 8 || body.password.length > 256) {
    return createJsonResponse(
      {
        error: "Enter the administrator password."
      },
      400
    );
  }
  const requestIp = getClientIp(request);
  const failedAttempts = await getRecentFailedAttempts(
    env,
    requestIp
  );
  if (failedAttempts >= MAX_FAILED_ATTEMPTS) {
    return createJsonResponse(
      {
        error: "Too many failed attempts. Please try again later."
      },
      429
    );
  }
  const passwordMatches = await securelyCompareSecrets(
    body.password,
    configuration.password
  );
  if (!passwordMatches) {
    await recordFailedAttempt(
      env,
      requestIp
    );
    return createJsonResponse(
      {
        error: "The administrator password is incorrect."
      },
      401
    );
  }
  await clearFailedAttempts(
    env,
    requestIp
  );
  try {
    await cleanExpiredSessions(env);
  } catch (error) {
    console.error(
      "Unable to clean expired sessions:",
      error
    );
  }
  const sessionToken = generateSessionToken();
  const sessionHash = await hashSecret(
    sessionToken,
    configuration.pepper
  );
  await env.gyan_registry.prepare(
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
      `
  ).bind(
    ADMIN_IDENTITY,
    sessionHash,
    `+${SESSION_EXPIRY_HOURS} hours`
  ).run();
  return createJsonResponse(
    {
      authenticated: true
    },
    200,
    {
      "set-cookie": createSessionCookie(
        request,
        sessionToken
      )
    }
  );
}
__name(handleLogin, "handleLogin");
async function getAdminSession(request, env) {
  const authEnvironment = env;
  const configuration = getConfiguration(
    authEnvironment
  );
  if (isConfigurationError(
    configuration
  )) {
    return null;
  }
  const sessionToken = readCookie(
    request,
    ADMIN_SESSION_COOKIE
  );
  if (!sessionToken) {
    return null;
  }
  const sessionHash = await hashSecret(
    sessionToken,
    configuration.pepper
  );
  return env.gyan_registry.prepare(
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
      `
  ).bind(sessionHash).first();
}
__name(getAdminSession, "getAdminSession");
async function handleGetSession(request, env) {
  const session = await getAdminSession(
    request,
    env
  );
  return createJsonResponse({
    authenticated: Boolean(session),
    expiresAt: session?.expires_at
  });
}
__name(handleGetSession, "handleGetSession");
async function handleLogout(request, env) {
  const configuration = getConfiguration(env);
  const sessionToken = readCookie(
    request,
    ADMIN_SESSION_COOKIE
  );
  if (sessionToken && !isConfigurationError(
    configuration
  )) {
    const sessionHash = await hashSecret(
      sessionToken,
      configuration.pepper
    );
    await env.gyan_registry.prepare(
      `
          UPDATE admin_sessions
          SET revoked_at =
            CURRENT_TIMESTAMP
          WHERE session_hash = ?
        `
    ).bind(sessionHash).run();
  }
  return createJsonResponse(
    {
      authenticated: false
    },
    200,
    {
      "set-cookie": createExpiredSessionCookie(
        request
      )
    }
  );
}
__name(handleLogout, "handleLogout");
async function handleAdminAuthRoute(request, env, url) {
  const authEnvironment = env;
  if (request.method === "POST" && url.pathname === "/api/admin/login") {
    return handleLogin(
      request,
      authEnvironment
    );
  }
  if (request.method === "GET" && url.pathname === "/api/admin/session") {
    return handleGetSession(
      request,
      env
    );
  }
  if (request.method === "POST" && url.pathname === "/api/admin/logout") {
    return handleLogout(
      request,
      authEnvironment
    );
  }
  return null;
}
__name(handleAdminAuthRoute, "handleAdminAuthRoute");

// worker/adminServices.ts
function createJsonResponse2(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(createJsonResponse2, "createJsonResponse");
function normalizeServiceCode(value) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim().toUpperCase();
  if (!/^[A-Z0-9_]{2,50}$/.test(normalized)) {
    return null;
  }
  return normalized;
}
__name(normalizeServiceCode, "normalizeServiceCode");
function normalizeEnabled(value) {
  if (typeof value !== "boolean") {
    return null;
  }
  return value;
}
__name(normalizeEnabled, "normalizeEnabled");
function normalizeSortOrder(value) {
  if (typeof value !== "number" || !Number.isInteger(value) || value < 0 || value > 9999) {
    return null;
  }
  return value;
}
__name(normalizeSortOrder, "normalizeSortOrder");
function mapGlobalService(row) {
  return {
    id: row.id,
    code: row.service_code,
    type: row.service_type,
    category: row.category,
    subCategory: row.sub_category,
    name: row.name,
    description: row.description ?? "",
    icon: row.icon ?? "\u{1F9E9}",
    color: row.color ?? "#607d8b",
    workflowType: row.workflow_type,
    enabled: row.enabled === 1,
    sortOrder: row.sort_order,
    createdAt: row.created_at,
    updatedAt: row.updated_at
  };
}
__name(mapGlobalService, "mapGlobalService");
async function loadGlobalServices(env) {
  const result = await env.gyan_registry.prepare(
    `
        SELECT
          id,
          service_code,
          service_type,
          category,
          sub_category,
          name,
          description,
          icon,
          color,
          workflow_type,
          enabled,
          sort_order,
          created_at,
          updated_at
        FROM services
        WHERE service_type = 'system'
        ORDER BY
          category ASC,
          sort_order ASC,
          name ASC
      `
  ).all();
  return result.results.map(
    mapGlobalService
  );
}
__name(loadGlobalServices, "loadGlobalServices");
async function requireAdmin(request, env) {
  const session = await getAdminSession(
    request,
    env
  );
  if (!session) {
    return createJsonResponse2(
      {
        error: "Administrator authentication is required."
      },
      401
    );
  }
  return null;
}
__name(requireAdmin, "requireAdmin");
async function handleGetGlobalServices(request, env) {
  const unauthorizedResponse = await requireAdmin(request, env);
  if (unauthorizedResponse) {
    return unauthorizedResponse;
  }
  const services = await loadGlobalServices(env);
  return createJsonResponse2({
    services
  });
}
__name(handleGetGlobalServices, "handleGetGlobalServices");
async function handleUpdateGlobalServices(request, env) {
  const unauthorizedResponse = await requireAdmin(request, env);
  if (unauthorizedResponse) {
    return unauthorizedResponse;
  }
  let body;
  try {
    body = await request.json();
  } catch {
    return createJsonResponse2(
      {
        error: "Request body must be valid JSON."
      },
      400
    );
  }
  if (!Array.isArray(body.services)) {
    return createJsonResponse2(
      {
        error: "A services array is required."
      },
      400
    );
  }
  if (body.services.length === 0) {
    return createJsonResponse2(
      {
        error: "At least one service change is required."
      },
      400
    );
  }
  if (body.services.length > 200) {
    return createJsonResponse2(
      {
        error: "Too many service changes were submitted."
      },
      400
    );
  }
  const normalizedChanges = [];
  const submittedCodes = /* @__PURE__ */ new Set();
  for (const item of body.services) {
    if (typeof item !== "object" || item === null) {
      return createJsonResponse2(
        {
          error: "Each service change must be an object."
        },
        400
      );
    }
    const typedItem = item;
    const code = normalizeServiceCode(
      typedItem.code
    );
    const enabled = normalizeEnabled(
      typedItem.enabled
    );
    const sortOrder = normalizeSortOrder(
      typedItem.sortOrder
    );
    if (!code || enabled === null || sortOrder === null) {
      return createJsonResponse2(
        {
          error: "Each service requires a valid code, enabled value and order from 0 to 9999."
        },
        400
      );
    }
    if (submittedCodes.has(code)) {
      return createJsonResponse2(
        {
          error: `Service ${code} was submitted more than once.`
        },
        400
      );
    }
    submittedCodes.add(code);
    normalizedChanges.push({
      code,
      enabled,
      sortOrder
    });
  }
  const placeholders = normalizedChanges.map(() => "?").join(", ");
  const existingResult = await env.gyan_registry.prepare(
    `
          SELECT service_code
          FROM services
          WHERE
            service_type = 'system'
            AND service_code IN (
              ${placeholders}
            )
        `
  ).bind(
    ...normalizedChanges.map(
      (change) => change.code
    )
  ).all();
  const existingCodes = new Set(
    existingResult.results.map(
      (row) => row.service_code
    )
  );
  const missingCodes = normalizedChanges.map((change) => change.code).filter(
    (code) => !existingCodes.has(code)
  );
  if (missingCodes.length > 0) {
    return createJsonResponse2(
      {
        error: `Unknown global service: ${missingCodes.join(
          ", "
        )}`
      },
      400
    );
  }
  const statements = normalizedChanges.map(
    (change) => env.gyan_registry.prepare(
      `
              UPDATE services
              SET
                enabled = ?,
                sort_order = ?,
                updated_at =
                  CURRENT_TIMESTAMP
              WHERE
                service_code = ?
                AND service_type = 'system'
            `
    ).bind(
      change.enabled ? 1 : 0,
      change.sortOrder,
      change.code
    )
  );
  await env.gyan_registry.batch(
    statements
  );
  const services = await loadGlobalServices(env);
  return createJsonResponse2({
    message: "Changes saved.",
    services
  });
}
__name(handleUpdateGlobalServices, "handleUpdateGlobalServices");
async function handleAdminServicesRoute(request, env, url) {
  if (url.pathname !== "/api/admin/services") {
    return null;
  }
  if (request.method === "GET") {
    return handleGetGlobalServices(
      request,
      env
    );
  }
  if (request.method === "PUT") {
    return handleUpdateGlobalServices(
      request,
      env
    );
  }
  return createJsonResponse2(
    {
      error: "Method not allowed."
    },
    405
  );
}
__name(handleAdminServicesRoute, "handleAdminServicesRoute");

// worker/adminShops.ts
function createJsonResponse3(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(createJsonResponse3, "createJsonResponse");
function normalizeShopCode(value) {
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9]{4}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeShopCode, "normalizeShopCode");
function normalizeServiceCode2(value) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9_]{2,50}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeServiceCode2, "normalizeServiceCode");
function normalizeMode(value) {
  if (value === "inherit" || value === "enabled" || value === "disabled") {
    return value;
  }
  return null;
}
__name(normalizeMode, "normalizeMode");
function normalizeSortOrder2(value) {
  if (value === null || value === void 0 || value === "") {
    return null;
  }
  if (typeof value !== "number" || !Number.isInteger(value) || value < 0 || value > 9999) {
    return "invalid";
  }
  return value;
}
__name(normalizeSortOrder2, "normalizeSortOrder");
async function requireAdmin2(request, env) {
  const session = await getAdminSession(
    request,
    env
  );
  if (session) {
    return null;
  }
  return createJsonResponse3(
    {
      error: "Administrator authentication is required."
    },
    401
  );
}
__name(requireAdmin2, "requireAdmin");
async function loadShop(env, shopCode) {
  return env.gyan_registry.prepare(
    `
        SELECT
          code,
          name,
          address_line,
          city
        FROM shops
        WHERE code = ?
        LIMIT 1
      `
  ).bind(shopCode).first();
}
__name(loadShop, "loadShop");
async function loadShopServices(env, shopCode) {
  const result = await env.gyan_registry.prepare(
    `
          SELECT
            s.id,
            s.service_code,
            s.category,
            s.sub_category,
            s.name,
            s.description,
            s.icon,
            s.color,

            CAST(
              s.enabled AS INTEGER
            ) AS global_enabled,

            s.sort_order
              AS global_sort_order,

            ss.enabled
              AS override_enabled,

            ss.sort_order
              AS override_sort_order

          FROM services s

          LEFT JOIN shop_services ss
            ON ss.service_id = s.id
            AND ss.shop_code = ?

          WHERE
            s.service_type = 'system'

          ORDER BY
            s.category ASC,
            COALESCE(
              ss.sort_order,
              s.sort_order
            ) ASC,
            s.name ASC
        `
  ).bind(shopCode).all();
  return result.results.map(
    (row) => {
      const hasOverride = row.override_enabled !== null;
      const overrideEnabled = hasOverride ? Boolean(
        row.override_enabled
      ) : null;
      const mode = overrideEnabled === null ? "inherit" : overrideEnabled ? "enabled" : "disabled";
      return {
        id: row.id,
        code: row.service_code,
        category: row.category,
        subCategory: row.sub_category,
        name: row.name,
        description: row.description ?? "",
        icon: row.icon ?? "\u{1F9E9}",
        color: row.color ?? "#607d8b",
        globalEnabled: Boolean(
          row.global_enabled
        ),
        globalSortOrder: row.global_sort_order,
        mode,
        overrideEnabled,
        overrideSortOrder: row.override_sort_order,
        effectiveEnabled: overrideEnabled ?? Boolean(
          row.global_enabled
        ),
        effectiveSortOrder: row.override_sort_order ?? row.global_sort_order
      };
    }
  );
}
__name(loadShopServices, "loadShopServices");
async function handleGetShops(request, env) {
  const unauthorized = await requireAdmin2(
    request,
    env
  );
  if (unauthorized) {
    return unauthorized;
  }
  const result = await env.gyan_registry.prepare(
    `
          SELECT
            code,
            name,
            address_line,
            city
          FROM shops
          ORDER BY
            name ASC,
            code ASC
        `
  ).all();
  return createJsonResponse3({
    shops: result.results.map(
      (shop) => ({
        code: shop.code,
        name: shop.name,
        addressLine: shop.address_line,
        city: shop.city
      })
    )
  });
}
__name(handleGetShops, "handleGetShops");
async function handleGetShopServices(request, env, shopCode) {
  const unauthorized = await requireAdmin2(
    request,
    env
  );
  if (unauthorized) {
    return unauthorized;
  }
  const shop = await loadShop(
    env,
    shopCode
  );
  if (!shop) {
    return createJsonResponse3(
      {
        error: "Shop not found."
      },
      404
    );
  }
  const services = await loadShopServices(
    env,
    shopCode
  );
  return createJsonResponse3({
    shop: {
      code: shop.code,
      name: shop.name,
      addressLine: shop.address_line,
      city: shop.city
    },
    services
  });
}
__name(handleGetShopServices, "handleGetShopServices");
async function handleUpdateShopServices(request, env, shopCode) {
  const unauthorized = await requireAdmin2(
    request,
    env
  );
  if (unauthorized) {
    return unauthorized;
  }
  const shop = await loadShop(
    env,
    shopCode
  );
  if (!shop) {
    return createJsonResponse3(
      {
        error: "Shop not found."
      },
      404
    );
  }
  let body;
  try {
    body = await request.json();
  } catch {
    return createJsonResponse3(
      {
        error: "Request body must be valid JSON."
      },
      400
    );
  }
  if (!Array.isArray(
    body.services
  ) || body.services.length === 0) {
    return createJsonResponse3(
      {
        error: "At least one service change is required."
      },
      400
    );
  }
  const normalizedChanges = [];
  const codes = /* @__PURE__ */ new Set();
  for (const rawChange of body.services) {
    if (typeof rawChange !== "object" || rawChange === null) {
      return createJsonResponse3(
        {
          error: "Each service change must be an object."
        },
        400
      );
    }
    const change = rawChange;
    const code = normalizeServiceCode2(
      change.code
    );
    const mode = normalizeMode(
      change.mode
    );
    const sortOrder = normalizeSortOrder2(
      change.sortOrder
    );
    if (!code || !mode || sortOrder === "invalid") {
      return createJsonResponse3(
        {
          error: "Each service requires a valid code, mode and optional order from 0 to 9999."
        },
        400
      );
    }
    if (codes.has(code)) {
      return createJsonResponse3(
        {
          error: `${code} was submitted more than once.`
        },
        400
      );
    }
    codes.add(code);
    normalizedChanges.push({
      code,
      mode,
      sortOrder: mode === "inherit" ? null : sortOrder
    });
  }
  const serviceRows = await env.gyan_registry.prepare(
    `
          SELECT
            id,
            service_code,
            sort_order
          FROM services
          WHERE service_type = 'system'
        `
  ).all();
  const serviceMap = new Map(
    serviceRows.results.map(
      (service) => [
        service.service_code,
        service
      ]
    )
  );
  const statements = [];
  for (const change of normalizedChanges) {
    const service = serviceMap.get(
      change.code
    );
    if (!service) {
      return createJsonResponse3(
        {
          error: `Unknown service: ${change.code}`
        },
        400
      );
    }
    if (change.mode === "inherit") {
      statements.push(
        env.gyan_registry.prepare(
          `
              DELETE FROM shop_services
              WHERE
                shop_code = ?
                AND service_id = ?
            `
        ).bind(
          shopCode,
          service.id
        )
      );
      continue;
    }
    const enabled = change.mode === "enabled" ? 1 : 0;
    const sortOrder = change.sortOrder ?? service.sort_order;
    statements.push(
      env.gyan_registry.prepare(
        `
            INSERT INTO shop_services (
              shop_code,
              service_id,
              enabled,
              sort_order,
              updated_at
            )
            VALUES (
              ?,
              ?,
              ?,
              ?,
              CURRENT_TIMESTAMP
            )

            ON CONFLICT(
              shop_code,
              service_id
            )
            DO UPDATE SET
              enabled =
                excluded.enabled,

              sort_order =
                excluded.sort_order,

              updated_at =
                CURRENT_TIMESTAMP
          `
      ).bind(
        shopCode,
        service.id,
        enabled,
        sortOrder
      )
    );
  }
  await env.gyan_registry.batch(
    statements
  );
  return createJsonResponse3({
    message: "Changes saved.",
    shop: {
      code: shop.code,
      name: shop.name,
      addressLine: shop.address_line,
      city: shop.city
    },
    services: await loadShopServices(
      env,
      shopCode
    )
  });
}
__name(handleUpdateShopServices, "handleUpdateShopServices");
async function handleAdminShopsRoute(request, env, url) {
  if (request.method === "GET" && url.pathname === "/api/admin/shops") {
    return handleGetShops(
      request,
      env
    );
  }
  const match = url.pathname.match(
    /^\/api\/admin\/shops\/([A-Za-z0-9]{4})\/services$/
  );
  if (!match) {
    return null;
  }
  const shopCode = normalizeShopCode(
    match[1]
  );
  if (!shopCode) {
    return createJsonResponse3(
      {
        error: "Invalid shop code."
      },
      400
    );
  }
  if (request.method === "GET") {
    return handleGetShopServices(
      request,
      env,
      shopCode
    );
  }
  if (request.method === "PUT") {
    return handleUpdateShopServices(
      request,
      env,
      shopCode
    );
  }
  return createJsonResponse3(
    {
      error: "Method not allowed."
    },
    405
  );
}
__name(handleAdminShopsRoute, "handleAdminShopsRoute");

// worker/serviceCatalog.ts
function createJsonResponse4(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(createJsonResponse4, "createJsonResponse");
function normalizeShopCode2(value) {
  const normalized = value.trim().toUpperCase();
  if (!/^[A-Z0-9]{4}$/.test(
    normalized
  )) {
    return null;
  }
  return normalized;
}
__name(normalizeShopCode2, "normalizeShopCode");
function mapServiceRow(row) {
  return {
    id: row.id,
    code: row.service_code,
    type: row.service_type,
    category: row.category,
    subCategory: row.sub_category,
    name: row.display_name ?? row.name,
    catalogName: row.name,
    description: row.description_override ?? row.description ?? "",
    icon: row.icon_override ?? row.icon ?? "\u{1F9E9}",
    color: row.color_override ?? row.color ?? "#607d8b",
    workflowType: row.workflow_type,
    enabled: Boolean(
      row.effective_enabled
    ),
    priceType: row.price_type ?? "contact",
    priceAmountPaise: row.price_amount_paise,
    priceNote: row.price_note ?? "",
    sortOrder: row.effective_sort_order,
    custom: row.service_type === "custom"
  };
}
__name(mapServiceRow, "mapServiceRow");
async function getGlobalServices(env) {
  const result = await env.gyan_registry.prepare(
    `
          SELECT
            s.id,
            s.service_code,
            s.service_type,

            s.category,
            s.sub_category,

            s.name,
            s.description,

            s.icon,
            s.color,

            s.workflow_type,
            s.owner_shop_code,

            CAST(
              s.enabled AS INTEGER
            ) AS effective_enabled,

            s.sort_order
              AS effective_sort_order,

            NULL AS display_name,
            NULL AS description_override,
            NULL AS icon_override,
            NULL AS color_override,

            'contact' AS price_type,
            NULL AS price_amount_paise,
            NULL AS price_note

          FROM services s

          WHERE
            s.service_type =
              'system'

          ORDER BY
            s.category ASC,
            s.sort_order ASC,
            s.name ASC
        `
  ).all();
  return createJsonResponse4({
    services: result.results.map(
      mapServiceRow
    )
  });
}
__name(getGlobalServices, "getGlobalServices");
async function getShopServices(env, rawShopCode) {
  const shopCode = normalizeShopCode2(
    rawShopCode
  );
  if (!shopCode) {
    return createJsonResponse4(
      {
        error: "Invalid shop code."
      },
      400
    );
  }
  const shop = await env.gyan_registry.prepare(
    `
          SELECT code
          FROM shops
          WHERE code = ?
          LIMIT 1
        `
  ).bind(shopCode).first();
  if (!shop) {
    return createJsonResponse4(
      {
        error: "Shop not found."
      },
      404
    );
  }
  const result = await env.gyan_registry.prepare(
    `
          SELECT
            s.id,
            s.service_code,
            s.service_type,

            s.category,
            s.sub_category,

            s.name,
            s.description,

            s.icon,
            s.color,

            s.workflow_type,
            s.owner_shop_code,

            CAST(
              COALESCE(
                ss.enabled,
                s.enabled
              )
              AS INTEGER
            ) AS effective_enabled,

            COALESCE(
              ss.sort_order,
              s.sort_order
            ) AS effective_sort_order,

            ss.display_name,
            ss.description_override,
            ss.icon_override,
            ss.color_override,

            COALESCE(
              ss.price_type,
              'contact'
            ) AS price_type,

            ss.price_amount_paise,
            ss.price_note

          FROM services s

          LEFT JOIN shop_services ss
            ON ss.service_id = s.id
            AND ss.shop_code = ?

          WHERE
            s.service_type =
              'system'

            OR s.owner_shop_code = ?

          ORDER BY
            s.category ASC,
            effective_sort_order ASC,
            s.name ASC
        `
  ).bind(
    shopCode,
    shopCode
  ).all();
  return createJsonResponse4({
    shopCode,
    services: result.results.map(
      mapServiceRow
    )
  });
}
__name(getShopServices, "getShopServices");
async function handleServiceCatalogRoute(request, env, url) {
  if (request.method === "GET" && url.pathname === "/api/services") {
    return getGlobalServices(env);
  }
  const shopServicesMatch = url.pathname.match(
    /^\/api\/shops\/([A-Za-z0-9]{4})\/services$/
  );
  if (request.method === "GET" && shopServicesMatch) {
    return getShopServices(
      env,
      shopServicesMatch[1]
    );
  }
  return null;
}
__name(handleServiceCatalogRoute, "handleServiceCatalogRoute");

// worker/index.ts
function createJsonResponse5(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
__name(createJsonResponse5, "createJsonResponse");
function normalizeShopCode3(value) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9]{4}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeShopCode3, "normalizeShopCode");
function normalizeRequiredText(value) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim();
  return normalized.length > 0 ? normalized : null;
}
__name(normalizeRequiredText, "normalizeRequiredText");
function normalizeOptionalText(value) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim();
  return normalized.length > 0 ? normalized : null;
}
__name(normalizeOptionalText, "normalizeOptionalText");
function mapShopRow(row) {
  return {
    code: row.code,
    name: row.name,
    ownerName: row.owner_name,
    phoneNumber: row.phone_number,
    whatsAppNumber: row.whatsapp_number ?? "",
    emailAddress: row.email_address ?? "",
    addressLine: row.address_line,
    city: row.city,
    state: row.state,
    postalCode: row.postal_code,
    status: row.status,
    createdAt: row.created_at,
    updatedAt: row.updated_at
  };
}
__name(mapShopRow, "mapShopRow");
async function findShopByCode(env, code) {
  return env.gyan_registry.prepare(
    `
        SELECT
          code,
          name,
          owner_name,
          phone_number,
          whatsapp_number,
          email_address,
          address_line,
          city,
          state,
          postal_code,
          status,
          created_at,
          updated_at

        FROM shops

        WHERE code = ?

        LIMIT 1
      `
  ).bind(code).first();
}
__name(findShopByCode, "findShopByCode");
async function handleGetShop(env, rawShopCode) {
  const shopCode = normalizeShopCode3(
    rawShopCode
  );
  if (!shopCode) {
    return createJsonResponse5(
      {
        error: "Invalid shop code."
      },
      400
    );
  }
  const shop = await findShopByCode(
    env,
    shopCode
  );
  if (!shop) {
    return createJsonResponse5(
      {
        error: "Shop not found."
      },
      404
    );
  }
  if (shop.status !== "active") {
    return createJsonResponse5(
      {
        error: "Shop is not active."
      },
      403
    );
  }
  return createJsonResponse5({
    shop: mapShopRow(shop)
  });
}
__name(handleGetShop, "handleGetShop");
async function handleRegisterShop(request, env) {
  let requestBody;
  try {
    requestBody = await request.json();
  } catch {
    return createJsonResponse5(
      {
        error: "Request body must be valid JSON."
      },
      400
    );
  }
  const code = normalizeShopCode3(
    requestBody.code
  );
  const name = normalizeRequiredText(
    requestBody.name
  );
  const ownerName = normalizeRequiredText(
    requestBody.ownerName
  );
  const phoneNumber = normalizeRequiredText(
    requestBody.phoneNumber
  );
  const whatsAppNumber = normalizeOptionalText(
    requestBody.whatsAppNumber
  );
  const emailAddress = normalizeOptionalText(
    requestBody.emailAddress
  );
  const addressLine = normalizeRequiredText(
    requestBody.addressLine
  );
  const city = normalizeRequiredText(
    requestBody.city
  );
  const state = normalizeRequiredText(
    requestBody.state
  );
  const postalCode = normalizeRequiredText(
    requestBody.postalCode
  );
  if (!code || !name || !ownerName || !phoneNumber || !addressLine || !city || !state || !postalCode) {
    return createJsonResponse5(
      {
        error: "Shop code, shop name, owner, phone and address are required."
      },
      400
    );
  }
  const existingShop = await env.gyan_registry.prepare(
    `
          SELECT code

          FROM shops

          WHERE code = ?

          LIMIT 1
        `
  ).bind(code).first();
  if (existingShop) {
    return createJsonResponse5(
      {
        error: "This shop code is already registered. Please generate another code."
      },
      409
    );
  }
  try {
    await env.gyan_registry.prepare(
      `
          INSERT INTO shops (
            code,
            name,
            owner_name,
            phone_number,
            whatsapp_number,
            email_address,
            address_line,
            city,
            state,
            postal_code,
            status
          )
          VALUES (
            ?,
            ?,
            ?,
            ?,
            ?,
            ?,
            ?,
            ?,
            ?,
            ?,
            'active'
          )
        `
    ).bind(
      code,
      name,
      ownerName,
      phoneNumber,
      whatsAppNumber,
      emailAddress,
      addressLine,
      city,
      state,
      postalCode
    ).run();
  } catch (error) {
    console.error(
      "Shop registration failed:",
      error
    );
    return createJsonResponse5(
      {
        error: "The shop could not be registered."
      },
      500
    );
  }
  const createdShop = await findShopByCode(
    env,
    code
  );
  if (!createdShop) {
    return createJsonResponse5(
      {
        error: "The shop was saved but could not be loaded."
      },
      500
    );
  }
  return createJsonResponse5(
    {
      shop: mapShopRow(
        createdShop
      )
    },
    201
  );
}
__name(handleRegisterShop, "handleRegisterShop");
async function handleApiRequest(request, env, url) {
  const adminAuthResponse = await handleAdminAuthRoute(
    request,
    env,
    url
  );
  if (adminAuthResponse) {
    return adminAuthResponse;
  }
  const adminServicesResponse = await handleAdminServicesRoute(
    request,
    env,
    url
  );
  if (adminServicesResponse) {
    return adminServicesResponse;
  }
  const adminShopsResponse = await handleAdminShopsRoute(
    request,
    env,
    url
  );
  if (adminShopsResponse) {
    return adminShopsResponse;
  }
  const serviceCatalogResponse = await handleServiceCatalogRoute(
    request,
    env,
    url
  );
  if (serviceCatalogResponse) {
    return serviceCatalogResponse;
  }
  if (request.method === "GET" && url.pathname === "/api/health") {
    return createJsonResponse5({
      status: "ok",
      service: "GYAN Cloud Shop Registry"
    });
  }
  if (request.method === "POST" && url.pathname === "/api/shops") {
    return handleRegisterShop(
      request,
      env
    );
  }
  const shopRouteMatch = url.pathname.match(
    /^\/api\/shops\/([A-Za-z0-9]{4})$/
  );
  if (request.method === "GET" && shopRouteMatch) {
    return handleGetShop(
      env,
      shopRouteMatch[1]
    );
  }
  return createJsonResponse5(
    {
      error: "API route not found."
    },
    404
  );
}
__name(handleApiRequest, "handleApiRequest");
var worker_default = {
  async fetch(request, env) {
    const url = new URL(request.url);
    try {
      if (url.pathname.startsWith(
        "/api/"
      )) {
        return await handleApiRequest(
          request,
          env,
          url
        );
      }
      return env.ASSETS.fetch(
        request
      );
    } catch (error) {
      console.error(
        "Unhandled Worker error:",
        error
      );
      return createJsonResponse5(
        {
          error: "An unexpected server error occurred."
        },
        500
      );
    }
  }
};

// ../../Tools/npm-cache/_npx/32026684e21afda6/node_modules/wrangler/templates/middleware/middleware-ensure-req-body-drained.ts
var drainBody = /* @__PURE__ */ __name(async (request, env, _ctx, middlewareCtx) => {
  try {
    return await middlewareCtx.next(request, env);
  } finally {
    try {
      if (request.body !== null && !request.bodyUsed) {
        const reader = request.body.getReader();
        while (!(await reader.read()).done) {
        }
      }
    } catch (e) {
      console.error("Failed to drain the unused request body.", e);
    }
  }
}, "drainBody");
var middleware_ensure_req_body_drained_default = drainBody;

// ../../Tools/npm-cache/_npx/32026684e21afda6/node_modules/wrangler/templates/middleware/middleware-miniflare3-json-error.ts
function reduceError(e) {
  return {
    name: e?.name,
    message: e?.message ?? String(e),
    stack: e?.stack,
    cause: e?.cause === void 0 ? void 0 : reduceError(e.cause)
  };
}
__name(reduceError, "reduceError");
var jsonError = /* @__PURE__ */ __name(async (request, env, _ctx, middlewareCtx) => {
  try {
    return await middlewareCtx.next(request, env);
  } catch (e) {
    const error = reduceError(e);
    const body = JSON.stringify(error);
    const headers = {
      "Content-Type": "application/json",
      "MF-Experimental-Error-Stack": "true"
    };
    const encoded = encodeURIComponent(body);
    if (encoded.length <= 8192) {
      headers["MF-Experimental-Error-Stack-Payload"] = encoded;
    }
    return new Response(body, { status: 500, headers });
  }
}, "jsonError");
var middleware_miniflare3_json_error_default = jsonError;

// .wrangler/tmp/bundle-kuAIJw/middleware-insertion-facade.js
var __INTERNAL_WRANGLER_MIDDLEWARE__ = [
  middleware_ensure_req_body_drained_default,
  middleware_miniflare3_json_error_default
];
var middleware_insertion_facade_default = worker_default;

// ../../Tools/npm-cache/_npx/32026684e21afda6/node_modules/wrangler/templates/middleware/common.ts
var __facade_middleware__ = [];
function __facade_register__(...args) {
  __facade_middleware__.push(...args.flat());
}
__name(__facade_register__, "__facade_register__");
function __facade_invokeChain__(request, env, ctx, dispatch, middlewareChain) {
  const [head, ...tail] = middlewareChain;
  const middlewareCtx = {
    dispatch,
    next(newRequest, newEnv) {
      return __facade_invokeChain__(newRequest, newEnv, ctx, dispatch, tail);
    }
  };
  return head(request, env, ctx, middlewareCtx);
}
__name(__facade_invokeChain__, "__facade_invokeChain__");
function __facade_invoke__(request, env, ctx, dispatch, finalMiddleware) {
  return __facade_invokeChain__(request, env, ctx, dispatch, [
    ...__facade_middleware__,
    finalMiddleware
  ]);
}
__name(__facade_invoke__, "__facade_invoke__");

// .wrangler/tmp/bundle-kuAIJw/middleware-loader.entry.ts
var __Facade_ScheduledController__ = class ___Facade_ScheduledController__ {
  constructor(scheduledTime, cron, noRetry) {
    this.scheduledTime = scheduledTime;
    this.cron = cron;
    this.#noRetry = noRetry;
  }
  scheduledTime;
  cron;
  static {
    __name(this, "__Facade_ScheduledController__");
  }
  #noRetry;
  noRetry() {
    if (!(this instanceof ___Facade_ScheduledController__)) {
      throw new TypeError("Illegal invocation");
    }
    this.#noRetry();
  }
};
function wrapExportedHandler(worker) {
  if (__INTERNAL_WRANGLER_MIDDLEWARE__ === void 0 || __INTERNAL_WRANGLER_MIDDLEWARE__.length === 0) {
    return worker;
  }
  for (const middleware of __INTERNAL_WRANGLER_MIDDLEWARE__) {
    __facade_register__(middleware);
  }
  const fetchDispatcher = /* @__PURE__ */ __name(function(request, env, ctx) {
    if (worker.fetch === void 0) {
      throw new Error("Handler does not export a fetch() function.");
    }
    return worker.fetch(request, env, ctx);
  }, "fetchDispatcher");
  return {
    ...worker,
    fetch(request, env, ctx) {
      const dispatcher = /* @__PURE__ */ __name(function(type, init) {
        if (type === "scheduled" && worker.scheduled !== void 0) {
          const controller = new __Facade_ScheduledController__(
            Date.now(),
            init.cron ?? "",
            () => {
            }
          );
          return worker.scheduled(controller, env, ctx);
        }
      }, "dispatcher");
      return __facade_invoke__(request, env, ctx, dispatcher, fetchDispatcher);
    }
  };
}
__name(wrapExportedHandler, "wrapExportedHandler");
function wrapWorkerEntrypoint(klass) {
  if (__INTERNAL_WRANGLER_MIDDLEWARE__ === void 0 || __INTERNAL_WRANGLER_MIDDLEWARE__.length === 0) {
    return klass;
  }
  for (const middleware of __INTERNAL_WRANGLER_MIDDLEWARE__) {
    __facade_register__(middleware);
  }
  return class extends klass {
    #fetchDispatcher = /* @__PURE__ */ __name((request, env, ctx) => {
      this.env = env;
      this.ctx = ctx;
      if (super.fetch === void 0) {
        throw new Error("Entrypoint class does not define a fetch() function.");
      }
      return super.fetch(request);
    }, "#fetchDispatcher");
    #dispatcher = /* @__PURE__ */ __name((type, init) => {
      if (type === "scheduled" && super.scheduled !== void 0) {
        const controller = new __Facade_ScheduledController__(
          Date.now(),
          init.cron ?? "",
          () => {
          }
        );
        return super.scheduled(controller);
      }
    }, "#dispatcher");
    fetch(request) {
      return __facade_invoke__(
        request,
        this.env,
        this.ctx,
        this.#dispatcher,
        this.#fetchDispatcher
      );
    }
  };
}
__name(wrapWorkerEntrypoint, "wrapWorkerEntrypoint");
var WRAPPED_ENTRY;
if (typeof middleware_insertion_facade_default === "object") {
  WRAPPED_ENTRY = wrapExportedHandler(middleware_insertion_facade_default);
} else if (typeof middleware_insertion_facade_default === "function") {
  WRAPPED_ENTRY = wrapWorkerEntrypoint(middleware_insertion_facade_default);
}
var middleware_loader_entry_default = WRAPPED_ENTRY;
export {
  __INTERNAL_WRANGLER_MIDDLEWARE__,
  middleware_loader_entry_default as default
};
//# sourceMappingURL=index.js.map
