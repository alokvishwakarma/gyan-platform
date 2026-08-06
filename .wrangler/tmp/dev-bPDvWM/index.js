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
    sortOrder: Number(
      row.effective_sort_order
    ),
    homepageOrder: row.homepage_order == null ? null : Number(
      row.homepage_order
    ),
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

            s.homepage_order,

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

            CASE
              WHEN s.homepage_order IS NULL
                THEN 1
              ELSE 0
            END ASC,

            s.homepage_order ASC,
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

            s.homepage_order,

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

            CASE
              WHEN s.homepage_order IS NULL
                THEN 1
              ELSE 0
            END ASC,

            s.homepage_order ASC,
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

// worker/adminServiceForms.ts
var MAX_SECTIONS_PER_SERVICE = 10;
var MAX_FIELDS_PER_SECTION = 15;
var allowedFieldTypes = /* @__PURE__ */ new Set([
  "text",
  "textarea",
  "number",
  "email",
  "tel",
  "date",
  "select",
  "radio",
  "checkbox",
  "checkbox-group",
  "file"
]);
var allowedRequirements = /* @__PURE__ */ new Set([
  "mandatory",
  "optional",
  "hidden"
]);
var allowedVisibility = /* @__PURE__ */ new Set([
  "visible",
  "hidden"
]);
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
async function requireAdmin4(request, env) {
  const session = await getAdminSession(
    request,
    env
  );
  if (session) {
    return null;
  }
  return createJsonResponse7(
    {
      error: "Administrator authentication is required."
    },
    401
  );
}
__name(requireAdmin4, "requireAdmin");
function normalizeServiceCode3(value) {
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9_]{2,50}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeServiceCode3, "normalizeServiceCode");
function normalizeKey(value, maximumLength = 50) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim().toLowerCase().replace(
    /[^a-z0-9_]+/g,
    "_"
  ).replace(
    /^_+|_+$/g,
    ""
  );
  if (!normalized || normalized.length > maximumLength) {
    return null;
  }
  return normalized;
}
__name(normalizeKey, "normalizeKey");
function normalizeRequiredText2(value, maximumLength) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim();
  if (!normalized || normalized.length > maximumLength) {
    return null;
  }
  return normalized;
}
__name(normalizeRequiredText2, "normalizeRequiredText");
function normalizeOptionalText2(value, maximumLength) {
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
__name(normalizeOptionalText2, "normalizeOptionalText");
function normalizeBoolean(value, fallback) {
  return typeof value === "boolean" ? value : fallback;
}
__name(normalizeBoolean, "normalizeBoolean");
function normalizeSortOrder3(value, fallback) {
  if (value === void 0 || value === null || value === "") {
    return fallback;
  }
  if (typeof value !== "number" || !Number.isInteger(value) || value < 0 || value > 9999) {
    return null;
  }
  return value;
}
__name(normalizeSortOrder3, "normalizeSortOrder");
function normalizeJsonValue(value, maximumLength) {
  if (value === null || value === void 0 || value === "") {
    return null;
  }
  try {
    const json = JSON.stringify(value);
    if (json.length > maximumLength) {
      return "invalid";
    }
    return json;
  } catch {
    return "invalid";
  }
}
__name(normalizeJsonValue, "normalizeJsonValue");
function safelyParseJson(value) {
  if (!value) {
    return null;
  }
  try {
    return JSON.parse(value);
  } catch {
    return null;
  }
}
__name(safelyParseJson, "safelyParseJson");
async function loadService(env, serviceCode) {
  return env.gyan_registry.prepare(
    `
        SELECT
          id,
          service_code,
          name,
          category,
          sub_category

        FROM services

        WHERE service_code = ?

        LIMIT 1
      `
  ).bind(serviceCode).first();
}
__name(loadService, "loadService");
async function loadServiceForm(env, serviceId) {
  const sectionsResult = await env.gyan_registry.prepare(
    `
          SELECT
            id,
            section_key,
            label,
            description,
            visibility,
            include_in_shop_email,
            include_in_customer_email,
            sort_order

          FROM service_sections

          WHERE service_id = ?

          ORDER BY
            sort_order ASC,
            id ASC
        `
  ).bind(serviceId).all();
  if (sectionsResult.results.length === 0) {
    return [];
  }
  const sectionIds = sectionsResult.results.map(
    (section) => section.id
  );
  const placeholders = sectionIds.map(() => "?").join(", ");
  const fieldsResult = await env.gyan_registry.prepare(
    `
          SELECT
            id,
            section_id,
            field_key,
            label,
            field_type,
            requirement,
            placeholder,
            help_text,
            default_value,
            options_json,
            validation_json,
            email_label,
            include_in_shop_email,
            include_in_customer_email,
            include_in_request_view,
            sort_order

          FROM service_fields

          WHERE section_id IN (
            ${placeholders}
          )

          ORDER BY
            section_id ASC,
            sort_order ASC,
            id ASC
        `
  ).bind(...sectionIds).all();
  const fieldsBySection = /* @__PURE__ */ new Map();
  for (const field of fieldsResult.results) {
    const current = fieldsBySection.get(
      field.section_id
    ) ?? [];
    current.push(field);
    fieldsBySection.set(
      field.section_id,
      current
    );
  }
  return sectionsResult.results.map(
    (section) => ({
      id: section.id,
      key: section.section_key,
      label: section.label,
      description: section.description ?? "",
      visibility: section.visibility,
      includeInShopEmail: Boolean(
        section.include_in_shop_email
      ),
      includeInCustomerEmail: Boolean(
        section.include_in_customer_email
      ),
      sortOrder: section.sort_order,
      fields: (fieldsBySection.get(
        section.id
      ) ?? []).map(
        (field) => ({
          id: field.id,
          key: field.field_key,
          label: field.label,
          type: field.field_type,
          requirement: field.requirement,
          placeholder: field.placeholder ?? "",
          helpText: field.help_text ?? "",
          defaultValue: field.default_value ?? "",
          options: safelyParseJson(
            field.options_json
          ),
          validation: safelyParseJson(
            field.validation_json
          ),
          emailLabel: field.email_label ?? "",
          includeInShopEmail: Boolean(
            field.include_in_shop_email
          ),
          includeInCustomerEmail: Boolean(
            field.include_in_customer_email
          ),
          includeInRequestView: Boolean(
            field.include_in_request_view
          ),
          sortOrder: field.sort_order
        })
      )
    })
  );
}
__name(loadServiceForm, "loadServiceForm");
function normalizeField(rawField, fallbackSortOrder) {
  const key = normalizeKey(
    rawField.key
  );
  const label = normalizeRequiredText2(
    rawField.label,
    150
  );
  const type = typeof rawField.type === "string" && allowedFieldTypes.has(
    rawField.type
  ) ? rawField.type : null;
  const requirement = typeof rawField.requirement === "string" && allowedRequirements.has(
    rawField.requirement
  ) ? rawField.requirement : null;
  const placeholder = normalizeOptionalText2(
    rawField.placeholder,
    250
  );
  const helpText = normalizeOptionalText2(
    rawField.helpText,
    500
  );
  const defaultValue = normalizeOptionalText2(
    rawField.defaultValue,
    500
  );
  const emailLabel = normalizeOptionalText2(
    rawField.emailLabel,
    150
  );
  const optionsJson = normalizeJsonValue(
    rawField.options,
    1e4
  );
  const validationJson = normalizeJsonValue(
    rawField.validation,
    5e3
  );
  const sortOrder = normalizeSortOrder3(
    rawField.sortOrder,
    fallbackSortOrder
  );
  if (!key || !label || !type || !requirement || placeholder === "invalid" || helpText === "invalid" || defaultValue === "invalid" || emailLabel === "invalid" || optionsJson === "invalid" || validationJson === "invalid" || sortOrder === null) {
    return null;
  }
  return {
    key,
    label,
    type,
    requirement,
    placeholder,
    helpText,
    defaultValue,
    optionsJson,
    validationJson,
    emailLabel,
    includeInShopEmail: normalizeBoolean(
      rawField.includeInShopEmail,
      true
    ),
    includeInCustomerEmail: normalizeBoolean(
      rawField.includeInCustomerEmail,
      true
    ),
    includeInRequestView: normalizeBoolean(
      rawField.includeInRequestView,
      true
    ),
    sortOrder
  };
}
__name(normalizeField, "normalizeField");
function normalizeSection(rawSection, fallbackSortOrder) {
  const key = normalizeKey(
    rawSection.key
  );
  const label = normalizeRequiredText2(
    rawSection.label,
    150
  );
  const description = normalizeOptionalText2(
    rawSection.description,
    500
  );
  const visibility = typeof rawSection.visibility === "string" && allowedVisibility.has(
    rawSection.visibility
  ) ? rawSection.visibility : null;
  const sortOrder = normalizeSortOrder3(
    rawSection.sortOrder,
    fallbackSortOrder
  );
  if (!key || !label || description === "invalid" || !visibility || sortOrder === null || !Array.isArray(
    rawSection.fields
  ) || rawSection.fields.length > MAX_FIELDS_PER_SECTION) {
    return null;
  }
  const fields = [];
  const fieldKeys = /* @__PURE__ */ new Set();
  for (let index = 0; index < rawSection.fields.length; index += 1) {
    const rawField = rawSection.fields[index];
    if (typeof rawField !== "object" || rawField === null) {
      return null;
    }
    const normalizedField = normalizeField(
      rawField,
      (index + 1) * 10
    );
    if (!normalizedField || fieldKeys.has(
      normalizedField.key
    )) {
      return null;
    }
    fieldKeys.add(
      normalizedField.key
    );
    fields.push(
      normalizedField
    );
  }
  return {
    key,
    label,
    description,
    visibility,
    includeInShopEmail: normalizeBoolean(
      rawSection.includeInShopEmail,
      true
    ),
    includeInCustomerEmail: normalizeBoolean(
      rawSection.includeInCustomerEmail,
      true
    ),
    sortOrder,
    fields
  };
}
__name(normalizeSection, "normalizeSection");
async function handleGetServiceForm(request, env, serviceCode) {
  const unauthorized = await requireAdmin4(
    request,
    env
  );
  if (unauthorized) {
    return unauthorized;
  }
  const service = await loadService(
    env,
    serviceCode
  );
  if (!service) {
    return createJsonResponse7(
      {
        error: "Service not found."
      },
      404
    );
  }
  return createJsonResponse7({
    service: {
      id: service.id,
      code: service.service_code,
      name: service.name,
      category: service.category,
      subCategory: service.sub_category
    },
    limits: {
      maximumSections: MAX_SECTIONS_PER_SERVICE,
      maximumFieldsPerSection: MAX_FIELDS_PER_SECTION
    },
    sections: await loadServiceForm(
      env,
      service.id
    )
  });
}
__name(handleGetServiceForm, "handleGetServiceForm");
async function handleUpdateServiceForm(request, env, serviceCode) {
  const unauthorized = await requireAdmin4(
    request,
    env
  );
  if (unauthorized) {
    return unauthorized;
  }
  const service = await loadService(
    env,
    serviceCode
  );
  if (!service) {
    return createJsonResponse7(
      {
        error: "Service not found."
      },
      404
    );
  }
  let body;
  try {
    body = await request.json();
  } catch {
    return createJsonResponse7(
      {
        error: "Request body must be valid JSON."
      },
      400
    );
  }
  if (!Array.isArray(
    body.sections
  ) || body.sections.length > MAX_SECTIONS_PER_SERVICE) {
    return createJsonResponse7(
      {
        error: `A service may contain up to ${MAX_SECTIONS_PER_SERVICE} sections.`
      },
      400
    );
  }
  const sections = [];
  const sectionKeys = /* @__PURE__ */ new Set();
  for (let index = 0; index < body.sections.length; index += 1) {
    const rawSection = body.sections[index];
    if (typeof rawSection !== "object" || rawSection === null) {
      return createJsonResponse7(
        {
          error: "Each section must be an object."
        },
        400
      );
    }
    const normalizedSection = normalizeSection(
      rawSection,
      (index + 1) * 10
    );
    if (!normalizedSection) {
      return createJsonResponse7(
        {
          error: `Section ${index + 1} contains invalid information or exceeds the field limit.`
        },
        400
      );
    }
    if (sectionKeys.has(
      normalizedSection.key
    )) {
      return createJsonResponse7(
        {
          error: `Section key "${normalizedSection.key}" was used more than once.`
        },
        400
      );
    }
    sectionKeys.add(
      normalizedSection.key
    );
    sections.push(
      normalizedSection
    );
  }
  const statements = [];
  statements.push(
    env.gyan_registry.prepare(
      `
          DELETE FROM
            service_sections

          WHERE service_id = ?
        `
    ).bind(service.id)
  );
  for (const section of sections) {
    statements.push(
      env.gyan_registry.prepare(
        `
            INSERT INTO
              service_sections (
                service_id,
                section_key,
                label,
                description,
                visibility,
                include_in_shop_email,
                include_in_customer_email,
                sort_order,
                updated_at
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
              CURRENT_TIMESTAMP
            )
          `
      ).bind(
        service.id,
        section.key,
        section.label,
        section.description,
        section.visibility,
        section.includeInShopEmail ? 1 : 0,
        section.includeInCustomerEmail ? 1 : 0,
        section.sortOrder
      )
    );
  }
  await env.gyan_registry.batch(
    statements
  );
  const insertedSections = await env.gyan_registry.prepare(
    `
          SELECT
            id,
            section_key

          FROM service_sections

          WHERE service_id = ?
        `
  ).bind(service.id).all();
  const sectionIdMap = new Map(
    insertedSections.results.map(
      (row) => [
        row.section_key,
        row.id
      ]
    )
  );
  const fieldStatements = [];
  for (const section of sections) {
    const sectionId = sectionIdMap.get(
      section.key
    );
    if (!sectionId) {
      return createJsonResponse7(
        {
          error: "The service sections were saved, but one section could not be reloaded."
        },
        500
      );
    }
    for (const field of section.fields) {
      fieldStatements.push(
        env.gyan_registry.prepare(
          `
              INSERT INTO
                service_fields (
                  section_id,
                  field_key,
                  label,
                  field_type,
                  requirement,
                  placeholder,
                  help_text,
                  default_value,
                  options_json,
                  validation_json,
                  email_label,
                  include_in_shop_email,
                  include_in_customer_email,
                  include_in_request_view,
                  sort_order,
                  updated_at
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
                ?,
                CURRENT_TIMESTAMP
              )
            `
        ).bind(
          sectionId,
          field.key,
          field.label,
          field.type,
          field.requirement,
          field.placeholder,
          field.helpText,
          field.defaultValue,
          field.optionsJson,
          field.validationJson,
          field.emailLabel,
          field.includeInShopEmail ? 1 : 0,
          field.includeInCustomerEmail ? 1 : 0,
          field.includeInRequestView ? 1 : 0,
          field.sortOrder
        )
      );
    }
  }
  if (fieldStatements.length > 0) {
    await env.gyan_registry.batch(
      fieldStatements
    );
  }
  return createJsonResponse7({
    message: "Service form configuration saved.",
    service: {
      id: service.id,
      code: service.service_code,
      name: service.name
    },
    sections: await loadServiceForm(
      env,
      service.id
    )
  });
}
__name(handleUpdateServiceForm, "handleUpdateServiceForm");
async function handleAdminServiceFormsRoute(request, env, url) {
  const match = url.pathname.match(
    /^\/api\/admin\/services\/([A-Za-z0-9_]{2,50})\/form$/
  );
  if (!match) {
    return null;
  }
  const serviceCode = normalizeServiceCode3(
    match[1]
  );
  if (!serviceCode) {
    return createJsonResponse7(
      {
        error: "Invalid service code."
      },
      400
    );
  }
  if (request.method === "GET") {
    return handleGetServiceForm(
      request,
      env,
      serviceCode
    );
  }
  if (request.method === "PUT") {
    return handleUpdateServiceForm(
      request,
      env,
      serviceCode
    );
  }
  return createJsonResponse7(
    {
      error: "Method not allowed."
    },
    405
  );
}
__name(handleAdminServiceFormsRoute, "handleAdminServiceFormsRoute");

// worker/serviceForms.ts
function createJsonResponse8(data, status = 200) {
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
__name(createJsonResponse8, "createJsonResponse");
function normalizeShopCode4(value) {
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9]{4}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeShopCode4, "normalizeShopCode");
function normalizeServiceCode4(value) {
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9_]{2,50}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeServiceCode4, "normalizeServiceCode");
function safelyParseJson2(value) {
  if (!value) {
    return null;
  }
  try {
    return JSON.parse(value);
  } catch {
    return null;
  }
}
__name(safelyParseJson2, "safelyParseJson");
async function loadShop2(env, shopCode) {
  return env.gyan_registry.prepare(
    `
        SELECT
          code,
          name,
          status

        FROM shops

        WHERE code = ?

        LIMIT 1
      `
  ).bind(shopCode).first();
}
__name(loadShop2, "loadShop");
async function loadService2(env, shopCode, serviceCode) {
  return env.gyan_registry.prepare(
    `
        SELECT
          s.id,
          s.service_code,
          s.name,
          s.description,
          s.icon,
          s.color,
          s.category,
          s.sub_category,
          s.workflow_type,

          CAST(
            s.enabled AS INTEGER
          ) AS global_enabled,

          ss.enabled
            AS shop_enabled

        FROM services s

        LEFT JOIN shop_services ss
          ON ss.service_id = s.id
          AND ss.shop_code = ?

        WHERE
          s.service_code = ?
          AND s.service_type = 'system'

        LIMIT 1
      `
  ).bind(
    shopCode,
    serviceCode
  ).first();
}
__name(loadService2, "loadService");
async function loadPublicSections(env, serviceId) {
  const sectionsResult = await env.gyan_registry.prepare(
    `
          SELECT
            id,
            section_key,
            label,
            description,
            sort_order

          FROM service_sections

          WHERE
            service_id = ?
            AND visibility = 'visible'

          ORDER BY
            sort_order ASC,
            id ASC
        `
  ).bind(serviceId).all();
  if (sectionsResult.results.length === 0) {
    return [];
  }
  const sectionIds = sectionsResult.results.map(
    (section) => section.id
  );
  const placeholders = sectionIds.map(() => "?").join(", ");
  const fieldsResult = await env.gyan_registry.prepare(
    `
          SELECT
            id,
            section_id,
            field_key,
            label,
            field_type,
            requirement,
            placeholder,
            help_text,
            default_value,
            options_json,
            validation_json,
            sort_order

          FROM service_fields

          WHERE
            section_id IN (
              ${placeholders}
            )
            AND requirement != 'hidden'

          ORDER BY
            section_id ASC,
            sort_order ASC,
            id ASC
        `
  ).bind(
    ...sectionIds
  ).all();
  const fieldsBySection = /* @__PURE__ */ new Map();
  for (const field of fieldsResult.results) {
    const current = fieldsBySection.get(
      field.section_id
    ) ?? [];
    current.push(field);
    fieldsBySection.set(
      field.section_id,
      current
    );
  }
  return sectionsResult.results.map(
    (section) => ({
      key: section.section_key,
      label: section.label,
      description: section.description ?? "",
      sortOrder: section.sort_order,
      fields: (fieldsBySection.get(
        section.id
      ) ?? []).map(
        (field) => ({
          key: field.field_key,
          label: field.label,
          type: field.field_type,
          required: field.requirement === "mandatory",
          placeholder: field.placeholder ?? "",
          helpText: field.help_text ?? "",
          defaultValue: field.default_value ?? "",
          options: safelyParseJson2(
            field.options_json
          ) ?? [],
          validation: safelyParseJson2(
            field.validation_json
          ) ?? {},
          sortOrder: field.sort_order
        })
      )
    })
  ).filter(
    (section) => section.fields.length > 0
  );
}
__name(loadPublicSections, "loadPublicSections");
async function handleGetPublicServiceForm(env, shopCode, serviceCode) {
  const shop = await loadShop2(
    env,
    shopCode
  );
  if (!shop) {
    return createJsonResponse8(
      {
        error: "Shop not found."
      },
      404
    );
  }
  if (shop.status !== "active") {
    return createJsonResponse8(
      {
        error: "Shop is not active."
      },
      403
    );
  }
  const service = await loadService2(
    env,
    shopCode,
    serviceCode
  );
  if (!service) {
    return createJsonResponse8(
      {
        error: "Service not found."
      },
      404
    );
  }
  const effectiveEnabled = service.shop_enabled === null ? Boolean(
    service.global_enabled
  ) : Boolean(
    service.shop_enabled
  );
  if (!effectiveEnabled) {
    return createJsonResponse8(
      {
        error: "This service is not currently available at the selected shop."
      },
      403
    );
  }
  const sections = await loadPublicSections(
    env,
    service.id
  );
  return createJsonResponse8({
    shop: {
      code: shop.code,
      name: shop.name
    },
    service: {
      code: service.service_code,
      name: service.name,
      description: service.description ?? "",
      icon: service.icon ?? "\u{1F9E9}",
      color: service.color ?? "#607d8b",
      category: service.category,
      subCategory: service.sub_category,
      workflowType: service.workflow_type
    },
    form: {
      sections,
      hasConfiguration: sections.length > 0
    }
  });
}
__name(handleGetPublicServiceForm, "handleGetPublicServiceForm");
async function handleServiceFormsRoute(request, env, url) {
  const match = url.pathname.match(
    /^\/api\/shops\/([A-Za-z0-9]{4})\/services\/([A-Za-z0-9_]{2,50})\/form$/
  );
  if (!match) {
    return null;
  }
  if (request.method !== "GET") {
    return createJsonResponse8(
      {
        error: "Method not allowed."
      },
      405
    );
  }
  const shopCode = normalizeShopCode4(
    match[1]
  );
  const serviceCode = normalizeServiceCode4(
    match[2]
  );
  if (!shopCode || !serviceCode) {
    return createJsonResponse8(
      {
        error: "Invalid shop or service code."
      },
      400
    );
  }
  return handleGetPublicServiceForm(
    env,
    shopCode,
    serviceCode
  );
}
__name(handleServiceFormsRoute, "handleServiceFormsRoute");

// worker/emailTemplates/serviceRequestEmail.ts
function escapeHtml2(value) {
  return value.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll('"', "&quot;").replaceAll("'", "&#039;");
}
__name(escapeHtml2, "escapeHtml");
function formatFileSize(bytes) {
  if (bytes < 1024) {
    return `${bytes} B`;
  }
  if (bytes < 1024 * 1024) {
    return `${(bytes / 1024).toFixed(1)} KB`;
  }
  return `${(bytes / (1024 * 1024)).toFixed(1)} MB`;
}
__name(formatFileSize, "formatFileSize");
function formatDate(value) {
  return new Intl.DateTimeFormat(
    "en-IN",
    {
      year: "numeric",
      month: "long",
      day: "numeric",
      timeZone: "UTC"
    }
  ).format(value);
}
__name(formatDate, "formatDate");
function calculateExpirationDate(createdAt, retentionDays) {
  const createdDate = new Date(createdAt);
  const safeCreatedDate = Number.isNaN(
    createdDate.getTime()
  ) ? /* @__PURE__ */ new Date() : createdDate;
  return new Date(
    safeCreatedDate.getTime() + retentionDays * 24 * 60 * 60 * 1e3
  );
}
__name(calculateExpirationDate, "calculateExpirationDate");
function renderCustomerRows(customer) {
  const rows = [];
  if (customer.name) {
    rows.push({
      label: "Name",
      value: customer.name
    });
  }
  if (customer.phone) {
    rows.push({
      label: "Mobile",
      value: customer.phone
    });
  }
  if (customer.whatsApp) {
    rows.push({
      label: "WhatsApp",
      value: customer.whatsApp
    });
  }
  if (customer.email) {
    rows.push({
      label: "Email",
      value: customer.email
    });
  }
  return rows;
}
__name(renderCustomerRows, "renderCustomerRows");
function renderHtmlRows(rows) {
  return rows.map(
    (row) => `
        <tr>
          <td
            style="
              width:38%;
              padding:7px 8px 7px 0;
              color:#7d6a54;
              vertical-align:top;
            "
          >
            ${escapeHtml2(row.label)}
          </td>

          <td
            style="
              padding:7px 0;
              color:#332317;
              font-weight:600;
              vertical-align:top;
              overflow-wrap:anywhere;
            "
          >
            ${escapeHtml2(row.value)}
          </td>
        </tr>
      `
  ).join("");
}
__name(renderHtmlRows, "renderHtmlRows");
function renderHtmlSection(section) {
  if (section.rows.length === 0) {
    return "";
  }
  return `
    <section style="margin-top:22px;">
      <h2
        style="
          margin:0 0 8px;
          color:#332317;
          font-size:17px;
        "
      >
        ${escapeHtml2(section.label)}
      </h2>

      <table
        role="presentation"
        style="
          width:100%;
          border-collapse:collapse;
        "
      >
        ${renderHtmlRows(section.rows)}
      </table>
    </section>
  `;
}
__name(renderHtmlSection, "renderHtmlSection");
function renderTextSection(section) {
  if (section.rows.length === 0) {
    return "";
  }
  return [
    section.label,
    "-".repeat(section.label.length),
    ...section.rows.map(
      (row) => `${row.label}: ${row.value}`
    ),
    ""
  ].join("\n");
}
__name(renderTextSection, "renderTextSection");
function renderActions(actions) {
  if (!actions || actions.length === 0) {
    return "";
  }
  return `
    <div
      style="
        margin-top:24px;
        display:block;
      "
    >
      ${actions.map(
    (action) => `
            <a
              href="${escapeHtml2(action.url)}"
              style="
                display:inline-block;
                margin:0 8px 8px 0;
                padding:11px 16px;
                border:1px solid ${action.primary ? "#145da0" : "#cfc3b2"};
                background:${action.primary ? "#1565c0" : "#ffffff"};
                color:${action.primary ? "#ffffff" : "#50361e"};
                text-decoration:none;
                font-size:13px;
                font-weight:700;
              "
            >
              ${escapeHtml2(action.label)}
            </a>
          `
  ).join("")}
    </div>
  `;
}
__name(renderActions, "renderActions");
function renderServiceRequestEmail(input) {
  const expirationDate = calculateExpirationDate(
    input.createdAt,
    input.retentionDays
  );
  const expirationText = formatDate(
    expirationDate
  );
  const customerRows = renderCustomerRows(
    input.customer
  );
  const recipientTitle = input.recipient === "shop" ? `New ${input.serviceName} request` : `${input.serviceName} request received`;
  const introduction = input.recipient === "shop" ? `A new ${input.serviceName} request was submitted to ${input.shopName}.` : `Your ${input.serviceName} request has been sent to ${input.shopName}.`;
  const filesHtml = input.files.length > 0 ? `
        <section style="margin-top:22px;">
          <h2
            style="
              margin:0 0 8px;
              color:#332317;
              font-size:17px;
            "
          >
            Files
          </h2>

          <ul
            style="
              margin:0;
              padding-left:20px;
            "
          >
            ${input.files.map(
    (file) => `
                  <li style="margin:6px 0;">
                    ${escapeHtml2(file.name)}
                    <span
                      style="
                        color:#7d6a54;
                        font-size:12px;
                      "
                    >
                      (${escapeHtml2(
      formatFileSize(
        file.size
      )
    )})
                    </span>
                  </li>
                `
  ).join("")}
          </ul>
        </section>
      ` : "";
  const filesText = input.files.length > 0 ? [
    "Files",
    "-----",
    ...input.files.map(
      (file) => `${file.name} (${formatFileSize(
        file.size
      )})`
    ),
    ""
  ].join("\n") : "";
  const customerHtml = customerRows.length > 0 ? renderHtmlSection({
    label: "Customer",
    rows: customerRows
  }) : "";
  const customerText = customerRows.length > 0 ? renderTextSection({
    label: "Customer",
    rows: customerRows
  }) : "";
  const configuredSectionsHtml = input.sections.map(
    renderHtmlSection
  ).join("");
  const configuredSectionsText = input.sections.map(
    renderTextSection
  ).join("");
  const subject = input.recipient === "shop" ? `${recipientTitle} ${input.requestNumber}` : `${input.serviceName} request confirmation ${input.requestNumber}`;
  const html = `
    <!doctype html>
    <html>
      <body
        style="
          margin:0;
          padding:0;
          background:#f4f1eb;
        "
      >
        <div
          style="
            max-width:660px;
            margin:0 auto;
            padding:24px 16px;
          "
        >
          <div
            style="
              overflow:hidden;
              background:#fffdf8;
              border:1px solid #e3d7c6;
              font-family:Arial,sans-serif;
              line-height:1.5;
            "
          >
            <header
              style="
                padding:20px 22px;
                background:#f4eadc;
                border-bottom:1px solid #e3d5c2;
              "
            >
              <div
                style="
                  color:#7d6a54;
                  font-size:11px;
                  font-weight:700;
                  letter-spacing:1.2px;
                "
              >
                GYAN SERVICE
              </div>

              <h1
                style="
                  margin:5px 0 2px;
                  color:#332317;
                  font-size:24px;
                "
              >
                ${escapeHtml2(recipientTitle)}
              </h1>

              <div
                style="
                  color:#7d6a54;
                  font-size:13px;
                "
              >
                ${escapeHtml2(input.shopName)}
                \xB7
                ${escapeHtml2(input.shopCode)}
              </div>
            </header>

            <main
              style="
                padding:22px;
              "
            >
              <p
                style="
                  margin-top:0;
                  color:#50361e;
                "
              >
                ${escapeHtml2(introduction)}
              </p>

              <div
                style="
                  margin:18px 0;
                  padding:14px;
                  background:#ffffff;
                  border:1px solid #e8dfd1;
                "
              >
                <div
                  style="
                    color:#7d6a54;
                    font-size:11px;
                    font-weight:700;
                    letter-spacing:0.7px;
                  "
                >
                  REQUEST NUMBER
                </div>

                <div
                  style="
                    margin-top:4px;
                    color:#332317;
                    font-family:Consolas,monospace;
                    font-size:18px;
                    font-weight:700;
                    overflow-wrap:anywhere;
                  "
                >
                  ${escapeHtml2(input.requestNumber)}
                </div>
              </div>

              ${customerHtml}
              ${filesHtml}
              ${configuredSectionsHtml}
              ${renderActions(input.actions)}

              <div
                style="
                  margin-top:24px;
                  padding:14px;
                  background:#fff4d8;
                  border:1px solid #d6a346;
                  color:#714a12;
                  font-size:13px;
                  line-height:1.5;
                "
              >
                <strong>
                  ${input.retentionDays}-day file-retention policy
                </strong>

                <p style="margin:6px 0 0;">
                  Uploaded files remain available until
                  ${escapeHtml2(expirationText)}.
                  After that date, they are automatically deleted
                  and cannot be recovered through GYAN.
                </p>
              </div>
            </main>

            <footer
              style="
                padding:14px 22px;
                background:#f6f1e8;
                border-top:1px solid #e3d7c6;
                color:#7d6a54;
                font-size:11px;
                text-align:center;
              "
            >
              This message was generated automatically by GYAN.
            </footer>
          </div>
        </div>
      </body>
    </html>
  `;
  const text = [
    "GYAN SERVICE",
    recipientTitle,
    "",
    introduction,
    "",
    `Request number: ${input.requestNumber}`,
    `Shop: ${input.shopName} (${input.shopCode})`,
    "",
    customerText,
    filesText,
    configuredSectionsText,
    `${input.retentionDays}-day file-retention policy`,
    `Uploaded files remain available until ${expirationText}.`,
    "After that date, they are automatically deleted and cannot be recovered through GYAN."
  ].join("\n");
  return {
    subject,
    html,
    text
  };
}
__name(renderServiceRequestEmail, "renderServiceRequestEmail");

// worker/serviceRequestNotifications.ts
function normalizeEmail2(value) {
  const normalized = value?.trim().toLowerCase();
  if (!normalized || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
    normalized
  )) {
    return null;
  }
  return normalized;
}
__name(normalizeEmail2, "normalizeEmail");
async function sendEmail(env, recipient, input) {
  if (!env.RESEND_API_KEY) {
    return {
      recipient: recipient.type,
      attempted: false,
      sent: false,
      email: recipient.email,
      reason: "RESEND_API_KEY is not configured."
    };
  }
  const rendered = renderServiceRequestEmail({
    recipient: recipient.type,
    serviceName: input.service.name,
    requestNumber: input.request.requestNumber,
    shopName: input.shop.name,
    shopCode: input.shop.code,
    customer: input.customer,
    files: input.files,
    sections: recipient.type === "shop" ? input.sections.shop : input.sections.customer,
    actions: recipient.type === "shop" ? input.shopActions : input.customerActions,
    createdAt: input.request.createdAt,
    retentionDays: input.retentionDays
  });
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
          from: "GYAN Services <admin@gyan.cc>",
          to: [
            recipient.email
          ],
          subject: rendered.subject,
          html: rendered.html,
          text: rendered.text
        })
      }
    );
    const result = await response.json();
    if (!response.ok) {
      return {
        recipient: recipient.type,
        attempted: true,
        sent: false,
        email: recipient.email,
        reason: result.message ?? result.error?.message ?? "The email provider rejected the message."
      };
    }
    return {
      recipient: recipient.type,
      attempted: true,
      sent: true,
      email: recipient.email,
      emailId: result.id
    };
  } catch (error) {
    return {
      recipient: recipient.type,
      attempted: true,
      sent: false,
      email: recipient.email,
      reason: error instanceof Error ? error.message : "Unexpected notification error."
    };
  }
}
__name(sendEmail, "sendEmail");
async function sendServiceRequestNotifications(env, input) {
  const deliveries = [];
  const shopEmail = normalizeEmail2(
    input.shop.email
  );
  const customerEmail = normalizeEmail2(
    input.customer.email
  );
  if (shopEmail) {
    deliveries.push(
      sendEmail(
        env,
        {
          email: shopEmail,
          type: "shop"
        },
        input
      )
    );
  }
  if (customerEmail) {
    deliveries.push(
      sendEmail(
        env,
        {
          email: customerEmail,
          type: "customer"
        },
        input
      )
    );
  }
  if (deliveries.length === 0) {
    return [];
  }
  return Promise.all(
    deliveries
  );
}
__name(sendServiceRequestNotifications, "sendServiceRequestNotifications");

// worker/magicLinks.ts
var TOKEN_VERSION = "v1";
var TEXT_ENCODER = new TextEncoder();
function encodeBase64Url(bytes) {
  let binary = "";
  for (const byte of bytes) {
    binary += String.fromCharCode(
      byte
    );
  }
  return btoa(binary).replaceAll("+", "-").replaceAll("/", "_").replaceAll("=", "");
}
__name(encodeBase64Url, "encodeBase64Url");
function decodeBase64Url(value) {
  try {
    const base64 = value.replaceAll("-", "+").replaceAll("_", "/").padEnd(
      Math.ceil(value.length / 4) * 4,
      "="
    );
    const binary = atob(base64);
    const bytes = new Uint8Array(
      binary.length
    );
    for (let index = 0; index < binary.length; index += 1) {
      bytes[index] = binary.charCodeAt(index);
    }
    return bytes;
  } catch {
    return null;
  }
}
__name(decodeBase64Url, "decodeBase64Url");
function encodeJson(value) {
  return encodeBase64Url(
    TEXT_ENCODER.encode(
      JSON.stringify(value)
    )
  );
}
__name(encodeJson, "encodeJson");
function decodeJson(value) {
  const bytes = decodeBase64Url(value);
  if (!bytes) {
    return null;
  }
  try {
    return JSON.parse(
      new TextDecoder().decode(
        bytes
      )
    );
  } catch {
    return null;
  }
}
__name(decodeJson, "decodeJson");
async function importSigningKey(secret) {
  return crypto.subtle.importKey(
    "raw",
    TEXT_ENCODER.encode(secret),
    {
      name: "HMAC",
      hash: "SHA-256"
    },
    false,
    [
      "sign",
      "verify"
    ]
  );
}
__name(importSigningKey, "importSigningKey");
async function createSignature(value, secret) {
  const key = await importSigningKey(
    secret
  );
  const signature = await crypto.subtle.sign(
    "HMAC",
    key,
    TEXT_ENCODER.encode(value)
  );
  return encodeBase64Url(
    new Uint8Array(signature)
  );
}
__name(createSignature, "createSignature");
async function verifySignature(value, signature, secret) {
  const signatureBytes = decodeBase64Url(signature);
  if (!signatureBytes) {
    return false;
  }
  const key = await importSigningKey(
    secret
  );
  return crypto.subtle.verify(
    "HMAC",
    key,
    signatureBytes,
    TEXT_ENCODER.encode(value)
  );
}
__name(verifySignature, "verifySignature");
function isMagicLinkScope(value) {
  return value === "request:read" || value === "file:read" || value === "shop-requests:read";
}
__name(isMagicLinkScope, "isMagicLinkScope");
function isRecipient(value) {
  return value === "shop" || value === "customer";
}
__name(isRecipient, "isRecipient");
function normalizePayload(value) {
  if (typeof value !== "object" || value === null || Array.isArray(value)) {
    return null;
  }
  const candidate = value;
  if (!isMagicLinkScope(
    candidate.scope
  ) || !isRecipient(
    candidate.recipient
  ) || typeof candidate.shopCode !== "string" || !/^[A-Z0-9]{4}$/.test(
    candidate.shopCode
  ) || typeof candidate.issuedAt !== "number" || !Number.isInteger(
    candidate.issuedAt
  ) || typeof candidate.expiresAt !== "number" || !Number.isInteger(
    candidate.expiresAt
  )) {
    return null;
  }
  if (candidate.scope === "request:read" && (typeof candidate.requestNumber !== "string" || !candidate.requestNumber)) {
    return null;
  }
  if (candidate.scope === "file:read" && (typeof candidate.requestNumber !== "string" || !candidate.requestNumber || typeof candidate.fileId !== "number" || !Number.isInteger(
    candidate.fileId
  ) || candidate.fileId <= 0)) {
    return null;
  }
  return {
    scope: candidate.scope,
    shopCode: candidate.shopCode,
    requestNumber: candidate.requestNumber,
    fileId: candidate.fileId,
    recipient: candidate.recipient,
    issuedAt: candidate.issuedAt,
    expiresAt: candidate.expiresAt
  };
}
__name(normalizePayload, "normalizePayload");
function calculateMagicLinkExpiration(createdAt, retentionDays = 15) {
  const createdDate = new Date(createdAt);
  if (Number.isNaN(
    createdDate.getTime()
  )) {
    throw new Error(
      "Request creation date is invalid."
    );
  }
  return Math.floor(
    (createdDate.getTime() + retentionDays * 24 * 60 * 60 * 1e3) / 1e3
  );
}
__name(calculateMagicLinkExpiration, "calculateMagicLinkExpiration");
async function createMagicLinkToken(env, payload) {
  if (!env.SHOP_LINK_SIGNING_SECRET) {
    throw new Error(
      "SHOP_LINK_SIGNING_SECRET is not configured."
    );
  }
  const encodedPayload = encodeJson(payload);
  const signedValue = `${TOKEN_VERSION}.${encodedPayload}`;
  const signature = await createSignature(
    signedValue,
    env.SHOP_LINK_SIGNING_SECRET
  );
  return [
    TOKEN_VERSION,
    encodedPayload,
    signature
  ].join(".");
}
__name(createMagicLinkToken, "createMagicLinkToken");
async function verifyMagicLinkToken(env, token) {
  if (!env.SHOP_LINK_SIGNING_SECRET) {
    return {
      valid: false,
      error: "Magic-link signing is not configured."
    };
  }
  const parts = token.split(".");
  if (parts.length !== 3) {
    return {
      valid: false,
      error: "The access link is invalid."
    };
  }
  const [
    version,
    encodedPayload,
    signature
  ] = parts;
  if (version !== TOKEN_VERSION) {
    return {
      valid: false,
      error: "The access-link version is not supported."
    };
  }
  const signedValue = `${version}.${encodedPayload}`;
  const validSignature = await verifySignature(
    signedValue,
    signature,
    env.SHOP_LINK_SIGNING_SECRET
  );
  if (!validSignature) {
    return {
      valid: false,
      error: "The access-link signature is invalid."
    };
  }
  const payload = normalizePayload(
    decodeJson(
      encodedPayload
    )
  );
  if (!payload) {
    return {
      valid: false,
      error: "The access-link contents are invalid."
    };
  }
  const currentTime = Math.floor(
    Date.now() / 1e3
  );
  if (payload.expiresAt <= currentTime) {
    return {
      valid: false,
      error: "This access link has expired."
    };
  }
  if (payload.issuedAt > currentTime + 300) {
    return {
      valid: false,
      error: "The access link is not yet valid."
    };
  }
  return {
    valid: true,
    payload
  };
}
__name(verifyMagicLinkToken, "verifyMagicLinkToken");
function createMagicLinkUrl(origin, pathname, token) {
  const url = new URL(
    pathname,
    origin
  );
  url.searchParams.set(
    "token",
    token
  );
  return url.toString();
}
__name(createMagicLinkUrl, "createMagicLinkUrl");

// worker/serviceRequests.ts
var MAX_TOTAL_FILE_SIZE2 = 25 * 1024 * 1024;
var MAX_FILES = 15;
var MAX_METADATA_LENGTH = 1e5;
var FILE_RETENTION_DAYS = 15;
function createJsonResponse9(data, status = 200) {
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
__name(createJsonResponse9, "createJsonResponse");
function normalizeShopCode5(value) {
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9]{4}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeShopCode5, "normalizeShopCode");
function normalizeServiceCode5(value) {
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9_]{2,50}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeServiceCode5, "normalizeServiceCode");
function normalizeKey2(value) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim();
  return /^[a-z0-9_]{1,50}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeKey2, "normalizeKey");
function safelyParseJson3(value) {
  if (!value) {
    return null;
  }
  try {
    return JSON.parse(
      value
    );
  } catch {
    return null;
  }
}
__name(safelyParseJson3, "safelyParseJson");
function normalizeAnswerValue(value) {
  if (typeof value === "string") {
    return value.trim();
  }
  if (typeof value === "boolean") {
    return value;
  }
  if (Array.isArray(value) && value.every(
    (item) => typeof item === "string"
  )) {
    return value.map(
      (item) => item.trim()
    );
  }
  return null;
}
__name(normalizeAnswerValue, "normalizeAnswerValue");
function generateRequestNumber(shopCode, serviceCode) {
  const now = /* @__PURE__ */ new Date();
  const datePart = [
    now.getUTCFullYear(),
    String(
      now.getUTCMonth() + 1
    ).padStart(
      2,
      "0"
    ),
    String(
      now.getUTCDate()
    ).padStart(
      2,
      "0"
    )
  ].join("");
  const randomPart = crypto.randomUUID().replaceAll(
    "-",
    ""
  ).slice(
    0,
    6
  ).toUpperCase();
  return [
    "SR",
    shopCode,
    serviceCode,
    datePart,
    randomPart
  ].join("-");
}
__name(generateRequestNumber, "generateRequestNumber");
function sanitizeFileName2(fileName) {
  const normalized = fileName.trim().replace(
    /[^A-Za-z0-9._-]+/g,
    "_"
  ).replace(
    /^_+|_+$/g,
    ""
  );
  return (normalized || "uploaded-file").slice(
    0,
    180
  );
}
__name(sanitizeFileName2, "sanitizeFileName");
function createStorageKey2(shopCode, requestNumber, sectionKey, fieldKey, file, index) {
  const randomPart = crypto.randomUUID().replaceAll(
    "-",
    ""
  ).slice(
    0,
    10
  );
  return [
    "service-requests",
    shopCode,
    requestNumber,
    sectionKey,
    fieldKey,
    `${String(
      index + 1
    ).padStart(
      2,
      "0"
    )}-${randomPart}-${sanitizeFileName2(
      file.name
    )}`
  ].join("/");
}
__name(createStorageKey2, "createStorageKey");
function getConfiguredOptions(field) {
  const parsed = safelyParseJson3(
    field.options_json
  );
  if (!Array.isArray(parsed)) {
    return [];
  }
  const options = [];
  for (const item of parsed) {
    if (typeof item !== "object" || item === null) {
      continue;
    }
    const candidate = item;
    if (typeof candidate.value !== "string" || typeof candidate.label !== "string") {
      continue;
    }
    options.push({
      value: candidate.value,
      label: candidate.label
    });
  }
  return options;
}
__name(getConfiguredOptions, "getConfiguredOptions");
function getValidationRules(field) {
  const parsed = safelyParseJson3(
    field.validation_json
  );
  if (typeof parsed !== "object" || parsed === null || Array.isArray(parsed)) {
    return {};
  }
  return parsed;
}
__name(getValidationRules, "getValidationRules");
async function loadShop3(env, shopCode) {
  return env.gyan_registry.prepare(
    `
        SELECT
          code,
          name,
          status,
          email_address

        FROM shops

        WHERE code = ?

        LIMIT 1
      `
  ).bind(shopCode).first();
}
__name(loadShop3, "loadShop");
async function loadService3(env, shopCode, serviceCode) {
  return env.gyan_registry.prepare(
    `
        SELECT
          s.id,
          s.service_code,
          s.name,

          CAST(
            s.enabled AS INTEGER
          ) AS global_enabled,

          ss.enabled
            AS shop_enabled

        FROM services s

        LEFT JOIN shop_services ss
          ON ss.service_id =
            s.id

          AND ss.shop_code = ?

        WHERE
          s.service_code = ?

          AND s.service_type =
            'system'

        LIMIT 1
      `
  ).bind(
    shopCode,
    serviceCode
  ).first();
}
__name(loadService3, "loadService");
async function loadFormSchema(env, serviceId) {
  const sectionsResult = await env.gyan_registry.prepare(
    `
          SELECT
            id,
            section_key,
            label,
            visibility,
            include_in_shop_email,
            include_in_customer_email,
            sort_order

          FROM service_sections

          WHERE service_id = ?

          ORDER BY
            sort_order ASC,
            id ASC
        `
  ).bind(serviceId).all();
  if (sectionsResult.results.length === 0) {
    return {
      sections: [],
      fields: []
    };
  }
  const sectionIds = sectionsResult.results.map(
    (section) => section.id
  );
  const placeholders = sectionIds.map(() => "?").join(", ");
  const fieldsResult = await env.gyan_registry.prepare(
    `
          SELECT
            section_id,
            field_key,
            label,
            field_type,
            requirement,
            email_label,
            include_in_shop_email,
            include_in_customer_email,
            options_json,
            validation_json,
            sort_order

          FROM service_fields

          WHERE section_id IN (
            ${placeholders}
          )

          ORDER BY
            section_id ASC,
            sort_order ASC,
            id ASC
        `
  ).bind(
    ...sectionIds
  ).all();
  return {
    sections: sectionsResult.results,
    fields: fieldsResult.results
  };
}
__name(loadFormSchema, "loadFormSchema");
async function loadNotificationFiles(env, serviceRequestId) {
  const result = await env.gyan_registry.prepare(
    `
          SELECT
            id,
            original_file_name,
            file_size

          FROM service_request_files

          WHERE service_request_id = ?

          ORDER BY id ASC
        `
  ).bind(
    serviceRequestId
  ).all();
  return result.results;
}
__name(loadNotificationFiles, "loadNotificationFiles");
function validateChoiceValue(field, value) {
  const configuredOptions = getConfiguredOptions(
    field
  );
  if (configuredOptions.length === 0) {
    return true;
  }
  return configuredOptions.some(
    (option) => option.value === value
  );
}
__name(validateChoiceValue, "validateChoiceValue");
function validateAnswer(field, value) {
  const required = field.requirement === "mandatory";
  if (field.field_type === "checkbox") {
    if (required && value !== true) {
      return `${field.label} is required.`;
    }
    if (value !== void 0 && typeof value !== "boolean") {
      return `${field.label} contains an invalid value.`;
    }
    return null;
  }
  if (field.field_type === "checkbox-group") {
    if (required && (!Array.isArray(
      value
    ) || value.length === 0)) {
      return `${field.label} requires at least one selection.`;
    }
    if (value !== void 0 && !Array.isArray(value)) {
      return `${field.label} contains an invalid value.`;
    }
    if (Array.isArray(value)) {
      for (const selection of value) {
        if (!validateChoiceValue(
          field,
          selection
        )) {
          return `${field.label} contains an invalid selection.`;
        }
      }
    }
    return null;
  }
  if (field.field_type === "file") {
    return null;
  }
  const text = typeof value === "string" ? value.trim() : "";
  if (required && !text) {
    return `${field.label} is required.`;
  }
  if (!text) {
    return null;
  }
  if (field.field_type === "select" || field.field_type === "radio") {
    if (!validateChoiceValue(
      field,
      text
    )) {
      return `${field.label} contains an invalid selection.`;
    }
  }
  const rules = getValidationRules(
    field
  );
  if (typeof rules.minimumLength === "number" && text.length < rules.minimumLength) {
    return `${field.label} must contain at least ${rules.minimumLength} characters.`;
  }
  if (typeof rules.maximumLength === "number" && text.length > rules.maximumLength) {
    return `${field.label} cannot exceed ${rules.maximumLength} characters.`;
  }
  if (field.field_type === "number") {
    const numericValue = Number(text);
    if (!Number.isFinite(
      numericValue
    )) {
      return `${field.label} must be a valid number.`;
    }
    if (typeof rules.minimum === "number" && numericValue < rules.minimum) {
      return `${field.label} must be at least ${rules.minimum}.`;
    }
    if (typeof rules.maximum === "number" && numericValue > rules.maximum) {
      return `${field.label} cannot exceed ${rules.maximum}.`;
    }
  }
  if (typeof rules.pattern === "string" && rules.pattern) {
    try {
      const expression = new RegExp(
        rules.pattern
      );
      if (!expression.test(
        text
      )) {
        return `${field.label} is not in the expected format.`;
      }
    } catch {
    }
  }
  return null;
}
__name(validateAnswer, "validateAnswer");
function formatAnswerValue(field, value) {
  if (value === void 0 || value === null || value === "") {
    return "Not provided";
  }
  if (typeof value === "boolean") {
    return value ? "Yes" : "No";
  }
  const optionLabels = new Map(
    getConfiguredOptions(
      field
    ).map(
      (option) => [
        option.value,
        option.label
      ]
    )
  );
  if (Array.isArray(value)) {
    if (value.length === 0) {
      return "None selected";
    }
    return value.map(
      (item) => optionLabels.get(
        item
      ) ?? item
    ).join(", ");
  }
  return optionLabels.get(
    value
  ) ?? value;
}
__name(formatAnswerValue, "formatAnswerValue");
function createEmailSections(sections, fields, answers, recipient) {
  const sectionMap = new Map(
    sections.map(
      (section) => [
        section.id,
        section
      ]
    )
  );
  const grouped = /* @__PURE__ */ new Map();
  for (const field of fields) {
    const section = sectionMap.get(
      field.section_id
    );
    if (!section || section.visibility !== "visible" || field.requirement === "hidden") {
      continue;
    }
    const sectionIncluded = recipient === "shop" ? Boolean(
      section.include_in_shop_email
    ) : Boolean(
      section.include_in_customer_email
    );
    const fieldIncluded = recipient === "shop" ? Boolean(
      field.include_in_shop_email
    ) : Boolean(
      field.include_in_customer_email
    );
    if (!sectionIncluded || !fieldIncluded) {
      continue;
    }
    if (section.section_key === "customer") {
      continue;
    }
    const answerKey = `${section.section_key}.${field.field_key}`;
    const existing = grouped.get(
      section.id
    ) ?? {
      label: section.label,
      rows: []
    };
    existing.rows.push({
      label: field.email_label?.trim() || field.label,
      value: formatAnswerValue(
        field,
        answers[answerKey]
      )
    });
    grouped.set(
      section.id,
      existing
    );
  }
  return [...sections].sort(
    (first, second) => first.sort_order - second.sort_order
  ).map(
    (section) => grouped.get(
      section.id
    )
  ).filter(
    (section) => Boolean(
      section && section.rows.length > 0
    )
  );
}
__name(createEmailSections, "createEmailSections");
async function createRequestAccessAction(env, origin, requestNumber, shopCode, recipient, expiresAt) {
  const issuedAt = Math.floor(
    Date.now() / 1e3
  );
  const token = await createMagicLinkToken(
    env,
    {
      scope: "request:read",
      shopCode,
      requestNumber,
      recipient,
      issuedAt,
      expiresAt
    }
  );
  return {
    label: recipient === "shop" ? "View request" : "View my request",
    url: createMagicLinkUrl(
      origin,
      `/shared/requests/${encodeURIComponent(
        requestNumber
      )}`,
      token
    ),
    primary: true
  };
}
__name(createRequestAccessAction, "createRequestAccessAction");
async function createShopRequestsAction(env, origin, shopCode, expiresAt) {
  const issuedAt = Math.floor(
    Date.now() / 1e3
  );
  const token = await createMagicLinkToken(
    env,
    {
      scope: "shop-requests:read",
      shopCode,
      recipient: "shop",
      issuedAt,
      expiresAt
    }
  );
  return {
    label: "View active requests",
    url: createMagicLinkUrl(
      origin,
      `/shared/shops/${encodeURIComponent(
        shopCode
      )}/requests`,
      token
    )
  };
}
__name(createShopRequestsAction, "createShopRequestsAction");
async function createFileAccessActions(env, origin, requestNumber, shopCode, recipient, files, expiresAt) {
  const actions = [];
  for (const file of files) {
    const issuedAt = Math.floor(
      Date.now() / 1e3
    );
    const token = await createMagicLinkToken(
      env,
      {
        scope: "file:read",
        shopCode,
        requestNumber,
        fileId: file.id,
        recipient,
        issuedAt,
        expiresAt
      }
    );
    actions.push({
      label: `Download ${file.original_file_name}`,
      url: createMagicLinkUrl(
        origin,
        `/api/shared/files/${file.id}/download`,
        token
      )
    });
  }
  return actions;
}
__name(createFileAccessActions, "createFileAccessActions");
async function createNotificationActions(env, origin, requestNumber, shopCode, createdAt, files) {
  const expiresAt = calculateMagicLinkExpiration(
    createdAt,
    FILE_RETENTION_DAYS
  );
  const [
    shopRequestAction,
    customerRequestAction,
    shopRequestsAction,
    shopFileActions,
    customerFileActions
  ] = await Promise.all([
    createRequestAccessAction(
      env,
      origin,
      requestNumber,
      shopCode,
      "shop",
      expiresAt
    ),
    createRequestAccessAction(
      env,
      origin,
      requestNumber,
      shopCode,
      "customer",
      expiresAt
    ),
    createShopRequestsAction(
      env,
      origin,
      shopCode,
      expiresAt
    ),
    createFileAccessActions(
      env,
      origin,
      requestNumber,
      shopCode,
      "shop",
      files,
      expiresAt
    ),
    createFileAccessActions(
      env,
      origin,
      requestNumber,
      shopCode,
      "customer",
      files,
      expiresAt
    )
  ]);
  return {
    shop: [
      shopRequestAction,
      shopRequestsAction,
      ...shopFileActions
    ],
    customer: [
      customerRequestAction,
      ...customerFileActions
    ]
  };
}
__name(createNotificationActions, "createNotificationActions");
async function deleteStoredFiles2(env, storedFiles) {
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
      "Unable to remove service-request files:",
      error
    );
  }
}
__name(deleteStoredFiles2, "deleteStoredFiles");
async function deleteCreatedRequest(env, requestId) {
  try {
    await env.gyan_registry.prepare(
      `
          DELETE FROM
            service_requests

          WHERE id = ?
        `
    ).bind(
      requestId
    ).run();
  } catch (error) {
    console.error(
      "Unable to remove service request:",
      error
    );
  }
}
__name(deleteCreatedRequest, "deleteCreatedRequest");
async function handleCreateServiceRequest(request, env, shopCode, serviceCode) {
  const requestUrl = new URL(
    request.url
  );
  const publicOrigin = requestUrl.origin;
  const shop = await loadShop3(
    env,
    shopCode
  );
  if (!shop) {
    return createJsonResponse9(
      {
        error: "Shop not found."
      },
      404
    );
  }
  if (shop.status !== "active") {
    return createJsonResponse9(
      {
        error: "Shop is not active."
      },
      403
    );
  }
  const service = await loadService3(
    env,
    shopCode,
    serviceCode
  );
  if (!service) {
    return createJsonResponse9(
      {
        error: "Service not found."
      },
      404
    );
  }
  const effectiveEnabled = service.shop_enabled === null ? Boolean(
    service.global_enabled
  ) : Boolean(
    service.shop_enabled
  );
  if (!effectiveEnabled) {
    return createJsonResponse9(
      {
        error: "This service is not currently available."
      },
      403
    );
  }
  let formData;
  try {
    formData = await request.formData();
  } catch {
    return createJsonResponse9(
      {
        error: "The submitted form data could not be read."
      },
      400
    );
  }
  const metadataValue = formData.get(
    "metadata"
  );
  if (typeof metadataValue !== "string") {
    return createJsonResponse9(
      {
        error: "Request metadata is missing."
      },
      400
    );
  }
  if (metadataValue.length > MAX_METADATA_LENGTH) {
    return createJsonResponse9(
      {
        error: "The submitted request information is too large."
      },
      400
    );
  }
  let metadata;
  try {
    metadata = JSON.parse(
      metadataValue
    );
  } catch {
    return createJsonResponse9(
      {
        error: "Request metadata is invalid."
      },
      400
    );
  }
  if (!Array.isArray(
    metadata.answers
  )) {
    return createJsonResponse9(
      {
        error: "Request answers are missing."
      },
      400
    );
  }
  const {
    sections,
    fields
  } = await loadFormSchema(
    env,
    service.id
  );
  if (sections.length === 0 || fields.length === 0) {
    return createJsonResponse9(
      {
        error: "This service does not have a request form configured."
      },
      409
    );
  }
  const visibleSectionMap = new Map(
    sections.filter(
      (section) => section.visibility === "visible"
    ).map(
      (section) => [
        section.id,
        section.section_key
      ]
    )
  );
  const fieldMap = /* @__PURE__ */ new Map();
  for (const field of fields) {
    const sectionKey = visibleSectionMap.get(
      field.section_id
    );
    if (!sectionKey || field.requirement === "hidden") {
      continue;
    }
    fieldMap.set(
      `${sectionKey}.${field.field_key}`,
      field
    );
  }
  const answers = {};
  for (const rawAnswer of metadata.answers) {
    if (typeof rawAnswer !== "object" || rawAnswer === null) {
      return createJsonResponse9(
        {
          error: "One or more request answers are invalid."
        },
        400
      );
    }
    const submittedAnswer = rawAnswer;
    const sectionKey = normalizeKey2(
      submittedAnswer.sectionKey
    );
    const fieldKey = normalizeKey2(
      submittedAnswer.fieldKey
    );
    const value = normalizeAnswerValue(
      submittedAnswer.value
    );
    if (!sectionKey || !fieldKey || value === null) {
      return createJsonResponse9(
        {
          error: "One or more request answers are invalid."
        },
        400
      );
    }
    const answerKey = `${sectionKey}.${fieldKey}`;
    if (!fieldMap.has(
      answerKey
    )) {
      return createJsonResponse9(
        {
          error: `Unknown form field: ${answerKey}`
        },
        400
      );
    }
    if (Object.hasOwn(
      answers,
      answerKey
    )) {
      return createJsonResponse9(
        {
          error: `The field ${answerKey} was submitted more than once.`
        },
        400
      );
    }
    answers[answerKey] = value;
  }
  for (const [
    answerKey,
    field
  ] of fieldMap) {
    const validationError = validateAnswer(
      field,
      answers[answerKey]
    );
    if (validationError) {
      return createJsonResponse9(
        {
          error: validationError
        },
        400
      );
    }
  }
  const submittedFiles = [];
  for (const [
    formKey,
    formValue
  ] of formData.entries()) {
    if (!formKey.startsWith(
      "file:"
    ) || !(formValue instanceof File)) {
      continue;
    }
    if (formValue.size === 0) {
      continue;
    }
    const keyParts = formKey.split(":");
    if (keyParts.length !== 3) {
      return createJsonResponse9(
        {
          error: "A submitted file field is invalid."
        },
        400
      );
    }
    const sectionKey = normalizeKey2(
      keyParts[1]
    );
    const fieldKey = normalizeKey2(
      keyParts[2]
    );
    const field = sectionKey && fieldKey ? fieldMap.get(
      `${sectionKey}.${fieldKey}`
    ) : null;
    if (!sectionKey || !fieldKey || !field || field.field_type !== "file") {
      return createJsonResponse9(
        {
          error: "A file was submitted for an invalid field."
        },
        400
      );
    }
    submittedFiles.push({
      sectionKey,
      fieldKey,
      file: formValue
    });
  }
  if (submittedFiles.length > MAX_FILES) {
    return createJsonResponse9(
      {
        error: `A request may contain up to ${MAX_FILES} files.`
      },
      400
    );
  }
  for (const [
    answerKey,
    field
  ] of fieldMap) {
    if (field.field_type !== "file" || field.requirement !== "mandatory") {
      continue;
    }
    const [
      sectionKey,
      fieldKey
    ] = answerKey.split(".");
    const hasFile = submittedFiles.some(
      (item) => item.sectionKey === sectionKey && item.fieldKey === fieldKey
    );
    if (!hasFile) {
      return createJsonResponse9(
        {
          error: `${field.label} is required.`
        },
        400
      );
    }
  }
  const totalFileSize = submittedFiles.reduce(
    (total, item) => total + item.file.size,
    0
  );
  if (totalFileSize > MAX_TOTAL_FILE_SIZE2) {
    return createJsonResponse9(
      {
        error: "The total upload size cannot exceed 25 MB."
      },
      400
    );
  }
  const storageCapacity = await assertUploadCapacity(
    env,
    totalFileSize
  );
  if (!storageCapacity.allowed) {
    return createJsonResponse9(
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
  const customerName = typeof answers["customer.customer_name"] === "string" ? answers["customer.customer_name"] : null;
  const phoneNumber = typeof answers["customer.phone_number"] === "string" ? answers["customer.phone_number"] : null;
  const emailAddress = typeof answers["customer.email_address"] === "string" ? answers["customer.email_address"] : null;
  const whatsAppNumber = typeof answers["customer.whatsapp_number"] === "string" ? answers["customer.whatsapp_number"] : null;
  const whatsAppConsent = answers["customer.whatsapp_consent"] === true;
  const requestNumber = generateRequestNumber(
    shopCode,
    serviceCode
  );
  let createdRequest = null;
  const storedFiles = [];
  try {
    createdRequest = await env.gyan_registry.prepare(
      `
            INSERT INTO service_requests (
              request_number,
              shop_code,
              service_id,
              customer_name,
              phone_number,
              email_address,
              whatsapp_number,
              whatsapp_consent,
              status,
              details_json
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
              'submitted',
              ?
            )

            RETURNING
              id,
              request_number,
              status,
              created_at
          `
    ).bind(
      requestNumber,
      shopCode,
      service.id,
      customerName,
      phoneNumber,
      emailAddress,
      whatsAppNumber,
      whatsAppConsent ? 1 : 0,
      JSON.stringify(
        answers
      )
    ).first();
    if (!createdRequest) {
      throw new Error(
        "The service request could not be created."
      );
    }
    for (let index = 0; index < submittedFiles.length; index += 1) {
      const item = submittedFiles[index];
      const contentType = item.file.type || "application/octet-stream";
      const storageKey = createStorageKey2(
        shopCode,
        requestNumber,
        item.sectionKey,
        item.fieldKey,
        item.file,
        index
      );
      const storedObject = await env.GYAN_PRINT_FILES.put(
        storageKey,
        item.file.stream(),
        {
          httpMetadata: {
            contentType
          },
          customMetadata: {
            requestNumber,
            shopCode,
            serviceCode,
            sectionKey: item.sectionKey,
            fieldKey: item.fieldKey,
            originalFileName: item.file.name
          }
        }
      );
      if (!storedObject) {
        throw new Error(
          `The file ${item.file.name} could not be stored.`
        );
      }
      storedFiles.push({
        ...item,
        storageKey,
        contentType
      });
    }
    if (storedFiles.length > 0) {
      await env.gyan_registry.batch(
        storedFiles.map(
          (storedFile) => env.gyan_registry.prepare(
            `
                    INSERT INTO service_request_files (
                      service_request_id,
                      section_key,
                      field_key,
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
                      ?,
                      ?,
                      'stored'
                    )
                  `
          ).bind(
            createdRequest.id,
            storedFile.sectionKey,
            storedFile.fieldKey,
            storedFile.file.name,
            storedFile.contentType,
            storedFile.file.size,
            storedFile.storageKey
          )
        )
      );
    }
    await addStoredBytes(
      env,
      totalFileSize
    );
  } catch (error) {
    console.error(
      "Service request creation failed:",
      error
    );
    await deleteStoredFiles2(
      env,
      storedFiles
    );
    if (createdRequest) {
      await deleteCreatedRequest(
        env,
        createdRequest.id
      );
    }
    return createJsonResponse9(
      {
        error: "The service request or its files could not be stored."
      },
      500
    );
  }
  const notificationFileRows = await loadNotificationFiles(
    env,
    createdRequest.id
  );
  const notificationFiles = notificationFileRows.map(
    (file) => ({
      name: file.original_file_name,
      size: file.file_size
    })
  );
  const shopEmailSections = createEmailSections(
    sections,
    fields,
    answers,
    "shop"
  );
  const customerEmailSections = createEmailSections(
    sections,
    fields,
    answers,
    "customer"
  );
  let notificationActions = {
    shop: [],
    customer: []
  };
  try {
    notificationActions = await createNotificationActions(
      env,
      publicOrigin,
      createdRequest.request_number,
      shop.code,
      createdRequest.created_at,
      notificationFileRows
    );
  } catch (error) {
    console.error(
      "Magic-link creation failed:",
      error
    );
  }
  const notificationEmail = shop.email_address?.trim() || "admin@gyan.cc";
  let notificationResults = [];
  try {
    notificationResults = await sendServiceRequestNotifications(
      env,
      {
        shop: {
          code: shop.code,
          name: shop.name,
          email: notificationEmail
        },
        service: {
          code: service.service_code,
          name: service.name
        },
        request: {
          requestNumber: createdRequest.request_number,
          createdAt: createdRequest.created_at
        },
        customer: {
          name: customerName,
          phone: phoneNumber,
          whatsApp: whatsAppNumber,
          email: emailAddress
        },
        files: notificationFiles,
        sections: {
          shop: shopEmailSections,
          customer: customerEmailSections
        },
        shopActions: notificationActions.shop,
        customerActions: notificationActions.customer,
        retentionDays: FILE_RETENTION_DAYS
      }
    );
  } catch (error) {
    console.error(
      "Service request notifications failed:",
      error
    );
  }
  return createJsonResponse9(
    {
      request: {
        requestNumber: createdRequest.request_number,
        status: createdRequest.status,
        createdAt: createdRequest.created_at,
        serviceCode: service.service_code,
        serviceName: service.name,
        fileCount: storedFiles.length
      },
      notifications: notificationResults,
      storage: {
        state: storageCapacity.warningActive ? "warning" : "normal",
        warningActive: storageCapacity.warningActive,
        projectedBytes: storageCapacity.projectedBytes,
        stopBytes: storageCapacity.stopBytes
      }
    },
    201
  );
}
__name(handleCreateServiceRequest, "handleCreateServiceRequest");
async function handleServiceRequestsRoute(request, env, url) {
  const match = url.pathname.match(
    /^\/api\/shops\/([A-Za-z0-9]{4})\/services\/([A-Za-z0-9_]{2,50})\/requests$/
  );
  if (!match) {
    return null;
  }
  if (request.method !== "POST") {
    return createJsonResponse9(
      {
        error: "Method not allowed."
      },
      405
    );
  }
  const shopCode = normalizeShopCode5(
    match[1]
  );
  const serviceCode = normalizeServiceCode5(
    match[2]
  );
  if (!shopCode || !serviceCode) {
    return createJsonResponse9(
      {
        error: "Invalid shop or service code."
      },
      400
    );
  }
  return handleCreateServiceRequest(
    request,
    env,
    shopCode,
    serviceCode
  );
}
__name(handleServiceRequestsRoute, "handleServiceRequestsRoute");

// worker/sharedRequests.ts
var FILE_RETENTION_DAYS2 = 15;
function createJsonResponse10(data, status = 200) {
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
__name(createJsonResponse10, "createJsonResponse");
function normalizeRequestNumber(value) {
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9_-]{8,120}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeRequestNumber, "normalizeRequestNumber");
function normalizeShopCode6(value) {
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9]{4}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeShopCode6, "normalizeShopCode");
function normalizeFileId(value) {
  if (!/^\d+$/.test(value)) {
    return null;
  }
  const id = Number(value);
  return Number.isSafeInteger(id) && id > 0 ? id : null;
}
__name(normalizeFileId, "normalizeFileId");
function safelyParseJson4(value) {
  try {
    const parsed = JSON.parse(value);
    if (typeof parsed === "object" && parsed !== null && !Array.isArray(parsed)) {
      return parsed;
    }
  } catch {
  }
  return {};
}
__name(safelyParseJson4, "safelyParseJson");
function calculateExpirationDate2(createdAt) {
  const createdDate = new Date(createdAt);
  if (Number.isNaN(
    createdDate.getTime()
  )) {
    return null;
  }
  return new Date(
    createdDate.getTime() + FILE_RETENTION_DAYS2 * 24 * 60 * 60 * 1e3
  );
}
__name(calculateExpirationDate2, "calculateExpirationDate");
function requestHasExpired(createdAt) {
  const expirationDate = calculateExpirationDate2(
    createdAt
  );
  if (!expirationDate) {
    return true;
  }
  return expirationDate.getTime() <= Date.now();
}
__name(requestHasExpired, "requestHasExpired");
function readToken(url) {
  const token = url.searchParams.get("token")?.trim();
  return token || null;
}
__name(readToken, "readToken");
async function requireMagicLink(env, url) {
  const token = readToken(url);
  if (!token) {
    return {
      response: createJsonResponse10(
        {
          error: "The secure access token is missing."
        },
        401
      )
    };
  }
  const verified = await verifyMagicLinkToken(
    env,
    token
  );
  if (!verified.valid || !verified.payload) {
    return {
      response: createJsonResponse10(
        {
          error: verified.error ?? "The secure access link is invalid."
        },
        401
      )
    };
  }
  return {
    payload: verified.payload
  };
}
__name(requireMagicLink, "requireMagicLink");
async function loadRequest(env, requestNumber) {
  return env.gyan_registry.prepare(
    `
        SELECT
          sr.id,
          sr.request_number,

          sr.shop_code,
          sh.name AS shop_name,

          s.service_code,
          s.name AS service_name,

          sr.customer_name,
          sr.phone_number,
          sr.email_address,
          sr.whatsapp_number,

          sr.status,
          sr.details_json,

          sr.estimated_amount_paise,

          sr.created_at,
          sr.updated_at

        FROM service_requests sr

        INNER JOIN shops sh
          ON sh.code =
            sr.shop_code

        INNER JOIN services s
          ON s.id =
            sr.service_id

        WHERE
          sr.request_number = ?

        LIMIT 1
      `
  ).bind(
    requestNumber
  ).first();
}
__name(loadRequest, "loadRequest");
async function loadRequestFiles(env, requestId) {
  const result = await env.gyan_registry.prepare(
    `
          SELECT
            id,
            service_request_id,

            section_key,
            field_key,

            original_file_name,
            content_type,
            file_size,

            storage_key,
            storage_status,

            created_at

          FROM service_request_files

          WHERE
            service_request_id = ?

          ORDER BY
            id ASC
        `
  ).bind(
    requestId
  ).all();
  return result.results;
}
__name(loadRequestFiles, "loadRequestFiles");
function verifyRequestAccess(payload, requestRow) {
  if (payload.scope !== "request:read") {
    return createJsonResponse10(
      {
        error: "This access link cannot view a request."
      },
      403
    );
  }
  if (payload.shopCode !== requestRow.shop_code) {
    return createJsonResponse10(
      {
        error: "This access link belongs to another shop."
      },
      403
    );
  }
  if (payload.requestNumber !== requestRow.request_number) {
    return createJsonResponse10(
      {
        error: "This access link belongs to another request."
      },
      403
    );
  }
  return null;
}
__name(verifyRequestAccess, "verifyRequestAccess");
async function createSharedFileDownloadUrl(env, origin, requestRow, file, recipient, expiresAt) {
  const token = await createMagicLinkToken(
    env,
    {
      scope: "file:read",
      shopCode: requestRow.shop_code,
      requestNumber: requestRow.request_number,
      fileId: file.id,
      recipient,
      issuedAt: Math.floor(
        Date.now() / 1e3
      ),
      expiresAt
    }
  );
  return createMagicLinkUrl(
    origin,
    `/api/shared/files/${file.id}/download`,
    token
  );
}
__name(createSharedFileDownloadUrl, "createSharedFileDownloadUrl");
async function handleGetSharedRequest(env, url, requestNumber) {
  const authentication = await requireMagicLink(
    env,
    url
  );
  if ("response" in authentication) {
    return authentication.response;
  }
  const requestRow = await loadRequest(
    env,
    requestNumber
  );
  if (!requestRow) {
    return createJsonResponse10(
      {
        error: "Request not found."
      },
      404
    );
  }
  const accessError = verifyRequestAccess(
    authentication.payload,
    requestRow
  );
  if (accessError) {
    return accessError;
  }
  const expirationDate = calculateExpirationDate2(
    requestRow.created_at
  );
  const files = await loadRequestFiles(
    env,
    requestRow.id
  );
  const filesExpired = requestHasExpired(
    requestRow.created_at
  );
  const expiresAtSeconds = authentication.payload.expiresAt;
  const filesWithDownloadUrls = await Promise.all(
    files.map(
      async (file) => {
        const available = !filesExpired && file.storage_status === "stored";
        let downloadUrl = null;
        if (available) {
          try {
            downloadUrl = await createSharedFileDownloadUrl(
              env,
              url.origin,
              requestRow,
              file,
              authentication.payload.recipient,
              expiresAtSeconds
            );
          } catch (error) {
            console.error(
              "Unable to create shared file link:",
              error
            );
          }
        }
        return {
          id: file.id,
          sectionKey: file.section_key,
          fieldKey: file.field_key,
          name: file.original_file_name,
          contentType: file.content_type,
          size: file.file_size,
          status: filesExpired ? "expired" : file.storage_status,
          available,
          downloadUrl
        };
      }
    )
  );
  return createJsonResponse10({
    access: {
      recipient: authentication.payload.recipient,
      readOnly: true
    },
    request: {
      requestNumber: requestRow.request_number,
      status: requestRow.status,
      createdAt: requestRow.created_at,
      updatedAt: requestRow.updated_at,
      estimatedAmountPaise: requestRow.estimated_amount_paise,
      shop: {
        code: requestRow.shop_code,
        name: requestRow.shop_name
      },
      service: {
        code: requestRow.service_code,
        name: requestRow.service_name
      },
      customer: {
        name: requestRow.customer_name,
        phone: requestRow.phone_number,
        email: requestRow.email_address,
        whatsApp: requestRow.whatsapp_number
      },
      answers: safelyParseJson4(
        requestRow.details_json
      ),
      retention: {
        days: FILE_RETENTION_DAYS2,
        expiresAt: expirationDate?.toISOString() ?? null,
        filesExpired
      },
      files: filesWithDownloadUrls
    }
  });
}
__name(handleGetSharedRequest, "handleGetSharedRequest");
async function handleDownloadSharedFile(env, url, fileId) {
  const authentication = await requireMagicLink(
    env,
    url
  );
  if ("response" in authentication) {
    return authentication.response;
  }
  const payload = authentication.payload;
  if (payload.scope !== "file:read") {
    return createJsonResponse10(
      {
        error: "This access link cannot download files."
      },
      403
    );
  }
  if (payload.fileId !== fileId) {
    return createJsonResponse10(
      {
        error: "This access link belongs to another file."
      },
      403
    );
  }
  const fileRow = await env.gyan_registry.prepare(
    `
          SELECT
            srf.id,
            srf.service_request_id,

            srf.section_key,
            srf.field_key,

            srf.original_file_name,
            srf.content_type,
            srf.file_size,

            srf.storage_key,
            srf.storage_status,

            srf.created_at

          FROM service_request_files srf

          WHERE srf.id = ?

          LIMIT 1
        `
  ).bind(
    fileId
  ).first();
  if (!fileRow) {
    return createJsonResponse10(
      {
        error: "File not found."
      },
      404
    );
  }
  const requestRow = await env.gyan_registry.prepare(
    `
          SELECT
            sr.id,
            sr.request_number,

            sr.shop_code,
            sh.name AS shop_name,

            s.service_code,
            s.name AS service_name,

            sr.customer_name,
            sr.phone_number,
            sr.email_address,
            sr.whatsapp_number,

            sr.status,
            sr.details_json,

            sr.estimated_amount_paise,

            sr.created_at,
            sr.updated_at

          FROM service_requests sr

          INNER JOIN shops sh
            ON sh.code =
              sr.shop_code

          INNER JOIN services s
            ON s.id =
              sr.service_id

          WHERE sr.id = ?

          LIMIT 1
        `
  ).bind(
    fileRow.service_request_id
  ).first();
  if (!requestRow) {
    return createJsonResponse10(
      {
        error: "The file request no longer exists."
      },
      404
    );
  }
  if (payload.shopCode !== requestRow.shop_code || payload.requestNumber !== requestRow.request_number) {
    return createJsonResponse10(
      {
        error: "This access link belongs to another request."
      },
      403
    );
  }
  if (requestHasExpired(
    requestRow.created_at
  )) {
    return createJsonResponse10(
      {
        error: "This file has expired and is no longer available."
      },
      410
    );
  }
  if (fileRow.storage_status !== "stored") {
    return createJsonResponse10(
      {
        error: "This file is no longer available."
      },
      410
    );
  }
  const object = await env.GYAN_PRINT_FILES.get(
    fileRow.storage_key
  );
  if (!object) {
    return createJsonResponse10(
      {
        error: "This file has expired or could not be found."
      },
      410
    );
  }
  const headers = new Headers();
  object.writeHttpMetadata(
    headers
  );
  headers.set(
    "content-type",
    fileRow.content_type || "application/octet-stream"
  );
  headers.set(
    "content-length",
    String(
      fileRow.file_size
    )
  );
  headers.set(
    "content-disposition",
    `attachment; filename*=UTF-8''${encodeURIComponent(
      fileRow.original_file_name
    )}`
  );
  headers.set(
    "cache-control",
    "private, no-store"
  );
  headers.set(
    "x-content-type-options",
    "nosniff"
  );
  return new Response(
    object.body,
    {
      status: 200,
      headers
    }
  );
}
__name(handleDownloadSharedFile, "handleDownloadSharedFile");
async function handleGetShopRequests(env, url, shopCode) {
  const authentication = await requireMagicLink(
    env,
    url
  );
  if ("response" in authentication) {
    return authentication.response;
  }
  const payload = authentication.payload;
  if (payload.scope !== "shop-requests:read") {
    return createJsonResponse10(
      {
        error: "This access link cannot view the shop request list."
      },
      403
    );
  }
  if (payload.recipient !== "shop") {
    return createJsonResponse10(
      {
        error: "Only the shop owner may use this access link."
      },
      403
    );
  }
  if (payload.shopCode !== shopCode) {
    return createJsonResponse10(
      {
        error: "This access link belongs to another shop."
      },
      403
    );
  }
  const shop = await env.gyan_registry.prepare(
    `
          SELECT
            code,
            name

          FROM shops

          WHERE code = ?

          LIMIT 1
        `
  ).bind(
    shopCode
  ).first();
  if (!shop) {
    return createJsonResponse10(
      {
        error: "Shop not found."
      },
      404
    );
  }
  const retentionBoundary = new Date(
    Date.now() - FILE_RETENTION_DAYS2 * 24 * 60 * 60 * 1e3
  ).toISOString();
  const result = await env.gyan_registry.prepare(
    `
          SELECT
            sr.request_number,

            s.service_code,
            s.name AS service_name,

            sr.customer_name,

            sr.status,

            COUNT(
              srf.id
            ) AS file_count,

            sr.created_at,
            sr.updated_at

          FROM service_requests sr

          INNER JOIN services s
            ON s.id =
              sr.service_id

          LEFT JOIN service_request_files srf
            ON srf.service_request_id =
              sr.id

          WHERE
            sr.shop_code = ?

            AND sr.created_at >= ?

          GROUP BY
            sr.id,
            sr.request_number,
            s.service_code,
            s.name,
            sr.customer_name,
            sr.status,
            sr.created_at,
            sr.updated_at

          ORDER BY
            sr.created_at DESC

          LIMIT 200
        `
  ).bind(
    shopCode,
    retentionBoundary
  ).all();
  return createJsonResponse10({
    shop: {
      code: shop.code,
      name: shop.name
    },
    retentionDays: FILE_RETENTION_DAYS2,
    requests: result.results.map(
      (requestRow) => ({
        requestNumber: requestRow.request_number,
        service: {
          code: requestRow.service_code,
          name: requestRow.service_name
        },
        customerName: requestRow.customer_name,
        status: requestRow.status,
        fileCount: Number(
          requestRow.file_count
        ),
        createdAt: requestRow.created_at,
        updatedAt: requestRow.updated_at
      })
    )
  });
}
__name(handleGetShopRequests, "handleGetShopRequests");
async function handleSharedRequestsRoute(request, env, url) {
  const requestMatch = url.pathname.match(
    /^\/api\/shared\/requests\/([A-Za-z0-9_-]{8,120})$/
  );
  if (requestMatch) {
    if (request.method !== "GET") {
      return createJsonResponse10(
        {
          error: "Method not allowed."
        },
        405
      );
    }
    const requestNumber = normalizeRequestNumber(
      requestMatch[1]
    );
    if (!requestNumber) {
      return createJsonResponse10(
        {
          error: "Invalid request number."
        },
        400
      );
    }
    return handleGetSharedRequest(
      env,
      url,
      requestNumber
    );
  }
  const fileMatch = url.pathname.match(
    /^\/api\/shared\/files\/(\d+)\/download$/
  );
  if (fileMatch) {
    if (request.method !== "GET") {
      return createJsonResponse10(
        {
          error: "Method not allowed."
        },
        405
      );
    }
    const fileId = normalizeFileId(
      fileMatch[1]
    );
    if (!fileId) {
      return createJsonResponse10(
        {
          error: "Invalid file identifier."
        },
        400
      );
    }
    return handleDownloadSharedFile(
      env,
      url,
      fileId
    );
  }
  const shopMatch = url.pathname.match(
    /^\/api\/shared\/shops\/([A-Za-z0-9]{4})\/requests$/
  );
  if (shopMatch) {
    if (request.method !== "GET") {
      return createJsonResponse10(
        {
          error: "Method not allowed."
        },
        405
      );
    }
    const shopCode = normalizeShopCode6(
      shopMatch[1]
    );
    if (!shopCode) {
      return createJsonResponse10(
        {
          error: "Invalid shop code."
        },
        400
      );
    }
    return handleGetShopRequests(
      env,
      url,
      shopCode
    );
  }
  return null;
}
__name(handleSharedRequestsRoute, "handleSharedRequestsRoute");

// worker/nearbyShops.ts
var SERVICE_SEARCH_TERMS = {
  NEARBY_PRINT: [
    "print",
    "printing",
    "photocopy",
    "scan"
  ],
  NEARBY_GROCERY: [
    "grocery",
    "vegetable",
    "daily needs"
  ],
  NEARBY_MEDICAL: [
    "medical",
    "medicine",
    "pharmacy",
    "clinic"
  ],
  NEARBY_TUITION: [
    "tuition",
    "tutor",
    "coaching",
    "education"
  ],
  NEARBY_FOOD: [
    "food",
    "restaurant",
    "tiffin",
    "snack"
  ],
  NEARBY_BANKING: [
    "banking",
    "payment",
    "insurance",
    "financial"
  ],
  NEARBY_COURIER: [
    "courier",
    "parcel",
    "postal",
    "delivery"
  ],
  NEARBY_COMPUTER: [
    "computer",
    "internet",
    "accessories",
    "technology"
  ],
  NEARBY_REPAIR: [
    "repair",
    "mobile",
    "appliance",
    "computer repair"
  ]
};
function jsonResponse(data, status = 200) {
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
__name(jsonResponse, "jsonResponse");
function getOptionalNumber(rawValue) {
  if (!rawValue) {
    return null;
  }
  const value = Number(rawValue);
  return Number.isFinite(value) ? value : null;
}
__name(getOptionalNumber, "getOptionalNumber");
function calculateDistanceKm(firstLatitude, firstLongitude, secondLatitude, secondLongitude) {
  const earthRadiusKm = 6371;
  const toRadians = /* @__PURE__ */ __name((value) => value * Math.PI / 180, "toRadians");
  const latitudeDifference = toRadians(
    secondLatitude - firstLatitude
  );
  const longitudeDifference = toRadians(
    secondLongitude - firstLongitude
  );
  const firstLatitudeRadians = toRadians(
    firstLatitude
  );
  const secondLatitudeRadians = toRadians(
    secondLatitude
  );
  const haversine = Math.sin(
    latitudeDifference / 2
  ) ** 2 + Math.cos(
    firstLatitudeRadians
  ) * Math.cos(
    secondLatitudeRadians
  ) * Math.sin(
    longitudeDifference / 2
  ) ** 2;
  return 2 * earthRadiusKm * Math.asin(
    Math.sqrt(haversine)
  );
}
__name(calculateDistanceKm, "calculateDistanceKm");
function normalizeText(value) {
  return value?.trim().toLowerCase() ?? "";
}
__name(normalizeText, "normalizeText");
async function handleNearbyShopsRoute(request, env, url) {
  if (request.method !== "GET" || url.pathname !== "/api/nearby-shops") {
    return null;
  }
  const serviceCode = url.searchParams.get("serviceCode")?.trim().toUpperCase() ?? "";
  const latitude = getOptionalNumber(
    url.searchParams.get("lat")
  );
  const longitude = getOptionalNumber(
    url.searchParams.get("lng")
  );
  const requestedCity = normalizeText(
    url.searchParams.get("city")
  );
  const requestedState = normalizeText(
    url.searchParams.get("state")
  );
  const terms = SERVICE_SEARCH_TERMS[serviceCode] ?? [];
  const result = await env.gyan_registry.prepare(
    `
          SELECT
            sh.code,
            sh.name,
            sh.address_line,
            sh.city,
            sh.state,
            sh.postal_code,

            sh.phone_number,
            sh.whatsapp_number,

            sh.latitude,
            sh.longitude,

            COUNT(
              CASE
                WHEN ss.enabled = 1
                  THEN 1
              END
            ) AS matching_service_count,

            GROUP_CONCAT(
              CASE
                WHEN ss.enabled = 1
                  THEN COALESCE(
                    ss.display_name,
                    s.name
                  )
              END,
              '||'
            ) AS service_names

          FROM shops sh

          LEFT JOIN shop_services ss
            ON ss.shop_code =
              sh.code

          LEFT JOIN services s
            ON s.id =
              ss.service_id

          WHERE sh.status =
            'active'

          GROUP BY
            sh.code,
            sh.name,
            sh.address_line,
            sh.city,
            sh.state,
            sh.postal_code,
            sh.phone_number,
            sh.whatsapp_number,
            sh.latitude,
            sh.longitude
        `
  ).all();
  const shops = result.results.map(
    (row) => {
      const serviceNames = row.service_names?.split("||").map(
        (name) => name.trim()
      ).filter(Boolean) ?? [];
      const matchingServiceCount = terms.length === 0 ? Number(
        row.matching_service_count
      ) : serviceNames.filter(
        (serviceName) => {
          const normalizedName = serviceName.toLowerCase();
          return terms.some(
            (term) => normalizedName.includes(
              term
            )
          );
        }
      ).length;
      const distanceKm = latitude != null && longitude != null && row.latitude != null && row.longitude != null ? calculateDistanceKm(
        latitude,
        longitude,
        Number(row.latitude),
        Number(row.longitude)
      ) : null;
      return {
        code: row.code,
        name: row.name,
        address: [
          row.address_line,
          row.city,
          row.state,
          row.postal_code
        ].filter(Boolean).join(", "),
        phoneNumber: row.phone_number,
        whatsappNumber: row.whatsapp_number,
        latitude: row.latitude == null ? null : Number(
          row.latitude
        ),
        longitude: row.longitude == null ? null : Number(
          row.longitude
        ),
        distanceKm,
        matchingServiceCount,
        serviceNames
      };
    }
  );
  shops.sort(
    (first, second) => {
      const firstCityMatch = requestedCity && normalizeText(
        first.address
      ).includes(
        requestedCity
      ) ? 1 : 0;
      const secondCityMatch = requestedCity && normalizeText(
        second.address
      ).includes(
        requestedCity
      ) ? 1 : 0;
      if (first.matchingServiceCount !== second.matchingServiceCount) {
        return second.matchingServiceCount - first.matchingServiceCount;
      }
      if (firstCityMatch !== secondCityMatch) {
        return secondCityMatch - firstCityMatch;
      }
      if (first.distanceKm != null && second.distanceKm != null) {
        return first.distanceKm - second.distanceKm;
      }
      return first.name.localeCompare(
        second.name
      );
    }
  );
  return jsonResponse({
    serviceCode,
    location: {
      latitude,
      longitude,
      city: requestedCity || null,
      state: requestedState || null
    },
    registeredShops: shops.slice(0, 20),
    externalSearchAvailable: false
  });
}
__name(handleNearbyShopsRoute, "handleNearbyShopsRoute");

// worker/locationHint.ts
function jsonResponse2(data, status = 200) {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "private, max-age=900"
      }
    }
  );
}
__name(jsonResponse2, "jsonResponse");
function getOptionalString(value) {
  return typeof value === "string" ? value : void 0;
}
__name(getOptionalString, "getOptionalString");
function getCountryDetails(countryCode) {
  const normalizedCode = countryCode?.trim().toUpperCase() ?? "";
  if (normalizedCode === "IN") {
    return {
      code: "IN",
      name: "India",
      currencyCode: "INR",
      currencySymbol: "\u20B9"
    };
  }
  if (normalizedCode === "US") {
    return {
      code: "US",
      name: "United States",
      currencyCode: "USD",
      currencySymbol: "$"
    };
  }
  return {
    code: "OTHER",
    name: "Other",
    currencyCode: null,
    currencySymbol: null
  };
}
__name(getCountryDetails, "getCountryDetails");
function inferCountryCode(cloudflareCountry, browserTimezone, browserLanguages) {
  const cfCountry = cloudflareCountry?.trim().toUpperCase();
  if (cfCountry === "IN" || cfCountry === "US") {
    return cfCountry;
  }
  const timezone = browserTimezone?.trim().toLowerCase() ?? "";
  if (timezone === "asia/kolkata" || timezone === "asia/calcutta") {
    return "IN";
  }
  if (timezone.startsWith(
    "america/"
  )) {
    return "US";
  }
  const languages = browserLanguages?.toLowerCase() ?? "";
  if (languages.includes(
    "en-in"
  ) || languages.includes(
    "hi-in"
  )) {
    return "IN";
  }
  if (languages.includes(
    "en-us"
  )) {
    return "US";
  }
  return "OTHER";
}
__name(inferCountryCode, "inferCountryCode");
function handleLocationHintRoute(request, url) {
  if (request.method !== "GET" || url.pathname !== "/api/location-hint") {
    return null;
  }
  const cf = request.cf;
  const browserTimezone = request.headers.get(
    "x-gyan-timezone"
  );
  const browserLanguages = request.headers.get(
    "x-gyan-languages"
  );
  const cfCountry = getOptionalString(
    cf?.country
  );
  const cfRegion = getOptionalString(
    cf?.region
  );
  const cfRegionCode = getOptionalString(
    cf?.regionCode
  );
  const cfCity = getOptionalString(
    cf?.city
  );
  const cfPostalCode = getOptionalString(
    cf?.postalCode
  );
  const cfTimezone = getOptionalString(
    cf?.timezone
  );
  const inferredCountryCode = inferCountryCode(
    cfCountry,
    browserTimezone,
    browserLanguages
  );
  const country = getCountryDetails(
    inferredCountryCode
  );
  return jsonResponse2({
    countryCode: country.code,
    country: country.name,
    currencyCode: country.currencyCode,
    currencySymbol: country.currencySymbol,
    region: cfRegion ?? "",
    regionCode: cfRegionCode ?? "",
    city: cfCity ?? "",
    postalCode: cfPostalCode ?? "",
    timezone: cfTimezone ?? browserTimezone ?? "",
    source: cfCountry ? "ip" : "browser",
    approximate: true
  });
}
__name(handleLocationHintRoute, "handleLocationHintRoute");

// worker/index.ts
function createJsonResponse11(data, status = 200) {
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
__name(createJsonResponse11, "createJsonResponse");
function normalizeShopCode7(value) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim().toUpperCase();
  return /^[A-Z0-9]{4}$/.test(
    normalized
  ) ? normalized : null;
}
__name(normalizeShopCode7, "normalizeShopCode");
function normalizeRequiredText3(value) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim();
  return normalized.length > 0 ? normalized : null;
}
__name(normalizeRequiredText3, "normalizeRequiredText");
function normalizeOptionalText3(value) {
  if (typeof value !== "string") {
    return null;
  }
  const normalized = value.trim();
  return normalized.length > 0 ? normalized : null;
}
__name(normalizeOptionalText3, "normalizeOptionalText");
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
  const shopCode = normalizeShopCode7(
    rawShopCode
  );
  if (!shopCode) {
    return createJsonResponse11(
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
    return createJsonResponse11(
      {
        error: "Shop not found."
      },
      404
    );
  }
  if (shop.status !== "active") {
    return createJsonResponse11(
      {
        error: "Shop is not active."
      },
      403
    );
  }
  return createJsonResponse11({
    shop: mapShopRow(shop)
  });
}
__name(handleGetShop, "handleGetShop");
async function handleRegisterShop(request, env) {
  let requestBody;
  try {
    requestBody = await request.json();
  } catch {
    return createJsonResponse11(
      {
        error: "Request body must be valid JSON."
      },
      400
    );
  }
  const code = normalizeShopCode7(
    requestBody.code
  );
  const name = normalizeRequiredText3(
    requestBody.name
  );
  const ownerName = normalizeRequiredText3(
    requestBody.ownerName
  );
  const phoneNumber = normalizeRequiredText3(
    requestBody.phoneNumber
  );
  const whatsAppNumber = normalizeOptionalText3(
    requestBody.whatsAppNumber
  );
  const emailAddress = normalizeOptionalText3(
    requestBody.emailAddress
  );
  const addressLine = normalizeRequiredText3(
    requestBody.addressLine
  );
  const city = normalizeRequiredText3(
    requestBody.city
  );
  const state = normalizeRequiredText3(
    requestBody.state
  );
  const postalCode = normalizeRequiredText3(
    requestBody.postalCode
  );
  if (!code || !name || !ownerName || !phoneNumber || !addressLine || !city || !state || !postalCode) {
    return createJsonResponse11(
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
    return createJsonResponse11(
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
    return createJsonResponse11(
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
    return createJsonResponse11(
      {
        error: "The shop was saved but could not be loaded."
      },
      500
    );
  }
  return createJsonResponse11(
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
  const adminServiceFormsResponse = await handleAdminServiceFormsRoute(
    request,
    env,
    url
  );
  if (adminServiceFormsResponse) {
    return adminServiceFormsResponse;
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
  const locationHintResponse = handleLocationHintRoute(
    request,
    url
  );
  if (locationHintResponse) {
    return locationHintResponse;
  }
  const nearbyShopsResponse = await handleNearbyShopsRoute(
    request,
    env,
    url
  );
  if (nearbyShopsResponse) {
    return nearbyShopsResponse;
  }
  const serviceFormResponse = await handleServiceFormsRoute(
    request,
    env,
    url
  );
  if (serviceFormResponse) {
    return serviceFormResponse;
  }
  const serviceRequestResponse = await handleServiceRequestsRoute(
    request,
    env,
    url
  );
  if (serviceRequestResponse) {
    return serviceRequestResponse;
  }
  const sharedRequestResponse = await handleSharedRequestsRoute(
    request,
    env,
    url
  );
  if (sharedRequestResponse) {
    return sharedRequestResponse;
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
    return createJsonResponse11({
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
  return createJsonResponse11(
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
      return createJsonResponse11(
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

// .wrangler/tmp/bundle-AE19f2/middleware-insertion-facade.js
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

// .wrangler/tmp/bundle-AE19f2/middleware-loader.entry.ts
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
