import {
  ensureUnifiedGyanGoodies,
} from "./calendarAccess";

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


async function loadPublicGyanAccountByCode(
  db: D1Database,
  code: string,
) {
  const normalizedCode =
    code
      .trim()
      .toUpperCase();

  return db
    .prepare(
      `
      SELECT
        ga.id,
        ga.code,
        ga.display_name,
        ga.registered,
        ga.created_at
      FROM gyan_accounts ga
      LEFT JOIN gyan_account_aliases aa
        ON aa.account_id = ga.id
      WHERE
        ga.code = ?
        OR aa.alias_code = ?
      LIMIT 1
      `,
    )
    .bind(
      normalizedCode,
      normalizedCode,
    )
    .first<{
      id: number;
      code: string;
      display_name: string;
      registered: number;
      created_at: string;
    }>();
}

async function sendGyanAccountVerificationEmail({
  env,
  email,
  displayName,
  verifyUrl,
}: {
  env: GyanIdentityEnv;
  email: string;
  displayName: string;
  verifyUrl: string;
}): Promise<void> {
  if (!env.RESEND_API_KEY) {
    throw new Error(
      "Email verification is not configured.",
    );
  }

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
              "GYAN <admin@gyan.cc>",

            to: [
              email,
            ],

            subject:
              "Verify your GYAN email",

            text: [
              `Hi ${displayName},`,
              "",
              "Please verify this email for your GYAN account:",
              verifyUrl,
              "",
              "If you did not request this, you can ignore this email.",
            ].join(
              "\\n",
            ),

            html:
              `<p>Hi ${displayName},</p>` +
              `<p>Please verify this email for your GYAN account.</p>` +
              `<p><a href="${verifyUrl}">Verify email</a></p>` +
              `<p>If you did not request this, you can ignore this email.</p>`,
          }),
      },
    );

  if (!response.ok) {
    const details =
      await response.text();

    console.error(
      "GYAN email verification failed:",
      response.status,
      details,
    );

    throw new Error(
      "Verification email could not be sent.",
    );
  }
}


async function publicGyanIdentity(
  env: GyanIdentityEnv,
  row: {
    id: number;
    code: string;
    display_name: string;
    access_code: string | null;
    email: string | null;
    registered: number;
  },

  origin:
    string,
) {
  const bundle =
    await ensureUnifiedGyanGoodies(
      env,
      row.id,
      origin,
    );

  const pendingEmail =
    await env.gyan_registry
      .prepare(
        `
          SELECT email
          FROM gyan_account_email_verifications
          WHERE
            account_id = ?
            AND verified_at IS NULL
          ORDER BY updated_at DESC
          LIMIT 1
        `,
      )
      .bind(
        row.id,
      )
      .first<{
        email: string;
      }>();

  const emailForDisplay =
    row.email ??
    pendingEmail?.email ??
    null;

  const emailStatus =
    row.email
      ? "verified"
      : pendingEmail?.email
        ? "pending"
        : "none";

  return {
    accountId:
      row.id,

    code:
      row.code,

    displayName:
      row.display_name,

    publicUrl:
      `${origin.replace(/\/$/, "")}/${row.code.toLowerCase()}`,

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
      emailForDisplay
        ? `${emailForDisplay.slice(0, 1)}••••@${emailForDisplay.split("@")[1] ?? ""}`
        : undefined,

    emailStatus,

    welcomeGems:
      bundle.welcomeGems,

    goodies:
      bundle.goodies,
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

  const locationLabel =
    [
      notice.location.city,
      notice.location.regionCode,
      notice.location.countryCode,
    ]
      .filter(
        (
          value,
        ): value is string =>
          Boolean(
            value &&
            value.trim(),
          ),
      )
      .join(" ");

  const subject =
    `${prefix}New GYAN Account · ${notice.code} · ${notice.displayName}` +
    (
      locationLabel
        ? ` · ${locationLabel}`
        : ""
    );

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



const GYAN_NAME_FIRST = [
  "Stone",
  "Red",
  "Blue",
  "Green",
  "Golden",
  "Silver",
  "Sunny",
  "Sunshine",
  "Moon",
  "River",
  "Ocean",
  "Cloud",
  "Star",
  "Bright",
  "Swift",
  "Happy",
  "Clever",
  "Quiet",
  "Little",
  "Grand",
  "Purple",
  "Amber",
  "Coral",
  "Crystal",
  "Forest",
  "Morning",
  "Evening",
  "Sky",
  "Snow",
  "Spring",
  "Summer",
  "Autumn",
];

const GYAN_NAME_SECOND = [
  "Peacock",
  "Mouse",
  "Falcon",
  "Panda",
  "Owl",
  "Fox",
  "Tiger",
  "Koala",
  "Rabbit",
  "Dolphin",
  "Sparrow",
  "Turtle",
  "Mango",
  "Leaf",
  "Lotus",
  "Willow",
  "Cedar",
  "Maple",
  "Comet",
  "Moon",
  "Star",
  "Silver",
  "Sun",
  "Cloud",
  "River",
  "Meadow",
  "Robin",
  "Otter",
  "Finch",
  "Deer",
  "Butterfly",
  "Bee",
];

function randomGyanDisplayName():
  string {
  const first =
    GYAN_NAME_FIRST[
      Math.floor(
        Math.random() *
          GYAN_NAME_FIRST.length,
      )
    ];

  const second =
    GYAN_NAME_SECOND[
      Math.floor(
        Math.random() *
          GYAN_NAME_SECOND.length,
      )
    ];

  const number =
    Math.floor(
      100 +
        Math.random() *
          900,
    );

  return `${first}${second}${number}`;
}


export async function handleGyanIdentityRoute(
  request: Request,
  env: GyanIdentityEnv,
  url: URL,
): Promise<Response | null> {
  if (
    url.pathname ===
      "/api/gyan-identity/email" &&
    request.method ===
      "POST"
  ) {
    const existingSecret =
      identityCookie(
        request,
        "gyan_anon",
      );

    if (!existingSecret) {
      return identityJson(
        {
          error:
            "GYAN ownership could not be verified.",
        },
        401,
      );
    }

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
        .bind(
          secretHash,
        )
        .first<{
          account_id: number;
        }>();

    if (!session) {
      return identityJson(
        {
          error:
            "GYAN ownership could not be verified.",
        },
        401,
      );
    }

    const account =
      await loadGyanAccount(
        env.gyan_registry,
        session.account_id,
      );

    if (!account) {
      return identityJson(
        {
          error:
            "GYAN account could not be loaded.",
        },
        404,
      );
    }

    // eslint-disable-next-line no-useless-assignment
    let body:
      {
        email?: unknown;
      } = {};

    try {
      body =
        await request.json<{
          email?: unknown;
        }>();
    } catch {
      return identityJson(
        {
          error:
            "Invalid request.",
        },
        400,
      );
    }

    const email =
      typeof body.email ===
        "string"
        ? body.email
            .trim()
            .toLowerCase()
        : "";

    if (
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
        email,
      )
    ) {
      return identityJson(
        {
          error:
            "Enter a valid email address.",
        },
        400,
      );
    }

    if (
      account.email &&
      account.email
        .trim()
        .toLowerCase() ===
        email
    ) {
      return identityJson({
        saved:
          true,
        emailStatus:
          "verified",
        maskedEmail:
          `${email.slice(0, 1)}••••@${email.split("@")[1] ?? ""}`,
      });
    }

    const token =
      identityRandomSecret();

    const tokenHash =
      await identitySha256(
        token,
      );

    /*
     * Save the email BEFORE sending verification.
     * This is intentionally persistent even while pending.
     */
    await env.gyan_registry
      .prepare(
        `
          INSERT INTO gyan_account_email_verifications (
            account_id,
            email,
            token_hash,
            expires_at
          )
          VALUES (
            ?, ?, ?,
            datetime(
              'now',
              '+30 minutes'
            )
          )
          ON CONFLICT(account_id)
          DO UPDATE SET
            email =
              excluded.email,
            token_hash =
              excluded.token_hash,
            expires_at =
              excluded.expires_at,
            verified_at =
              NULL,
            updated_at =
              CURRENT_TIMESTAMP
        `,
      )
      .bind(
        account.id,
        email,
        tokenHash,
      )
      .run();

    const verifyUrl =
      new URL(
        "/api/gyan-identity/email/verify",
        url.origin,
      );

    verifyUrl.searchParams.set(
      "token",
      token,
    );

    try {
      await sendGyanAccountVerificationEmail({
        env,
        email,
        displayName:
          account.display_name,
        verifyUrl:
          verifyUrl.toString(),
      });
    } catch (error) {
      console.error(
        "Unable to send GYAN verification email:",
        error,
      );

      /*
       * Keep the saved pending email even if delivery fails.
       */
      return identityJson(
        {
          saved:
            true,
          verificationSent:
            false,
          emailStatus:
            "pending",
          maskedEmail:
            `${email.slice(0, 1)}••••@${email.split("@")[1] ?? ""}`,
          error:
            error instanceof Error
              ? error.message
              : "Verification email could not be sent.",
        },
        502,
      );
    }

    return identityJson({
      saved:
        true,
      verificationSent:
        true,
      emailStatus:
        "pending",
      maskedEmail:
        `${email.slice(0, 1)}••••@${email.split("@")[1] ?? ""}`,
    });
  }


  if (
    url.pathname ===
      "/api/gyan-identity/email/verify" &&
    request.method ===
      "GET"
  ) {
    const token =
      String(
        url.searchParams.get(
          "token",
        ) ?? "",
      ).trim();

    if (!token) {
      return Response.redirect(
        new URL(
          "/?email=invalid",
          url.origin,
        ).toString(),
        302,
      );
    }

    const tokenHash =
      await identitySha256(
        token,
      );

    const pending =
      await env.gyan_registry
        .prepare(
          `
            SELECT
              account_id,
              email
            FROM gyan_account_email_verifications
            WHERE
              token_hash = ?
              AND verified_at IS NULL
              AND expires_at >
                CURRENT_TIMESTAMP
            LIMIT 1
          `,
        )
        .bind(
          tokenHash,
        )
        .first<{
          account_id: number;
          email: string;
        }>();

    if (!pending) {
      return Response.redirect(
        new URL(
          "/?email=invalid",
          url.origin,
        ).toString(),
        302,
      );
    }

    await env.gyan_registry.batch([
      env.gyan_registry
        .prepare(
          `
            UPDATE gyan_accounts
            SET
              email = ?,
              registered = 1,
              updated_at =
                CURRENT_TIMESTAMP
            WHERE id = ?
          `,
        )
        .bind(
          pending.email,
          pending.account_id,
        ),

      env.gyan_registry
        .prepare(
          `
            UPDATE gyan_account_email_verifications
            SET
              verified_at =
                CURRENT_TIMESTAMP,
              updated_at =
                CURRENT_TIMESTAMP
            WHERE
              account_id = ?
              AND token_hash = ?
          `,
        )
        .bind(
          pending.account_id,
          tokenHash,
        ),
    ]);

    return Response.redirect(
      new URL(
        "/?email=verified",
        url.origin,
      ).toString(),
      302,
    );
  }


  if (
    url.pathname ===
      "/api/gyan-identity/email-card" &&
    request.method ===
      "POST"
  ) {
    if (!env.RESEND_API_KEY) {
      return identityJson(
        {
          error:
            "Email delivery is not configured.",
        },
        503,
      );
    }

    const existingSecret =
      identityCookie(
        request,
        "gyan_anon",
      );

    if (!existingSecret) {
      return identityJson(
        {
          error:
            "GYAN ownership could not be verified.",
        },
        401,
      );
    }

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
        .bind(
          secretHash,
        )
        .first<{
          account_id: number;
        }>();

    if (!session) {
      return identityJson(
        {
          error:
            "GYAN ownership could not be verified.",
        },
        401,
      );
    }

    const account =
      await loadGyanAccount(
        env.gyan_registry,
        session.account_id,
      );

    if (!account) {
      return identityJson(
        {
          error:
            "GYAN Card not found.",
        },
        404,
      );
    }

    const body =
      await request.json<{
        email?: unknown;
      }>();

    const email =
      typeof body.email ===
        "string"
        ? body.email
            .trim()
            .toLowerCase()
        : "";

    if (
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
        email,
      )
    ) {
      return identityJson(
        {
          error:
            "Enter a valid email address.",
        },
        400,
      );
    }

    const identity =
      await publicGyanIdentity(
        env,
        account,
        url.origin,
      );

    const goodieLines =
      identity.goodies
        .map(
          (
            goodie,
          ) =>
            `${goodie.type}: ${goodie.publicUrl}`,
        )
        .join(
          "\n",
        );

    const text =
      [
        `Your GYAN Card: ${identity.displayName} [${identity.code}]`,
        "",
        identity.publicUrl,
        "",
        `Welcome Gems: ${identity.welcomeGems}`,
        "",
        "Your GYAN QR goodies:",
        goodieLines,
        "",
        "Keep this email somewhere safe so you can find your GYAN Card again.",
      ].join(
        "\n",
      );

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
                "GYAN <admin@gyan.cc>",

              to: [
                email,
              ],

              subject:
                `Your GYAN Card · ${identity.displayName} [${identity.code}]`,

              text,
            }),
        },
      );

    if (!response.ok) {
      return identityJson(
        {
          error:
            "Unable to send the GYAN Card email.",
        },
        502,
      );
    }

    return identityJson({
      sent:
        true,
    });
  }


  /*
   * GET /api/gyan-identity/service-request?number=...
   *
   * Owner-only, read-only request details.
   * Ownership is verified through the current browser GYAN account,
   * its calendar bridge email, and the request customer email.
   */
  if (
    url.pathname ===
      "/api/gyan-identity/service-request" &&
    request.method ===
      "GET"
  ) {
    const requestNumber =
      (
        url.searchParams.get(
          "number",
        ) ??
        ""
      )
        .trim()
        .toUpperCase();

    if (!requestNumber) {
      return identityJson(
        {
          error:
            "Request number is required.",
        },
        400,
      );
    }

    const existingSecret =
      identityCookie(
        request,
        "gyan_anon",
      );

    if (!existingSecret) {
      return identityJson(
        {
          error:
            "This device is not signed in to a GYAN identity.",
        },
        401,
      );
    }

    const secretHash =
      await identitySha256(
        existingSecret,
      );

    const owner =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            ga.id AS account_id,
            cac.email AS owner_email
          FROM gyan_browser_sessions gbs
          INNER JOIN gyan_accounts ga
            ON ga.id =
               gbs.account_id
          LEFT JOIN gyan_account_calendar_links gacl
            ON gacl.gyan_account_id =
               ga.id
          LEFT JOIN calendar_access_codes cac
            ON cac.id =
               gacl.calendar_access_id
          WHERE gbs.secret_hash = ?
          LIMIT 1
          `,
        )
        .bind(
          secretHash,
        )
        .first<{
          account_id:
            number;

          owner_email:
            string | null;
        }>();

    if (!owner) {
      return identityJson(
        {
          error:
            "This device does not own a GYAN identity.",
        },
        403,
      );
    }

    /*
     * The Activity card is already scoped to the current GYAN
     * browser identity. Request details therefore must not depend
     * on whether the request happened to include an email address.
     *
     * A valid HttpOnly gyan_anon ownership session is still required
     * before this exact request-number lookup is allowed.
     *
     * Longer term, request ownership can be persisted explicitly
     * against gyan_account_id so the detail route does not need to
     * rely on the Activity-card request number as the capability.
     */
    const row =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            sr.id,
            sr.request_number,
            sr.status,
            sr.created_at,
            sr.updated_at,
            sr.customer_name,
            sr.phone_number,
            sr.email_address,
            sr.whatsapp_number,
            sr.details_json,
            sr.estimated_amount_paise,
            sr.shop_code,
            s.name AS service_name,
            sh.name AS shop_name

          FROM service_requests sr

          INNER JOIN services s
            ON s.id =
               sr.service_id

          INNER JOIN shops sh
            ON sh.code =
               sr.shop_code

          WHERE
            sr.request_number = ?

          LIMIT 1
          `,
        )
        .bind(
          requestNumber,
        )
        .first<{
          id:
            number;

          request_number:
            string;

          status:
            string;

          created_at:
            string;

          updated_at:
            string;

          customer_name:
            string | null;

          phone_number:
            string | null;

          email_address:
            string | null;

          whatsapp_number:
            string | null;

          details_json:
            string | null;

          estimated_amount_paise:
            number | null;

          shop_code:
            string;

          service_name:
            string;

          shop_name:
            string;
        }>();

    if (!row) {
      return identityJson(
        {
          error:
            "Service request not found for this GYAN account.",
        },
        404,
      );
    }

    let answers:
      Record<
        string,
        unknown
      > = {};

    if (
      row.details_json
    ) {
      try {
        const parsed =
          JSON.parse(
            row.details_json,
          );

        if (
          typeof parsed ===
            "object" &&
          parsed !==
            null &&
          !Array.isArray(
            parsed,
          )
        ) {
          answers =
            parsed as Record<
              string,
              unknown
            >;
        }
      } catch {
        answers = {};
      }
    }

    const files =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            id,
            original_file_name,
            file_size,
            content_type
          FROM service_request_files
          WHERE service_request_id = ?
          ORDER BY id ASC
          `,
        )
        .bind(
          row.id,
        )
        .all<{
          id:
            number;

          original_file_name:
            string;

          file_size:
            number;

          content_type:
            string | null;
        }>();

    return identityJson({
      request: {
        requestNumber:
          row.request_number,

        status:
          row.status,

        createdAt:
          row.created_at,

        updatedAt:
          row.updated_at,

        serviceName:
          row.service_name,

        shopName:
          row.shop_name,

        shopCode:
          row.shop_code,

        customerName:
          row.customer_name,

        phoneNumber:
          row.phone_number,

        emailAddress:
          row.email_address,

        whatsAppNumber:
          row.whatsapp_number,

        estimatedAmountPaise:
          row.estimated_amount_paise,

        answers,

        files:
          files.results.map(
            (
              file,
            ) => ({
              id:
                file.id,

              name:
                file.original_file_name,

              size:
                file.file_size,

              contentType:
                file.content_type,
            }),
          ),
      },
    });
  }


  /*
   * GET /api/gyan-identity/gems
   *
   * Owner-only Gem balance and recent transaction history.
   */
  if (
    url.pathname ===
      "/api/gyan-identity/gems" &&
    request.method ===
      "GET"
  ) {
    const existingSecret =
      identityCookie(
        request,
        "gyan_anon",
      );

    if (!existingSecret) {
      return identityJson({
        total: 0,
        transactions: [],
      });
    }

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
        .bind(
          secretHash,
        )
        .first<{
          account_id:
            number;
        }>();

    if (!session) {
      return identityJson({
        total: 0,
        transactions: [],
      });
    }

    const link =
      await env.gyan_registry
        .prepare(
          `
          SELECT calendar_access_id
          FROM gyan_account_calendar_links
          WHERE gyan_account_id = ?
          LIMIT 1
          `,
        )
        .bind(
          session.account_id,
        )
        .first<{
          calendar_access_id:
            number;
        }>();

    if (!link) {
      return identityJson({
        total: 0,
        transactions: [],
      });
    }

    const rows =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            id,
            amount,
            reason,
            created_at,
            SUM(amount) OVER () AS total
          FROM gem_transactions
          WHERE calendar_access_id = ?
          ORDER BY created_at DESC, id DESC
          LIMIT 100
          `,
        )
        .bind(
          link.calendar_access_id,
        )
        .all<{
          id: number;
          amount: number;
          reason: string;
          created_at: string;
          total: number;
        }>();

    const total =
      rows.results.length
        ? Number(
            rows.results[0]
              ?.total ??
            0,
          )
        : 0;

    return identityJson({
      total,

      transactions:
        rows.results.map(
          (
            row,
          ) => ({
            id:
              row.id,

            amount:
              row.amount,

            reason:
              row.reason,

            createdAt:
              row.created_at,
          }),
        ),
    });
  }


  /*
   * GET /api/gyan-identity/friends
   *
   * Return the current browser owner's one-way friend list.
   * Read-only and indexed by owner_account_id.
   */
  if (
    url.pathname ===
      "/api/gyan-identity/friends" &&
    request.method ===
      "GET"
  ) {
    const existingSecret =
      identityCookie(
        request,
        "gyan_anon",
      );

    if (!existingSecret) {
      return identityJson({
        friends: [],
      });
    }

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
        .bind(
          secretHash,
        )
        .first<{
          account_id: number;
        }>();

    if (!session) {
      return identityJson({
        friends: [],
      });
    }

    const rows =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            ga.code,
            ga.display_name,
            gf.created_at

          FROM gyan_friends gf

          INNER JOIN gyan_accounts ga
            ON ga.id =
               gf.friend_account_id

          WHERE
            gf.owner_account_id = ?

          ORDER BY
            gf.created_at DESC,
            gf.id DESC
          `,
        )
        .bind(
          session.account_id,
        )
        .all<{
          code: string;
          display_name: string;
          created_at: string;
        }>();

    return identityJson({
      friends:
        rows.results.map(
          (
            row,
          ) => ({
            code:
              row.code,

            displayName:
              row.display_name,

            addedAt:
              row.created_at,
          }),
        ),
    });
  }


  /*
   * POST /api/gyan-identity/friends
   *
   * Add another GYAN account to the current browser owner's
   * friend list. Friendship is intentionally one-way.
   */
  if (
    url.pathname ===
      "/api/gyan-identity/friends" &&
    request.method ===
      "POST"
  ) {
    const existingSecret =
      identityCookie(
        request,
        "gyan_anon",
      );

    if (!existingSecret) {
      return identityJson(
        {
          error:
            "This device needs its own GYAN identity before adding a friend.",
        },
        401,
      );
    }

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
        .bind(
          secretHash,
        )
        .first<{
          account_id: number;
        }>();

    if (!session) {
      return identityJson(
        {
          error:
            "GYAN ownership could not be verified.",
        },
        401,
      );
    }

    // eslint-disable-next-line no-useless-assignment
    let body:
      {
        friendCode?:
          unknown;
      } = {};

    try {
      body =
        await request.json<{
          friendCode?:
            unknown;
        }>();
    } catch {
      return identityJson(
        {
          error:
            "Invalid request.",
        },
        400,
      );
    }

    const friendCode =
      typeof body.friendCode ===
        "string"
        ? body.friendCode
            .trim()
            .toUpperCase()
        : "";

    if (
      !/^[A-Z0-9]{4,5}$/.test(
        friendCode,
      )
    ) {
      return identityJson(
        {
          error:
            "Enter a valid GYAN friend code.",
        },
        400,
      );
    }

    const owner =
      await loadGyanAccount(
        env.gyan_registry,
        session.account_id,
      );

    if (!owner) {
      return identityJson(
        {
          error:
            "Your GYAN identity could not be loaded.",
        },
        404,
      );
    }

    const friend =
      await loadPublicGyanAccountByCode(
        env.gyan_registry,
        friendCode,
      );

    if (!friend) {
      return identityJson(
        {
          error:
            `GYAN ${friendCode} was not found.`,
        },
        404,
      );
    }

    if (
      owner.id ===
      friend.id
    ) {
      return identityJson(
        {
          error:
            "You cannot add your own GYAN as a friend.",
        },
        400,
      );
    }

    const existingFriend =
      await env.gyan_registry
        .prepare(
          `
          SELECT id
          FROM gyan_friends
          WHERE
            owner_account_id = ?
            AND friend_account_id = ?
          LIMIT 1
          `,
        )
        .bind(
          owner.id,
          friend.id,
        )
        .first<{
          id: number;
        }>();

    if (!existingFriend) {
      await env.gyan_registry
        .prepare(
          `
          INSERT INTO gyan_friends (
            owner_account_id,
            friend_account_id
          )
          VALUES (?, ?)
          `,
        )
        .bind(
          owner.id,
          friend.id,
        )
        .run();
    }

    return identityJson({
      added:
        true,

      alreadyFriend:
        Boolean(
          existingFriend,
        ),

      friend: {
        code:
          friend.code,

        displayName:
          friend.display_name,
      },
    });
  }


  const publicCodeMatch =
    url.pathname.match(
      /^\/api\/gyan-identity\/([A-Za-z0-9]{4,5})$/,
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

    let isFriend =
      false;

    const viewerSecret =
      identityCookie(
        request,
        "gyan_anon",
      );

    if (viewerSecret) {
      const viewerSecretHash =
        await identitySha256(
          viewerSecret,
        );

      const viewerSession =
        await env.gyan_registry
          .prepare(
            `
            SELECT account_id
            FROM gyan_browser_sessions
            WHERE secret_hash = ?
            LIMIT 1
            `,
          )
          .bind(
            viewerSecretHash,
          )
          .first<{
            account_id: number;
          }>();

      if (
        viewerSession &&
        viewerSession.account_id !==
          account.id
      ) {
        const friendRow =
          await env.gyan_registry
            .prepare(
              `
              SELECT 1 AS found
              FROM gyan_friends
              WHERE
                owner_account_id = ?
                AND friend_account_id = ?
              LIMIT 1
              `,
            )
            .bind(
              viewerSession.account_id,
              account.id,
            )
            .first<{
              found: number;
            }>();

        isFriend =
          Boolean(
            friendRow,
          );
      }
    }

    return identityJson({
      account: {
        id:
          account.id,

        code:
          account.code,

        displayName:
          account.display_name,

        registered:
          Boolean(
            account.registered,
          ),

        createdAt:
          account.created_at,

        isFriend,
      },
    });
  }

  if (
    url.pathname !==
      "/api/gyan-identity"
  ) {
    return null;
  }

  /*
   * GET is read-only.
   *
   * It may return the GYAN already owned by this browser, but it
   * must NEVER allocate a new account. This keeps ordinary page
   * navigation (including Home after opening /ABCD) free of account
   * creation side effects.
   */
  if (
    request.method ===
      "GET"
  ) {
    const existingSecret =
      identityCookie(
        request,
        "gyan_anon",
      );

    if (!existingSecret) {
      return identityJson({
        identity:
          null,
      });
    }

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

    if (!session) {
      return identityJson({
        identity:
          null,
      });
    }

    const account =
      await loadGyanAccount(
        env.gyan_registry,
        session.account_id,
      );

    if (!account) {
      return identityJson({
        identity:
          null,
      });
    }

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
        await publicGyanIdentity(
              env,
              account,
              url.origin,
            ),
    });
  }

  /*
   * POST is the explicit create/get-or-create operation.
   * Existing owners receive their current account; browsers with
   * no valid ownership cookie get a newly allocated GYAN.
   */
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
    /*
     * Keep the default empty body when JSON is absent
     * or malformed.
     */
  }

  /*
   * Safety guard:
   *
   * A brand-new browser identity must be created only by the real
   * browser/client flow. We observed a second anonymous POST arriving
   * without client information and racing the normal browser POST,
   * which could create two GYAN accounts on one fresh device.
   *
   * Existing-cookie handling remains below this guard for normal
   * browser requests; anonymous no-client creation is rejected.
   */
  if (
    !requestBody.client
  ) {
    console.warn(
      "Rejected GYAN identity creation without client payload.",
    );

    return identityJson(
      {
        error:
          "GYAN identity creation requires browser client information.",
      },
      400,
    );
  }

  const creationClient =
    getGyanCreationClient(
      requestBody.client,
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
            await publicGyanIdentity(
              env,
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
    randomGyanDisplayName();

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
          ? await publicGyanIdentity(
              env,
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