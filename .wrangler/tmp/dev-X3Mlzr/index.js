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
function normalizeRequiredText(value, maximumLength) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim();
  if (normalized.length === 0 || normalized.length > maximumLength) {
    return null;
  }
  return normalized;
}
__name(normalizeRequiredText, "normalizeRequiredText");
function normalizeOptionalText(value, maximumLength) {
  if (value === null || value === void 0 || value === "") {
    return null;
  }
  if (typeof value !== "string") {
    return "invalid";
  }
  const normalized = value.trim();
  if (!normalized) {
    return null;
  }
  if (normalized.length > maximumLength) {
    return "invalid";
  }
  return normalized;
}
__name(normalizeOptionalText, "normalizeOptionalText");
function normalizeEmail(value) {
  const normalized = normalizeOptionalText(
    value,
    254
  );
  if (normalized === null || normalized === "invalid") {
    return normalized;
  }
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
    normalized
  ) ? normalized : "invalid";
}
__name(normalizeEmail, "normalizeEmail");
function normalizeStatus(value) {
  if (value === "active" || value === "inactive") {
    return value;
  }
  return null;
}
__name(normalizeStatus, "normalizeStatus");
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
function mapShop(shop) {
  return {
    code: shop.code,
    name: shop.name,
    ownerName: shop.owner_name,
    phoneNumber: shop.phone_number,
    whatsAppNumber: shop.whatsapp_number ?? "",
    emailAddress: shop.email_address ?? "",
    addressLine: shop.address_line,
    city: shop.city,
    state: shop.state,
    postalCode: shop.postal_code,
    status: shop.status,
    createdAt: shop.created_at,
    updatedAt: shop.updated_at
  };
}
__name(mapShop, "mapShop");
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

          ORDER BY
            name ASC,
            code ASC
        `
  ).all();
  return createJsonResponse3({
    shops: result.results.map(
      mapShop
    )
  });
}
__name(handleGetShops, "handleGetShops");
async function handleGetShopInformation(request, env, shopCode) {
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
  return createJsonResponse3({
    shop: mapShop(shop)
  });
}
__name(handleGetShopInformation, "handleGetShopInformation");
async function handleUpdateShopInformation(request, env, shopCode) {
  const unauthorized = await requireAdmin2(
    request,
    env
  );
  if (unauthorized) {
    return unauthorized;
  }
  const existingShop = await loadShop(
    env,
    shopCode
  );
  if (!existingShop) {
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
  const name = normalizeRequiredText(
    body.name,
    150
  );
  const ownerName = normalizeRequiredText(
    body.ownerName,
    150
  );
  const phoneNumber = normalizeRequiredText(
    body.phoneNumber,
    40
  );
  const whatsAppNumber = normalizeOptionalText(
    body.whatsAppNumber,
    40
  );
  const emailAddress = normalizeEmail(
    body.emailAddress
  );
  const addressLine = normalizeRequiredText(
    body.addressLine,
    250
  );
  const city = normalizeRequiredText(
    body.city,
    100
  );
  const state = normalizeRequiredText(
    body.state,
    100
  );
  const postalCode = normalizeRequiredText(
    body.postalCode,
    30
  );
  const status = normalizeStatus(
    body.status
  );
  if (!name || !ownerName || !phoneNumber || whatsAppNumber === "invalid" || emailAddress === "invalid" || !addressLine || !city || !state || !postalCode || !status) {
    return createJsonResponse3(
      {
        error: "Please provide valid shop, owner, contact, address and status information."
      },
      400
    );
  }
  await env.gyan_registry.prepare(
    `
        UPDATE shops

        SET
          name = ?,
          owner_name = ?,
          phone_number = ?,
          whatsapp_number = ?,
          email_address = ?,
          address_line = ?,
          city = ?,
          state = ?,
          postal_code = ?,
          status = ?,
          updated_at =
            CURRENT_TIMESTAMP

        WHERE code = ?
      `
  ).bind(
    name,
    ownerName,
    phoneNumber,
    whatsAppNumber,
    emailAddress,
    addressLine,
    city,
    state,
    postalCode,
    status,
    shopCode
  ).run();
  const updatedShop = await loadShop(
    env,
    shopCode
  );
  if (!updatedShop) {
    return createJsonResponse3(
      {
        error: "The shop was updated but could not be reloaded."
      },
      500
    );
  }
  return createJsonResponse3({
    message: "Shop information saved.",
    shop: mapShop(updatedShop)
  });
}
__name(handleUpdateShopInformation, "handleUpdateShopInformation");
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
    shop: mapShop(shop),
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

          WHERE
            service_type =
              'system'
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
              DELETE FROM
                shop_services

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
    shop: mapShop(shop),
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
  const servicesMatch = url.pathname.match(
    /^\/api\/admin\/shops\/([A-Za-z0-9]{4})\/services$/
  );
  if (servicesMatch) {
    const shopCode2 = normalizeShopCode(
      servicesMatch[1]
    );
    if (!shopCode2) {
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
        shopCode2
      );
    }
    if (request.method === "PUT") {
      return handleUpdateShopServices(
        request,
        env,
        shopCode2
      );
    }
    return createJsonResponse3(
      {
        error: "Method not allowed."
      },
      405
    );
  }
  const informationMatch = url.pathname.match(
    /^\/api\/admin\/shops\/([A-Za-z0-9]{4})$/
  );
  if (!informationMatch) {
    return null;
  }
  const shopCode = normalizeShopCode(
    informationMatch[1]
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
    return handleGetShopInformation(
      request,
      env,
      shopCode
    );
  }
  if (request.method === "PUT") {
    return handleUpdateShopInformation(
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

// worker/storageGuard.ts
var DEFAULT_WARNING_BYTES = 8 * 1024 * 1024 * 1024;
var DEFAULT_STOP_BYTES = 9 * 1024 * 1024 * 1024;
var DEFAULT_RETENTION_DAYS = 15;
var CLEANUP_SAFETY_DAYS = 1;
function parseBoolean(value, fallback) {
  if (value === "true") {
    return true;
  }
  if (value === "false") {
    return false;
  }
  return fallback;
}
__name(parseBoolean, "parseBoolean");
function parseNonNegativeNumber(value, fallback) {
  const parsed = Number(value);
  if (!Number.isFinite(parsed) || parsed < 0) {
    return fallback;
  }
  return parsed;
}
__name(parseNonNegativeNumber, "parseNonNegativeNumber");
async function getStorageUsageSettings(env) {
  const result = await env.gyan_registry.prepare(
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
        `
  ).all();
  const settings = new Map(
    result.results.map(
      (row) => [
        row.setting_key,
        row.setting_value
      ]
    )
  );
  return {
    uploadsEnabled: parseBoolean(
      settings.get(
        "uploads_enabled"
      ),
      true
    ),
    warningBytes: parseNonNegativeNumber(
      settings.get(
        "storage_warning_bytes"
      ),
      DEFAULT_WARNING_BYTES
    ),
    stopBytes: parseNonNegativeNumber(
      settings.get(
        "storage_stop_bytes"
      ),
      DEFAULT_STOP_BYTES
    ),
    usedBytes: parseNonNegativeNumber(
      settings.get(
        "storage_used_bytes"
      ),
      0
    ),
    warningActive: parseBoolean(
      settings.get(
        "storage_warning_active"
      ),
      false
    ),
    retentionDays: Math.max(
      1,
      Math.floor(
        parseNonNegativeNumber(
          settings.get(
            "file_retention_days"
          ),
          DEFAULT_RETENTION_DAYS
        )
      )
    )
  };
}
__name(getStorageUsageSettings, "getStorageUsageSettings");
async function assertUploadCapacity(env, incomingBytes) {
  const settings = await getStorageUsageSettings(
    env
  );
  const projectedBytes = settings.usedBytes + incomingBytes;
  if (!settings.uploadsEnabled) {
    return {
      allowed: false,
      error: "File uploads are temporarily paused. Please contact the shop.",
      status: 503,
      usedBytes: settings.usedBytes,
      projectedBytes,
      stopBytes: settings.stopBytes
    };
  }
  if (projectedBytes >= settings.stopBytes) {
    return {
      allowed: false,
      error: "File uploads are temporarily unavailable because storage capacity is nearly full. Please contact the shop.",
      status: 507,
      usedBytes: settings.usedBytes,
      projectedBytes,
      stopBytes: settings.stopBytes
    };
  }
  return {
    allowed: true,
    warningActive: projectedBytes >= settings.warningBytes,
    projectedBytes,
    stopBytes: settings.stopBytes
  };
}
__name(assertUploadCapacity, "assertUploadCapacity");
async function addStoredBytes(env, addedBytes) {
  if (addedBytes <= 0) {
    return;
  }
  const settings = await getStorageUsageSettings(
    env
  );
  const updatedBytes = settings.usedBytes + addedBytes;
  const warningActive = updatedBytes >= settings.warningBytes;
  const uploadsEnabled = updatedBytes < settings.stopBytes;
  await env.gyan_registry.batch([
    env.gyan_registry.prepare(
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
        `
    ).bind(
      String(updatedBytes)
    ),
    env.gyan_registry.prepare(
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
        `
    ).bind(
      warningActive ? "true" : "false"
    ),
    env.gyan_registry.prepare(
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
        `
    ).bind(
      uploadsEnabled ? "true" : "false"
    )
  ]);
}
__name(addStoredBytes, "addStoredBytes");
async function removeStoredBytes(env, removedBytes) {
  if (removedBytes <= 0) {
    return;
  }
  const settings = await getStorageUsageSettings(
    env
  );
  const updatedBytes = Math.max(
    0,
    settings.usedBytes - removedBytes
  );
  const warningActive = updatedBytes >= settings.warningBytes;
  const uploadsEnabled = updatedBytes < settings.stopBytes;
  await env.gyan_registry.batch([
    env.gyan_registry.prepare(
      `
          UPDATE system_settings

          SET
            setting_value = ?,
            updated_at =
              CURRENT_TIMESTAMP

          WHERE setting_key =
            'storage_used_bytes'
        `
    ).bind(
      String(updatedBytes)
    ),
    env.gyan_registry.prepare(
      `
          UPDATE system_settings

          SET
            setting_value = ?,
            updated_at =
              CURRENT_TIMESTAMP

          WHERE setting_key =
            'storage_warning_active'
        `
    ).bind(
      warningActive ? "true" : "false"
    ),
    env.gyan_registry.prepare(
      `
          UPDATE system_settings

          SET
            setting_value = ?,
            updated_at =
              CURRENT_TIMESTAMP

          WHERE setting_key =
            'uploads_enabled'
        `
    ).bind(
      uploadsEnabled ? "true" : "false"
    )
  ]);
}
__name(removeStoredBytes, "removeStoredBytes");
async function reconcileExpiredStorage(env) {
  const settings = await getStorageUsageSettings(
    env
  );
  const reconciliationAgeDays = settings.retentionDays + CLEANUP_SAFETY_DAYS;
  const ageModifier = `-${reconciliationAgeDays} days`;
  const expiredStorage = await env.gyan_registry.prepare(
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
        `
  ).bind(ageModifier).first();
  const removedBytes = Number(
    expiredStorage?.total_bytes ?? 0
  );
  const expiredFileCount = Number(
    expiredStorage?.file_count ?? 0
  );
  if (expiredFileCount === 0) {
    return {
      expiredFileCount: 0,
      removedBytes: 0
    };
  }
  await env.gyan_registry.prepare(
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
      `
  ).bind(ageModifier).run();
  await removeStoredBytes(
    env,
    removedBytes
  );
  return {
    expiredFileCount,
    removedBytes
  };
}
__name(reconcileExpiredStorage, "reconcileExpiredStorage");

// worker/shopNotifications.ts
function escapeHtml(value) {
  return value.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll('"', "&quot;").replaceAll("'", "&#039;");
}
__name(escapeHtml, "escapeHtml");
function formatSetting(value) {
  return value.replaceAll("-", " ").replace(
    /\b\w/g,
    (character) => character.toUpperCase()
  );
}
__name(formatSetting, "formatSetting");
function normalizeWhatsAppNumber(value) {
  let digits = value.replace(/\D/g, "");
  if (digits.length === 10) {
    digits = `91${digits}`;
  }
  return digits;
}
__name(normalizeWhatsAppNumber, "normalizeWhatsAppNumber");
function createWhatsAppLink(whatsAppNumber, orderNumber, customerName) {
  const normalizedNumber = normalizeWhatsAppNumber(
    whatsAppNumber
  );
  if (!normalizedNumber) {
    return null;
  }
  const message = [
    `Hello ${customerName},`,
    "",
    `We received your GYAN print request ${orderNumber}.`,
    "We will review the documents and confirm the final amount shortly."
  ].join("\n");
  return `https://wa.me/${normalizedNumber}?text=${encodeURIComponent(message)}`;
}
__name(createWhatsAppLink, "createWhatsAppLink");
async function sendPrintRequestEmail(env, notification) {
  if (!notification.shopEmail) {
    return {
      sent: false,
      reason: "The shop does not have an email address."
    };
  }
  if (!env.RESEND_API_KEY) {
    return {
      sent: false,
      reason: "RESEND_API_KEY is not configured."
    };
  }
  const whatsappLink = createWhatsAppLink(
    notification.whatsAppNumber || notification.phoneNumber,
    notification.orderNumber,
    notification.customerName
  );
  const fileList = notification.fileNames.map(
    (fileName) => `<li>${escapeHtml(fileName)}</li>`
  ).join("");
  const instructionsHtml = notification.instructions ? escapeHtml(
    notification.instructions
  ) : "No special instructions";
  const customerEmailHtml = notification.emailAddress ? escapeHtml(
    notification.emailAddress
  ) : "Not provided";
  const whatsappButton = whatsappLink ? `
        <p style="margin:24px 0;">
          <a
            href="${escapeHtml(whatsappLink)}"
            style="
              display:inline-block;
              padding:12px 18px;
              background:#1f8f4e;
              color:#ffffff;
              text-decoration:none;
              font-weight:700;
              border-radius:4px;
            "
          >
            Open customer WhatsApp
          </a>
        </p>
      ` : "";
  const html = `
    <div
      style="
        max-width:640px;
        margin:0 auto;
        padding:24px;
        background:#fffdf8;
        color:#332317;
        font-family:Arial,sans-serif;
        line-height:1.5;
      "
    >
      <p
        style="
          margin:0;
          color:#7d6a54;
          font-size:12px;
          font-weight:700;
          letter-spacing:1px;
        "
      >
        GYAN PRINT
      </p>

      <h1
        style="
          margin:6px 0 4px;
          font-size:24px;
        "
      >
        New print request
      </h1>

      <p style="margin-top:0;">
        A new print request was submitted to
        <strong>
          ${escapeHtml(notification.shopName)}
        </strong>.
      </p>

      <div
        style="
          margin:20px 0;
          padding:16px;
          background:#f4eadc;
          border:1px solid #e3d5c2;
        "
      >
        <div style="font-size:12px;color:#7d6a54;">
          ORDER NUMBER
        </div>

        <div
          style="
            margin-top:4px;
            font-family:Consolas,monospace;
            font-size:20px;
            font-weight:700;
          "
        >
          ${escapeHtml(notification.orderNumber)}
        </div>
      </div>

      <h2 style="font-size:17px;">
        Customer
      </h2>

      <table
        style="
          width:100%;
          border-collapse:collapse;
        "
      >
        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Name
          </td>
          <td style="padding:6px 0;font-weight:700;">
            ${escapeHtml(notification.customerName)}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Mobile
          </td>
          <td style="padding:6px 0;">
            ${escapeHtml(notification.phoneNumber)}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            WhatsApp
          </td>
          <td style="padding:6px 0;">
            ${escapeHtml(
    notification.whatsAppNumber || notification.phoneNumber
  )}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Email
          </td>
          <td style="padding:6px 0;">
            ${customerEmailHtml}
          </td>
        </tr>
      </table>

      ${whatsappButton}

      <h2 style="font-size:17px;">
        Print preferences
      </h2>

      <table
        style="
          width:100%;
          border-collapse:collapse;
        "
      >
        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Estimated pages
          </td>
          <td style="padding:6px 0;">
            ${notification.estimatedPages}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Copies
          </td>
          <td style="padding:6px 0;">
            ${notification.copies}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Color
          </td>
          <td style="padding:6px 0;">
            ${escapeHtml(
    formatSetting(
      notification.colorMode
    )
  )}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Sides
          </td>
          <td style="padding:6px 0;">
            ${escapeHtml(
    formatSetting(
      notification.printSides
    )
  )}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Paper
          </td>
          <td style="padding:6px 0;">
            ${escapeHtml(
    notification.paperSize.toUpperCase()
  )}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Estimate
          </td>
          <td style="padding:6px 0;font-weight:700;">
            \u20B9${notification.estimatedAmountRupees}
          </td>
        </tr>
      </table>

      <h2 style="font-size:17px;">
        Uploaded files
      </h2>

      <ul>
        ${fileList}
      </ul>

      <h2 style="font-size:17px;">
        Instructions
      </h2>

      <p
        style="
          padding:12px;
          background:#ffffff;
          border:1px solid #e8dfd1;
        "
      >
        ${instructionsHtml}
      </p>

      <p
        style="
          margin-top:24px;
          color:#7d6a54;
          font-size:12px;
        "
      >
        This notification was generated automatically by GYAN.
      </p>
    </div>
  `;
  try {
    const response = await fetch(
      "https://api.resend.com/emails",
      {
        method: "POST",
        headers: {
          authorization: `Bearer ${env.RESEND_API_KEY}`,
          "content-type": "application/json"
        },
        body: JSON.stringify({
          from: "GYAN Orders <admin@gyan.cc>",
          to: [
            notification.shopEmail
          ],
          subject: `New print request ${notification.orderNumber}`,
          html
        })
      }
    );
    const result = await response.json();
    if (!response.ok) {
      const reason = result.message ?? result.error?.message ?? "Resend rejected the email.";
      console.error(
        "Print notification email failed:",
        reason
      );
      return {
        sent: false,
        reason
      };
    }
    return {
      sent: true,
      emailId: result.id
    };
  } catch (error) {
    const reason = error instanceof Error ? error.message : "Unexpected email error.";
    console.error(
      "Print notification email failed:",
      reason
    );
    return {
      sent: false,
      reason
    };
  }
}
__name(sendPrintRequestEmail, "sendPrintRequestEmail");

// worker/printRequests.ts
var MAX_TOTAL_FILE_SIZE = 25 * 1024 * 1024;
var allowedExtensions = /* @__PURE__ */ new Set([
  "pdf",
  "doc",
  "docx",
  "txt",
  "rtf",
  "jpg",
  "jpeg",
  "png"
]);
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
  return /^[A-Z0-9]{4}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeShopCode2, "normalizeShopCode");
function getRequiredText(formData, name) {
  const value = formData.get(name);
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim();
  return normalized ? normalized : null;
}
__name(getRequiredText, "getRequiredText");
function getOptionalText(formData, name) {
  const value = formData.get(name);
  return typeof value === "string" ? value.trim() : "";
}
__name(getOptionalText, "getOptionalText");
function getInteger(formData, name, minimum, maximum) {
  const value = formData.get(name);
  if (typeof value !== "string") {
    return null;
  }
  const parsed = Number(value);
  if (!Number.isInteger(parsed) || parsed < minimum || parsed > maximum) {
    return null;
  }
  return parsed;
}
__name(getInteger, "getInteger");
function getFileExtension(fileName) {
  return fileName.split(".").pop()?.toLowerCase() ?? "";
}
__name(getFileExtension, "getFileExtension");
function sanitizeFileName(fileName) {
  const sanitized = fileName.trim().replace(
    /[^A-Za-z0-9._-]+/g,
    "_"
  ).replace(
    /^_+|_+$/g,
    ""
  );
  return (sanitized || "uploaded-file").slice(0, 180);
}
__name(sanitizeFileName, "sanitizeFileName");
function generateOrderNumber(shopCode) {
  const now = /* @__PURE__ */ new Date();
  const datePart = [
    now.getUTCFullYear(),
    String(
      now.getUTCMonth() + 1
    ).padStart(2, "0"),
    String(
      now.getUTCDate()
    ).padStart(2, "0")
  ].join("");
  const randomPart = crypto.randomUUID().replace(/-/g, "").slice(0, 6).toUpperCase();
  return `PR-${shopCode}-${datePart}-${randomPart}`;
}
__name(generateOrderNumber, "generateOrderNumber");
function createStorageKey(shopCode, orderNumber, file, index) {
  const safeFileName = sanitizeFileName(
    file.name
  );
  const randomPart = crypto.randomUUID().replace(/-/g, "").slice(0, 10);
  const fileNumber = String(index + 1).padStart(2, "0");
  return [
    "print-requests",
    shopCode,
    orderNumber,
    `${fileNumber}-${randomPart}-${safeFileName}`
  ].join("/");
}
__name(createStorageKey, "createStorageKey");
async function deleteStoredFiles(env, storedFiles) {
  if (storedFiles.length === 0) {
    return;
  }
  try {
    await env.GYAN_PRINT_FILES.delete(
      storedFiles.map(
        (storedFile) => storedFile.storageKey
      )
    );
  } catch (error) {
    console.error(
      "Unable to clean up R2 files:",
      error
    );
  }
}
__name(deleteStoredFiles, "deleteStoredFiles");
async function deletePrintRequest(env, printRequestId) {
  try {
    await env.gyan_registry.prepare(
      `
          DELETE FROM print_requests
          WHERE id = ?
        `
    ).bind(printRequestId).run();
  } catch (error) {
    console.error(
      "Unable to clean up print request:",
      error
    );
  }
}
__name(deletePrintRequest, "deletePrintRequest");
async function handleCreatePrintRequest(request, env, shopCode) {
  const shop = await env.gyan_registry.prepare(
    `
        SELECT
          code,
          name,
          status,
          email_address,
          whatsapp_number

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
  if (shop.status !== "active") {
    return createJsonResponse4(
      {
        error: "Shop is not active."
      },
      403
    );
  }
  let formData;
  try {
    formData = await request.formData();
  } catch {
    return createJsonResponse4(
      {
        error: "The submitted form data could not be read."
      },
      400
    );
  }
  const customerName = getRequiredText(
    formData,
    "customerName"
  );
  const phoneNumber = getRequiredText(
    formData,
    "phoneNumber"
  );
  const emailAddress = getOptionalText(
    formData,
    "emailAddress"
  );
  const whatsAppNumber = getOptionalText(
    formData,
    "whatsAppNumber"
  );
  const whatsAppConsent = formData.get(
    "whatsAppConsent"
  ) === "true";
  const estimatedPages = getInteger(
    formData,
    "estimatedPages",
    1,
    1e3
  );
  const copies = getInteger(
    formData,
    "copies",
    1,
    100
  );
  const estimatedAmountRupees = getInteger(
    formData,
    "estimatedAmountRupees",
    0,
    1e6
  );
  const colorMode = getRequiredText(
    formData,
    "colorMode"
  );
  const printSides = getRequiredText(
    formData,
    "printSides"
  );
  const paperSize = getRequiredText(
    formData,
    "paperSize"
  );
  const instructions = getOptionalText(
    formData,
    "instructions"
  );
  if (!customerName || !phoneNumber || estimatedPages === null || copies === null || estimatedAmountRupees === null || !colorMode || !printSides || !paperSize) {
    return createJsonResponse4(
      {
        error: "Required print-request information is missing or invalid."
      },
      400
    );
  }
  if (![
    "black-white",
    "color"
  ].includes(colorMode)) {
    return createJsonResponse4(
      {
        error: "Invalid color setting."
      },
      400
    );
  }
  if (![
    "single",
    "double"
  ].includes(printSides)) {
    return createJsonResponse4(
      {
        error: "Invalid print-side setting."
      },
      400
    );
  }
  if (![
    "a4",
    "letter",
    "legal"
  ].includes(paperSize)) {
    return createJsonResponse4(
      {
        error: "Invalid paper size."
      },
      400
    );
  }
  const files = formData.getAll("files").filter(
    (value) => value instanceof File
  );
  if (files.length === 0) {
    return createJsonResponse4(
      {
        error: "At least one print file is required."
      },
      400
    );
  }
  const invalidFile = files.find(
    (file) => !allowedExtensions.has(
      getFileExtension(
        file.name
      )
    )
  );
  if (invalidFile) {
    return createJsonResponse4(
      {
        error: `Unsupported file type: ${invalidFile.name}`
      },
      400
    );
  }
  const totalFileSize = files.reduce(
    (total, file) => total + file.size,
    0
  );
  if (totalFileSize > MAX_TOTAL_FILE_SIZE) {
    return createJsonResponse4(
      {
        error: "The total file size cannot exceed 25 MB."
      },
      400
    );
  }
  const storageCapacity = await assertUploadCapacity(
    env,
    totalFileSize
  );
  if (!storageCapacity.allowed) {
    return createJsonResponse4(
      {
        error: storageCapacity.error,
        storage: {
          state: "stopped",
          usedBytes: storageCapacity.usedBytes,
          projectedBytes: storageCapacity.projectedBytes,
          stopBytes: storageCapacity.stopBytes
        }
      },
      storageCapacity.status
    );
  }
  const orderNumber = generateOrderNumber(
    shopCode
  );
  let createdRequest = null;
  const storedFiles = [];
  try {
    createdRequest = await env.gyan_registry.prepare(
      `
            INSERT INTO print_requests (
              order_number,
              shop_code,
              customer_name,
              phone_number,
              email_address,
              whatsapp_number,
              whatsapp_consent,
              estimated_pages,
              copies,
              color_mode,
              print_sides,
              paper_size,
              instructions,
              estimated_amount_rupees,
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
              ?,
              ?,
              ?,
              ?,
              'submitted'
            )

            RETURNING
              id,
              order_number,
              status,
              created_at
          `
    ).bind(
      orderNumber,
      shopCode,
      customerName,
      phoneNumber,
      emailAddress || null,
      whatsAppNumber || null,
      whatsAppConsent ? 1 : 0,
      estimatedPages,
      copies,
      colorMode,
      printSides,
      paperSize,
      instructions || null,
      estimatedAmountRupees
    ).first();
    if (!createdRequest) {
      throw new Error(
        "The print request could not be created."
      );
    }
    for (let index = 0; index < files.length; index += 1) {
      const file = files[index];
      const contentType = file.type || "application/octet-stream";
      const storageKey = createStorageKey(
        shopCode,
        orderNumber,
        file,
        index
      );
      const storedObject = await env.GYAN_PRINT_FILES.put(
        storageKey,
        file.stream(),
        {
          httpMetadata: {
            contentType
          },
          customMetadata: {
            orderNumber,
            shopCode,
            originalFileName: file.name
          }
        }
      );
      if (!storedObject) {
        throw new Error(
          `The file ${file.name} could not be stored.`
        );
      }
      storedFiles.push({
        file,
        storageKey,
        contentType
      });
    }
    const fileStatements = storedFiles.map(
      (storedFile) => env.gyan_registry.prepare(
        `
                INSERT INTO print_request_files (
                  print_request_id,
                  original_file_name,
                  content_type,
                  file_size,
                  storage_key,
                  storage_status
                )
                VALUES (
                  ?,
                  ?,
                  ?,
                  ?,
                  ?,
                  'stored'
                )
              `
      ).bind(
        createdRequest.id,
        storedFile.file.name,
        storedFile.contentType,
        storedFile.file.size,
        storedFile.storageKey
      )
    );
    await env.gyan_registry.batch(
      fileStatements
    );
    await addStoredBytes(
      env,
      totalFileSize
    );
    const notification = await sendPrintRequestEmail(
      env,
      {
        shopName: shop.name,
        shopEmail: shop.email_address ?? "",
        orderNumber: createdRequest.order_number,
        customerName,
        phoneNumber,
        whatsAppNumber: whatsAppNumber || phoneNumber,
        emailAddress,
        fileNames: storedFiles.map(
          (storedFile) => storedFile.file.name
        ),
        estimatedPages,
        copies,
        colorMode,
        printSides,
        paperSize,
        instructions,
        estimatedAmountRupees
      }
    );
    return createJsonResponse4(
      {
        order: {
          orderNumber: createdRequest.order_number,
          status: createdRequest.status,
          createdAt: createdRequest.created_at,
          fileCount: storedFiles.length
        },
        storage: {
          state: storageCapacity.warningActive ? "warning" : "normal",
          warningActive: storageCapacity.warningActive,
          projectedBytes: storageCapacity.projectedBytes,
          stopBytes: storageCapacity.stopBytes
        },
        notification: {
          emailSent: notification.sent,
          emailId: notification.emailId,
          reason: notification.reason
        }
      },
      201
    );
  } catch (error) {
    console.error(
      "Print request creation failed:",
      error
    );
    await deleteStoredFiles(
      env,
      storedFiles
    );
    if (createdRequest) {
      await deletePrintRequest(
        env,
        createdRequest.id
      );
    }
    return createJsonResponse4(
      {
        error: "The print request or its files could not be stored."
      },
      500
    );
  }
}
__name(handleCreatePrintRequest, "handleCreatePrintRequest");
async function handlePrintRequestsRoute(request, env, url) {
  const routeMatch = url.pathname.match(
    /^\/api\/shops\/([A-Za-z0-9]{4})\/print-requests$/
  );
  if (!routeMatch) {
    return null;
  }
  if (request.method !== "POST") {
    return createJsonResponse4(
      {
        error: "Method not allowed."
      },
      405
    );
  }
  const shopCode = normalizeShopCode2(
    routeMatch[1]
  );
  if (!shopCode) {
    return createJsonResponse4(
      {
        error: "Invalid shop code."
      },
      400
    );
  }
  return handleCreatePrintRequest(
    request,
    env,
    shopCode
  );
}
__name(handlePrintRequestsRoute, "handlePrintRequestsRoute");

// worker/serviceCatalog.ts
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
  const normalized = value.trim().toUpperCase();
  if (!/^[A-Z0-9]{4}$/.test(
    normalized
  )) {
    return null;
  }
  return normalized;
}
__name(normalizeShopCode3, "normalizeShopCode");
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
  return createJsonResponse5({
    services: result.results.map(
      mapServiceRow
    )
  });
}
__name(getGlobalServices, "getGlobalServices");
async function getShopServices(env, rawShopCode) {
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
  const shop = await env.gyan_registry.prepare(
    `
          SELECT code
          FROM shops
          WHERE code = ?
          LIMIT 1
        `
  ).bind(shopCode).first();
  if (!shop) {
    return createJsonResponse5(
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
  return createJsonResponse5({
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

// worker/adminStorage.ts
function createJsonResponse6(data, status = 200) {
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
__name(createJsonResponse6, "createJsonResponse");
async function requireAdmin3(request, env) {
  const session = await getAdminSession(
    request,
    env
  );
  if (session) {
    return null;
  }
  return createJsonResponse6(
    {
      error: "Administrator authentication is required."
    },
    401
  );
}
__name(requireAdmin3, "requireAdmin");
async function loadStorageSettings(env) {
  const result = await env.gyan_registry.prepare(
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
        `
  ).all();
  const values = new Map(
    result.results.map(
      (row) => [
        row.setting_key,
        row.setting_value
      ]
    )
  );
  const warningBytes = Number(
    values.get(
      "storage_warning_bytes"
    ) ?? 0
  );
  const stopBytes = Number(
    values.get(
      "storage_stop_bytes"
    ) ?? 0
  );
  const usedBytes = Number(
    values.get(
      "storage_used_bytes"
    ) ?? 0
  );
  const uploadsEnabled = values.get(
    "uploads_enabled"
  ) !== "false";
  const warningActive = values.get(
    "storage_warning_active"
  ) === "true";
  const state = !uploadsEnabled || usedBytes >= stopBytes ? "stopped" : warningActive || usedBytes >= warningBytes ? "warning" : "normal";
  return {
    state,
    warningBytes,
    stopBytes,
    usedBytes,
    uploadsEnabled,
    retentionDays: Number(
      values.get(
        "file_retention_days"
      ) ?? 15
    )
  };
}
__name(loadStorageSettings, "loadStorageSettings");
async function handleGetStorage(request, env) {
  const unauthorized = await requireAdmin3(
    request,
    env
  );
  if (unauthorized) {
    return unauthorized;
  }
  return createJsonResponse6({
    storage: await loadStorageSettings(
      env
    )
  });
}
__name(handleGetStorage, "handleGetStorage");
async function handleUpdateStorage(request, env) {
  const unauthorized = await requireAdmin3(
    request,
    env
  );
  if (unauthorized) {
    return unauthorized;
  }
  let body;
  try {
    body = await request.json();
  } catch {
    return createJsonResponse6(
      {
        error: "Request body must be valid JSON."
      },
      400
    );
  }
  const warningMegabytes = Number(
    body.warningMegabytes
  );
  const stopMegabytes = Number(
    body.stopMegabytes
  );
  if (!Number.isFinite(
    warningMegabytes
  ) || !Number.isFinite(
    stopMegabytes
  ) || warningMegabytes <= 0 || stopMegabytes <= 0 || warningMegabytes >= stopMegabytes) {
    return createJsonResponse6(
      {
        error: "The warning limit must be greater than zero and lower than the stop limit."
      },
      400
    );
  }
  const warningBytes = Math.round(
    warningMegabytes * 1024 * 1024
  );
  const stopBytes = Math.round(
    stopMegabytes * 1024 * 1024
  );
  const current = await loadStorageSettings(
    env
  );
  const warningActive = current.usedBytes >= warningBytes;
  const uploadsEnabled = current.usedBytes < stopBytes;
  await env.gyan_registry.batch([
    env.gyan_registry.prepare(
      `
          UPDATE system_settings
          SET
            setting_value = ?,
            updated_at =
              CURRENT_TIMESTAMP
          WHERE setting_key =
            'storage_warning_bytes'
        `
    ).bind(
      String(
        warningBytes
      )
    ),
    env.gyan_registry.prepare(
      `
          UPDATE system_settings
          SET
            setting_value = ?,
            updated_at =
              CURRENT_TIMESTAMP
          WHERE setting_key =
            'storage_stop_bytes'
        `
    ).bind(
      String(
        stopBytes
      )
    ),
    env.gyan_registry.prepare(
      `
          UPDATE system_settings
          SET
            setting_value = ?,
            updated_at =
              CURRENT_TIMESTAMP
          WHERE setting_key =
            'storage_warning_active'
        `
    ).bind(
      warningActive ? "true" : "false"
    ),
    env.gyan_registry.prepare(
      `
          UPDATE system_settings
          SET
            setting_value = ?,
            updated_at =
              CURRENT_TIMESTAMP
          WHERE setting_key =
            'uploads_enabled'
        `
    ).bind(
      uploadsEnabled ? "true" : "false"
    )
  ]);
  return createJsonResponse6({
    message: "Storage limits updated.",
    storage: await loadStorageSettings(
      env
    )
  });
}
__name(handleUpdateStorage, "handleUpdateStorage");
async function handleAdminStorageRoute(request, env, url) {
  if (url.pathname !== "/api/admin/storage") {
    return null;
  }
  if (request.method === "GET") {
    return handleGetStorage(
      request,
      env
    );
  }
  if (request.method === "PUT") {
    return handleUpdateStorage(
      request,
      env
    );
  }
  return createJsonResponse6(
    {
      error: "Method not allowed."
    },
    405
  );
}
__name(handleAdminStorageRoute, "handleAdminStorageRoute");

// worker/index.ts
function createJsonResponse7(data, status = 200) {
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
__name(createJsonResponse7, "createJsonResponse");
function normalizeShopCode4(value) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9]{4}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeShopCode4, "normalizeShopCode");
function normalizeRequiredText2(value) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim();
  return normalized.length > 0 ? normalized : null;
}
__name(normalizeRequiredText2, "normalizeRequiredText");
function normalizeOptionalText2(value) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim();
  return normalized.length > 0 ? normalized : null;
}
__name(normalizeOptionalText2, "normalizeOptionalText");
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
  const shopCode = normalizeShopCode4(
    rawShopCode
  );
  if (!shopCode) {
    return createJsonResponse7(
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
    return createJsonResponse7(
      {
        error: "Shop not found."
      },
      404
    );
  }
  if (shop.status !== "active") {
    return createJsonResponse7(
      {
        error: "Shop is not active."
      },
      403
    );
  }
  return createJsonResponse7({
    shop: mapShopRow(shop)
  });
}
__name(handleGetShop, "handleGetShop");
async function handleRegisterShop(request, env) {
  let requestBody;
  try {
    requestBody = await request.json();
  } catch {
    return createJsonResponse7(
      {
        error: "Request body must be valid JSON."
      },
      400
    );
  }
  const code = normalizeShopCode4(
    requestBody.code
  );
  const name = normalizeRequiredText2(
    requestBody.name
  );
  const ownerName = normalizeRequiredText2(
    requestBody.ownerName
  );
  const phoneNumber = normalizeRequiredText2(
    requestBody.phoneNumber
  );
  const whatsAppNumber = normalizeOptionalText2(
    requestBody.whatsAppNumber
  );
  const emailAddress = normalizeOptionalText2(
    requestBody.emailAddress
  );
  const addressLine = normalizeRequiredText2(
    requestBody.addressLine
  );
  const city = normalizeRequiredText2(
    requestBody.city
  );
  const state = normalizeRequiredText2(
    requestBody.state
  );
  const postalCode = normalizeRequiredText2(
    requestBody.postalCode
  );
  if (!code || !name || !ownerName || !phoneNumber || !addressLine || !city || !state || !postalCode) {
    return createJsonResponse7(
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
    return createJsonResponse7(
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
    return createJsonResponse7(
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
    return createJsonResponse7(
      {
        error: "The shop was saved but could not be loaded."
      },
      500
    );
  }
  return createJsonResponse7(
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
  const adminStorageResponse = await handleAdminStorageRoute(
    request,
    env,
    url
  );
  if (adminStorageResponse) {
    return adminStorageResponse;
  }
  const serviceCatalogResponse = await handleServiceCatalogRoute(
    request,
    env,
    url
  );
  if (serviceCatalogResponse) {
    return serviceCatalogResponse;
  }
  const printRequestsResponse = await handlePrintRequestsRoute(
    request,
    env,
    url
  );
  if (printRequestsResponse) {
    return printRequestsResponse;
  }
  if (request.method === "GET" && url.pathname === "/api/health") {
    return createJsonResponse7({
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
  return createJsonResponse7(
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
      return createJsonResponse7(
        {
          error: "An unexpected server error occurred."
        },
        500
      );
    }
  },
  async scheduled(controller, env, context) {
    context.waitUntil(
      reconcileExpiredStorage(
        env
      ).then((result) => {
        console.log(
          "Storage reconciliation completed:",
          {
            cron: controller.cron,
            expiredFileCount: result.expiredFileCount,
            removedBytes: result.removedBytes
          }
        );
      }).catch((error) => {
        console.error(
          "Storage reconciliation failed:",
          error
        );
      })
    );
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

// .wrangler/tmp/bundle-Gjk8eI/middleware-insertion-facade.js
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

// .wrangler/tmp/bundle-Gjk8eI/middleware-loader.entry.ts
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
