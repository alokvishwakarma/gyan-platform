interface GyanIdentityEnv {
  gyan_registry: D1Database;
  RESEND_API_KEY?: string;
}

const GYAN_CODE_ALPHABET =
  "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";

function identityJson(
  value: unknown,
  status = 200,
  extraHeaders: HeadersInit = {},
): Response {
  return new Response(
    JSON.stringify(value),
    {
      status,
      headers: {
        "content-type":
          "application/json; charset=utf-8",
        "cache-control":
          "no-store",
        ...extraHeaders,
      },
    },
  );
}

function identityCookie(
  request: Request,
  name: string,
): string {
  const raw =
    request.headers.get("cookie") ?? "";

  for (const part of raw.split(";")) {
    const [key, ...value] =
      part.trim().split("=");

    if (key === name) {
      return decodeURIComponent(
        value.join("="),
      );
    }
  }

  return "";
}

function identityRandomCode(
  length = 4,
): string {
  const bytes =
    crypto.getRandomValues(
      new Uint8Array(length),
    );

  return Array.from(
    bytes,
    (value) =>
      GYAN_CODE_ALPHABET[
        value %
          GYAN_CODE_ALPHABET.length
      ],
  ).join("");
}

function identityRandomSecret():
  string {
  const bytes =
    crypto.getRandomValues(
      new Uint8Array(24),
    );

  return Array.from(
    bytes,
    (value) =>
      value
        .toString(16)
        .padStart(2, "0"),
  ).join("");
}

async function identitySha256(
  value: string,
): Promise<string> {
  const digest =
    await crypto.subtle.digest(
      "SHA-256",
      new TextEncoder().encode(value),
    );

  return Array.from(
    new Uint8Array(digest),
    (value) =>
      value
        .toString(16)
        .padStart(2, "0"),
  ).join("");
}

async function allocateGyanCode(
  db: D1Database,
): Promise<string> {
  for (
    let attempt = 0;
    attempt < 30;
    attempt += 1
  ) {
    const code =
      identityRandomCode(
        attempt < 20
          ? 4
          : 5,
      );

    const existing =
      await db
        .prepare(
          `
          SELECT code
          FROM gyan_accounts
          WHERE code = ?

          UNION ALL

          SELECT alias_code
          FROM gyan_account_aliases
          WHERE alias_code = ?

          LIMIT 1
          `,
        )
        .bind(
          code,
          code,
        )
        .first();

    if (!existing) {
      return code;
    }
  }

  throw new Error(
    "Unable to allocate GYAN code.",
  );
}

async function loadGyanAccount(
  db: D1Database,
  accountId: number,
) {
  return db
    .prepare(
      `
      SELECT
        id,
        code,
        display_name,
        access_code,
        email,
        registered
      FROM gyan_accounts
      WHERE id = ?
      LIMIT 1
      `,
    )
    .bind(accountId)
    .first<{
      id: number;
      code: string;
      display_name: string;
      access_code: string | null;
      email: string | null;
      registered: number;
    }>();
}

function publicGyanIdentity(
  row: {
    id: number;
    code: string;
    display_name: string;
    access_code: string | null;
    email: string | null;
    registered: number;
  },
  origin: string,
) {
  return {
    accountId:
      row.id,

    code:
      row.code,

    displayName:
      row.display_name,

    publicUrl:
      `${origin}/${row.code.toLowerCase()}`,

    registered:
      Boolean(row.registered),

    /*
     * LOCAL STEP 1:
     * The anonymous browser cookie proves this browser owns
     * this newly-created GYAN, so Account menu may show code.
     * We can tighten this further when auth merge is wired.
     */
    accessCode:
      row.access_code ??
      undefined,

    maskedEmail:
      row.email
        ? `${row.email.slice(0, 1)}••••@${row.email.split("@")[1] ?? ""}`
        : undefined,
  };
}

interface GyanCreationLocation {
  city: string | null;
  region: string | null;
  regionCode: string | null;
  country: string | null;
  countryCode: string | null;
  timezone: string | null;
}


function getGyanCreationLocation(
  request: Request,
): GyanCreationLocation {
  const cf =
    (
      request as Request & {
        cf?: {
          city?: string;
          region?: string;
          regionCode?: string;
          country?: string;
          timezone?: string;
        };
      }
    ).cf;

  const countryCode =
    typeof cf?.country ===
      "string" &&
    cf.country.trim()
      ? cf.country
          .trim()
          .toUpperCase()
      : null;

  let country:
    string | null =
      null;

  if (countryCode) {
    try {
      country =
        new Intl.DisplayNames(
          ["en"],
          {
            type:
              "region",
          },
        ).of(
          countryCode,
        ) ??
        null;
    } catch {
      country =
        null;
    }
  }

  return {
    city:
      typeof cf?.city ===
        "string" &&
      cf.city.trim()
        ? cf.city.trim()
        : null,

    region:
      typeof cf?.region ===
        "string" &&
      cf.region.trim()
        ? cf.region.trim()
        : null,

    regionCode:
      typeof cf?.regionCode ===
        "string" &&
      cf.regionCode.trim()
        ? cf.regionCode
            .trim()
            .toUpperCase()
        : null,

    country,

    countryCode,

    timezone:
      typeof cf?.timezone ===
        "string" &&
      cf.timezone.trim()
        ? cf.timezone.trim()
        : null,
  };
}



interface GyanIdentityClientInput {
  userAgent?: unknown;
  language?: unknown;
  languages?: unknown;
  platform?: unknown;
  touch?: unknown;
  screenWidth?: unknown;
  screenHeight?: unknown;
  viewportWidth?: unknown;
  viewportHeight?: unknown;
  referrer?: unknown;
  utmSource?: unknown;
  utmMedium?: unknown;
  utmCampaign?: unknown;
}


interface GyanCreationClient {
  deviceType: string | null;
  os: string | null;
  osVersion: string | null;
  browser: string | null;
  browserVersion: string | null;
  screenWidth: number | null;
  screenHeight: number | null;
  viewportWidth: number | null;
  viewportHeight: number | null;
  touch: number;
  language: string | null;
  languages: string | null;
  platform: string | null;
  referrer: string | null;
  utmSource: string | null;
  utmMedium: string | null;
  utmCampaign: string | null;
}


function cleanIdentityText(
  value: unknown,
  maxLength: number,
): string | null {
  if (
    typeof value !==
      "string"
  ) {
    return null;
  }

  const cleaned =
    value
      .trim()
      .slice(
        0,
        maxLength,
      );

  return cleaned ||
    null;
}


function cleanIdentityNumber(
  value: unknown,
  min: number,
  max: number,
): number | null {
  const number =
    Number(
      value,
    );

  if (
    !Number.isFinite(
      number,
    )
  ) {
    return null;
  }

  return Math.max(
    min,
    Math.min(
      max,
      Math.round(
        number,
      ),
    ),
  );
}


function parseBrowser(
  userAgent: string,
): {
  name: string | null;
  version: string | null;
} {
  const patterns:
    Array<{
      name: string;
      regex: RegExp;
    }> = [
      {
        name: "Edge",
        regex: /Edg\/([\d.]+)/,
      },
      {
        name: "Firefox",
        regex: /Firefox\/([\d.]+)/,
      },
      {
        name: "Chrome",
        regex: /(?:Chrome|CriOS)\/([\d.]+)/,
      },
      {
        name: "Safari",
        regex: /Version\/([\d.]+).*Safari\//,
      },
    ];

  for (
    const pattern
    of patterns
  ) {
    const match =
      userAgent.match(
        pattern.regex,
      );

    if (match) {
      return {
        name:
          pattern.name,

        version:
          match[1] ??
          null,
      };
    }
  }

  return {
    name:
      null,

    version:
      null,
  };
}


function parseOs(
  userAgent: string,
): {
  name: string | null;
  version: string | null;
} {
  const ios =
    userAgent.match(
      /(?:iPhone OS|CPU (?:iPhone )?OS) ([\d_]+)/,
    );

  if (ios) {
    return {
      name:
        "iOS",

      version:
        (
          ios[1] ??
          ""
        ).replaceAll(
          "_",
          ".",
        ) ||
        null,
    };
  }

  const android =
    userAgent.match(
      /Android ([\d.]+)/,
    );

  if (android) {
    return {
      name:
        "Android",

      version:
        android[1] ??
        null,
    };
  }

  const windows =
    userAgent.match(
      /Windows NT ([\d.]+)/,
    );

  if (windows) {
    return {
      name:
        "Windows",

      version:
        windows[1] ??
        null,
    };
  }

  const mac =
    userAgent.match(
      /Mac OS X ([\d_]+)/,
    );

  if (mac) {
    return {
      name:
        "macOS",

      version:
        (
          mac[1] ??
          ""
        ).replaceAll(
          "_",
          ".",
        ) ||
        null,
    };
  }

  if (
    /Linux/i.test(
      userAgent,
    )
  ) {
    return {
      name:
        "Linux",

      version:
        null,
    };
  }

  return {
    name:
      null,

    version:
      null,
  };
}


function sanitizeReferrer(
  value: unknown,
): string | null {
  const text =
    cleanIdentityText(
      value,
      1000,
    );

  if (!text) {
    return "direct";
  }

  try {
    const parsed =
      new URL(
        text,
      );

    return parsed.hostname
      .toLowerCase()
      .slice(
        0,
        255,
      );
  } catch {
    return null;
  }
}


function getGyanCreationClient(
  input:
    GyanIdentityClientInput | null,
): GyanCreationClient {
  const userAgent =
    cleanIdentityText(
      input?.userAgent,
      500,
    ) ??
    "";

  const browser =
    parseBrowser(
      userAgent,
    );

  const os =
    parseOs(
      userAgent,
    );

  const screenWidth =
    cleanIdentityNumber(
      input?.screenWidth,
      0,
      10000,
    );

  const touch =
    input?.touch ===
      true;

  let deviceType:
    string | null =
      "desktop";

  if (
    /iPad|Tablet/i.test(
      userAgent,
    ) ||
    (
      /Android/i.test(
        userAgent,
      ) &&
      !/Mobile/i.test(
        userAgent,
      )
    )
  ) {
    deviceType =
      "tablet";
  } else if (
    /iPhone|iPod|Android.*Mobile|Mobile/i.test(
      userAgent,
    ) ||
    (
      touch &&
      screenWidth !==
        null &&
      screenWidth <=
        600
    )
  ) {
    deviceType =
      "mobile";
  }

  const languages =
    Array.isArray(
      input?.languages,
    )
      ? input.languages
          .filter(
            (
              value,
            ): value is string =>
              typeof value ===
                "string",
          )
          .map(
            (
              value,
            ) =>
              value.trim(),
          )
          .filter(
            Boolean,
          )
          .slice(
            0,
            8,
          )
          .join(
            ",",
          )
          .slice(
            0,
            255,
          ) ||
        null
      : null;

  return {
    deviceType,

    os:
      os.name,

    osVersion:
      os.version,

    browser:
      browser.name,

    browserVersion:
      browser.version,

    screenWidth,

    screenHeight:
      cleanIdentityNumber(
        input?.screenHeight,
        0,
        10000,
      ),

    viewportWidth:
      cleanIdentityNumber(
        input?.viewportWidth,
        0,
        10000,
      ),

    viewportHeight:
      cleanIdentityNumber(
        input?.viewportHeight,
        0,
        10000,
      ),

    touch:
      touch
        ? 1
        : 0,

    language:
      cleanIdentityText(
        input?.language,
        64,
      ),

    languages,

    platform:
      cleanIdentityText(
        input?.platform,
        120,
      ),

    referrer:
      sanitizeReferrer(
        input?.referrer,
      ),

    utmSource:
      cleanIdentityText(
        input?.utmSource,
        120,
      ),

    utmMedium:
      cleanIdentityText(
        input?.utmMedium,
        120,
      ),

    utmCampaign:
      cleanIdentityText(
        input?.utmCampaign,
        180,
      ),
  };
}


function escapeIdentityHtml(
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


async function sendNewGyanAccountNotice(
  env: GyanIdentityEnv,
  notice: {
    accountId: number;
    code: string;
    displayName: string;
    location: GyanCreationLocation;
    client: GyanCreationClient;
    isLocal: boolean;
  },
): Promise<void> {
  if (
    !env.RESEND_API_KEY
  ) {
    console.warn(
      "New GYAN account email skipped: RESEND_API_KEY is not configured.",
    );
    return;
  }

  const prefix =
    notice.isLocal
      ? "[LOCAL] "
      : "";

  const subject =
    `${prefix}New GYAN Account · ${notice.code} · ${notice.displayName}`;

  const publicUrl =
    notice.isLocal
      ? `http://localhost:8787/${notice.code.toLowerCase()}`
      : `https://gyan.cc/${notice.code.toLowerCase()}`;

  const show =
    (
      value:
        string |
        number |
        null,
    ): string =>
      value ===
        null ||
      value ===
        ""
        ? "Not available"
        : String(
            value,
          );

  const text =
    [
      "New GYAN Account Created",
      "",
      `GYAN Code: ${notice.code}`,
      `Display Name: ${notice.displayName}`,
      `Account ID: ${notice.accountId}`,
      "",
      "Creation Location",
      `City: ${show(notice.location.city)}`,
      `State / Region: ${show(notice.location.region)}`,
      `State Code: ${show(notice.location.regionCode)}`,
      `Country: ${show(notice.location.country)}`,
      `Country Code: ${show(notice.location.countryCode)}`,
      `Timezone: ${show(notice.location.timezone)}`,
      "",
      "Device",
      `Type: ${show(notice.client.deviceType)}`,
      `OS: ${show(notice.client.os)} ${show(notice.client.osVersion)}`,
      `Browser: ${show(notice.client.browser)} ${show(notice.client.browserVersion)}`,
      `Screen: ${show(notice.client.screenWidth)} × ${show(notice.client.screenHeight)}`,
      `Viewport: ${show(notice.client.viewportWidth)} × ${show(notice.client.viewportHeight)}`,
      `Touch: ${notice.client.touch ? "Yes" : "No"}`,
      `Language: ${show(notice.client.language)}`,
      `Languages: ${show(notice.client.languages)}`,
      `Platform: ${show(notice.client.platform)}`,
      "",
      "Acquisition",
      `Referrer: ${show(notice.client.referrer)}`,
      `UTM Source: ${show(notice.client.utmSource)}`,
      `UTM Medium: ${show(notice.client.utmMedium)}`,
      `UTM Campaign: ${show(notice.client.utmCampaign)}`,
      "",
      publicUrl,
    ].join(
      "\n",
    );

  const html =
    `<div style="font-family:Arial,sans-serif;line-height:1.5;color:#263238;white-space:pre-line">${escapeIdentityHtml(
      text,
    )}</div><p><a href="${escapeIdentityHtml(
      publicUrl,
    )}">${escapeIdentityHtml(
      publicUrl,
    )}</a></p>`;

  const response =
    await fetch(
      "https://api.resend.com/emails",
      {
        method:
          "POST",

        headers: {
          Authorization:
            `Bearer ${env.RESEND_API_KEY}`,

          "Content-Type":
            "application/json",
        },

        body:
          JSON.stringify({
            from:
              "GYAN Admin <admin@gyan.cc>",

            to: [
              "admin@gyan.cc",
            ],

            subject,
            text,
            html,
          }),
      },
    );

  if (
    !response.ok
  ) {
    const details =
      await response.text();

    throw new Error(
      `New GYAN account email failed (${response.status}): ${details}`,
    );
  }
}



async function loadPublicGyanAccountByCode(
  db: D1Database,
  rawCode: string,
): Promise<{
  id: number;
  code: string;
  displayName: string;
  registered: boolean;
  createdAt: string;
} | null> {
  const code =
    rawCode
      .trim()
      .toUpperCase();

  if (
    !/^[A-Z0-9]{4,8}$/.test(
      code,
    )
  ) {
    return null;
  }

  const row =
    await db
      .prepare(
        `
        SELECT
          ga.id,
          ga.code,
          ga.display_name,
          ga.registered,
          ga.created_at
        FROM gyan_accounts ga
        WHERE ga.code = ?

        UNION ALL

        SELECT
          ga.id,
          ga.code,
          ga.display_name,
          ga.registered,
          ga.created_at
        FROM gyan_account_aliases alias
        INNER JOIN gyan_accounts ga
          ON ga.id =
            alias.account_id
        WHERE alias.alias_code = ?

        LIMIT 1
        `,
      )
      .bind(
        code,
        code,
      )
      .first<{
        id: number;
        code: string;
        display_name: string;
        registered: number;
        created_at: string;
      }>();

  if (!row) {
    return null;
  }

  return {
    id:
      row.id,

    code:
      row.code,

    displayName:
      row.display_name,

    registered:
      Boolean(
        row.registered,
      ),

    createdAt:
      row.created_at,
  };
}


export async function handleGyanIdentityRoute(
  request: Request,
  env: GyanIdentityEnv,
  url: URL,
): Promise<Response | null> {
  /*
   * Public unified-GYAN lookup used by /ABCD pages.
   *
   * GET /api/gyan-identity/ABCD
   */
  const publicCodeMatch =
    url.pathname.match(
      /^\/api\/gyan-identity\/([A-Za-z0-9]{4,8})$/,
    );

  if (
    request.method ===
      "GET" &&
    publicCodeMatch
  ) {
    const account =
      await loadPublicGyanAccountByCode(
        env.gyan_registry,
        publicCodeMatch[1],
      );

    if (!account) {
      return identityJson(
        {
          error:
            "GYAN code not found.",
        },
        404,
      );
    }

    return identityJson({
      account,
    });
  }

  if (
    url.pathname !==
      "/api/gyan-identity"
  ) {
    return null;
  }

  if (
    request.method !==
      "POST"
  ) {
    return identityJson(
      {
        error:
          "Method not allowed.",
      },
      405,
    );
  }

  let requestBody:
    {
      client?:
        GyanIdentityClientInput;
    } = {};

  try {
    requestBody =
      await request.json<{
        client?:
          GyanIdentityClientInput;
      }>();
  } catch {
    requestBody =
      {};
  }

  const creationClient =
    getGyanCreationClient(
      requestBody.client ??
      null,
    );


  const existingSecret =
    identityCookie(
      request,
      "gyan_anon",
    );

  if (existingSecret) {
    const secretHash =
      await identitySha256(
        existingSecret,
      );

    const session =
      await env.gyan_registry
        .prepare(
          `
          SELECT account_id
          FROM gyan_browser_sessions
          WHERE secret_hash = ?
          LIMIT 1
          `,
        )
        .bind(secretHash)
        .first<{
          account_id: number;
        }>();

    if (session) {
      const account =
        await loadGyanAccount(
          env.gyan_registry,
          session.account_id,
        );

      if (account) {
        await env.gyan_registry
          .prepare(
            `
            UPDATE gyan_browser_sessions
            SET last_seen_at =
              CURRENT_TIMESTAMP
            WHERE secret_hash = ?
            `,
          )
          .bind(secretHash)
          .run();

        return identityJson({
          identity:
            publicGyanIdentity(
              account,
              url.origin,
            ),
        });
      }
    }
  }

  const code =
    await allocateGyanCode(
      env.gyan_registry,
    );

  const accessCode =
    `${identityRandomCode(5)}-${identityRandomCode(5)}`;

  const displayName =
    `HappyMango${Math.floor(
      100 +
        Math.random() *
          900,
    )}`;

  const creationLocation =
    getGyanCreationLocation(
      request,
    );

  const insert =
    await env.gyan_registry
      .prepare(
        `
        INSERT INTO gyan_accounts (
          code,
          display_name,
          access_code,
          registered,
          created_city,
          created_region,
          created_region_code,
          created_country,
          created_country_code,
          created_timezone,
          created_device_type,
          created_os,
          created_os_version,
          created_browser,
          created_browser_version,
          created_screen_width,
          created_screen_height,
          created_viewport_width,
          created_viewport_height,
          created_touch,
          created_language,
          created_languages,
          created_platform,
          created_referrer,
          created_utm_source,
          created_utm_medium,
          created_utm_campaign
        )
        VALUES (
          ?, ?, ?, 0,
          ?, ?, ?, ?, ?, ?,
          ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
          ?, ?, ?, ?, ?, ?, ?

        )
        `,
      )
      .bind(
        code,
        displayName,
        accessCode,
        creationLocation.city,
        creationLocation.region,
        creationLocation.regionCode,
        creationLocation.country,
        creationLocation.countryCode,
        creationLocation.timezone,
        creationClient.deviceType,
        creationClient.os,
        creationClient.osVersion,
        creationClient.browser,
        creationClient.browserVersion,
        creationClient.screenWidth,
        creationClient.screenHeight,
        creationClient.viewportWidth,
        creationClient.viewportHeight,
        creationClient.touch,
        creationClient.language,
        creationClient.languages,
        creationClient.platform,
        creationClient.referrer,
        creationClient.utmSource,
        creationClient.utmMedium,
        creationClient.utmCampaign,
      )
      .run();

  const accountId =
    Number(
      insert.meta.last_row_id,
    );

  const secret =
    identityRandomSecret();

  const secretHash =
    await identitySha256(
      secret,
    );

  await env.gyan_registry
    .prepare(
      `
      INSERT INTO gyan_browser_sessions (
        account_id,
        secret_hash
      )
      VALUES (?, ?)
      `,
    )
    .bind(
      accountId,
      secretHash,
    )
    .run();

  try {
    await sendNewGyanAccountNotice(
      env,
      {
        accountId,
        code,
        displayName,
        location:
          creationLocation,
        client:
          creationClient,
        isLocal:
          url.hostname ===
            "localhost" ||
          url.hostname ===
            "127.0.0.1",
      },
    );
  } catch (
    error
  ) {
    console.error(
      "Unable to send new GYAN account notification:",
      error,
    );
  }


  const account =
    await loadGyanAccount(
      env.gyan_registry,
      accountId,
    );

  return identityJson(
    {
      identity:
        account
          ? publicGyanIdentity(
              account,
              url.origin,
            )
          : null,
    },
    200,
    {
      /*
       * localhost is HTTP, so omit Secure locally.
       * Add Secure in production.
       */
      "set-cookie":
        `gyan_anon=${encodeURIComponent(
          secret,
        )}; Path=/; HttpOnly; SameSite=Lax; Max-Age=31536000`,
    },
  );
}
