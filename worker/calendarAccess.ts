import {
  currentUser,
} from "./auth";


export interface CalendarAccessEnv {
  gyan_registry:
    D1Database;
}


type DurationMonths =
  1 | 3 | 6 | 12;

type ArtworkKey =
  | "GODDESS"
  | "EDUCATION"
  | "SCENIC";


type SafetyResourceType =
  | "CERTIFICATE"
  | "LOST_FOUND"
  | "EMERGENCY"
  | "HELP";


export type SafetyResourceRecord = {
  type: SafetyResourceType;
  token: string;
  publicUrl: string;
};


const ALPHABET =
  "23456789ABCDEFGHJKLMNPQRSTUVWXYZ";

const FIRST_WORDS = [
  "Mango",
  "Lotus",
  "Sunny",
  "Blue",
  "Golden",
  "River",
  "Bright",
  "Happy",
  "Maple",
  "Silver",
] as const;

const SECOND_WORDS = [
  "Swan",
  "Tiger",
  "Panda",
  "Falcon",
  "Dolphin",
  "Peacock",
  "Parrot",
  "Star",
  "River",
  "Lotus",
] as const;


function randomText(
  length:
    number,
):
  string {
  const bytes =
    new Uint8Array(
      length,
    );

  crypto.getRandomValues(
    bytes,
  );

  let value =
    "";

  for (
    const byte of bytes
  ) {
    value +=
      ALPHABET[
        byte %
        ALPHABET.length
      ];
  }

  return value;
}


function createSlug():
  string {
  /*
   * New calendar URLs use four characters for easier typing/memory.
   * Existing five-character URLs remain supported by lookup routes.
   */
  return randomText(
    4,
  );
}


function createAccessCode():
  string {
  const raw =
    randomText(
      10,
    );

  return `${raw.slice(
    0,
    5,
  )}-${raw.slice(
    5,
  )}`;
}


function createQrToken():
  string {
  /*
   * 16 symbols from the human-safe alphabet gives a compact
   * high-entropy QR credential. Only its SHA-256 hash is stored.
   */
  return randomText(
    16,
  );
}


function createSafetyPublicToken():
  string {
  /*
   * 10 symbols from a 32-character human-safe alphabet gives
   * ~50 bits of namespace. The token is public/opaque, not a
   * cryptographic public key and not the parent GYAN slug.
   */
  return randomText(
    10,
  ).toLowerCase();
}


const SAFETY_RESOURCE_TYPES:
  SafetyResourceType[] = [
    "CERTIFICATE",
    "LOST_FOUND",
    "EMERGENCY",
    "HELP",
  ];


async function createSafetyResources(
  env: CalendarAccessEnv,
  calendarAccessId: number,
): Promise<SafetyResourceRecord[]> {
  const resources:
    SafetyResourceRecord[] = [];

  for (
    const resourceType
    of SAFETY_RESOURCE_TYPES
  ) {
    let created =
      false;

    for (
      let attempt = 0;
      attempt < 30;
      attempt += 1
    ) {
      const token =
        createSafetyPublicToken();

      try {
        await env.gyan_registry
          .prepare(
            `
              INSERT INTO gyan_safety_resources (
                calendar_access_id,
                resource_type,
                public_token,
                status
              )
              VALUES (?, ?, ?, 'ACTIVE')
            `,
          )
          .bind(
            calendarAccessId,
            resourceType,
            token,
          )
          .run();

        resources.push({
          type:
            resourceType,

          token,

          publicUrl:
            `https://gyan.cc/${token}`,
        });

        created =
          true;

        break;
      } catch (
        error
      ) {
        const message =
          error instanceof Error
            ? error.message
            : String(error);

        if (
          message.includes(
            "UNIQUE",
          )
        ) {
          continue;
        }

        throw error;
      }
    }

    if (
      !created
    ) {
      throw new Error(
        `Unable to allocate ${resourceType} public token.`,
      );
    }
  }

  return resources;
}


async function loadSafetyResources(
  env: CalendarAccessEnv,
  calendarAccessId: number,
): Promise<SafetyResourceRecord[]> {
  const rows =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            resource_type,
            public_token
          FROM gyan_safety_resources
          WHERE
            calendar_access_id = ?
            AND status = 'ACTIVE'
          ORDER BY
            CASE resource_type
              WHEN 'CERTIFICATE' THEN 1
              WHEN 'LOST_FOUND' THEN 2
              WHEN 'EMERGENCY' THEN 3
              WHEN 'HELP' THEN 4
              ELSE 99
            END
        `,
      )
      .bind(
        calendarAccessId,
      )
      .all<{
        resource_type:
          SafetyResourceType;
        public_token:
          string;
      }>();

  return rows.results.map(
    (row) => ({
      type:
        row.resource_type,

      token:
        row.public_token,

      publicUrl:
        `https://gyan.cc/${row.public_token}`,
    }),
  );
}


function welcomeGemsForDuration(
  durationMonths:
    DurationMonths,
):
  number {
  if (
    durationMonths ===
      12
  ) {
    return 12;
  }

  if (
    durationMonths ===
      6
  ) {
    return 6;
  }

  return 3;
}


function normalizeArtworkKey(
  value:
    unknown,
):
  ArtworkKey {
  return (
    value ===
      "EDUCATION" ||
    value ===
      "SCENIC" ||
    value ===
      "GODDESS"
  )
    ? value
    : "GODDESS";
}


function createGyanName():
  string {
  const bytes =
    new Uint8Array(
      3,
    );

  crypto.getRandomValues(
    bytes,
  );

  const first =
    FIRST_WORDS[
      bytes[0] %
      FIRST_WORDS.length
    ];

  const second =
    SECOND_WORDS[
      bytes[1] %
      SECOND_WORDS.length
    ];

  const number =
    10 +
    (
      (
        bytes[2] *
        4
      ) %
      990
    );

  return `${first}${second}${number}`;
}


const GUEST_COOKIE =
  "gyan_guest";

const GUEST_DAYS =
  30;


function bytesToHex(
  bytes:
    Uint8Array,
):
  string {
  return Array.from(
    bytes,
  )
    .map(
      (
        value,
      ) =>
        value
          .toString(
            16,
          )
          .padStart(
            2,
            "0",
          ),
    )
    .join(
      "",
    );
}


function createGuestToken():
  string {
  const bytes =
    new Uint8Array(
      32,
    );

  crypto.getRandomValues(
    bytes,
  );

  return bytesToHex(
    bytes,
  );
}


async function sha256(
  value:
    string,
):
  Promise<string> {
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


function cookieValue(
  request:
    Request,
  name:
    string,
):
  string | null {
  const cookie =
    request.headers.get(
      "cookie",
    );

  if (
    !cookie
  ) {
    return null;
  }

  for (
    const item of cookie.split(
      ";",
    )
  ) {
    const [
      key,
      ...rest
    ] =
      item
        .trim()
        .split(
          "=",
        );

    if (
      key ===
        name
    ) {
      return decodeURIComponent(
        rest.join(
          "=",
        ),
      );
    }
  }

  return null;
}


function guestCookie(
  token:
    string,
):
  string {
  return [
    `${GUEST_COOKIE}=${encodeURIComponent(
      token,
    )}`,
    "Path=/",
    `Max-Age=${
      GUEST_DAYS *
      24 *
      60 *
      60
    }`,
    "HttpOnly",
    "Secure",
    "SameSite=Lax",
  ].join(
    "; ",
  );
}


async function currentGuestAccess(
  request:
    Request,
  env:
    CalendarAccessEnv,
) {
  const token =
    cookieValue(
      request,
      GUEST_COOKIE,
    );

  if (
    !token
  ) {
    return null;
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
            calendar_access_codes.id,
            calendar_access_codes.slug,
            calendar_access_codes.gyan_name,
            calendar_access_codes.duration_months,
            calendar_access_codes.status,
            calendar_access_codes.email,
            calendar_access_codes.guest_started_at,
            calendar_access_codes.guest_expires_at,
            calendar_access_codes.claimed_at,
            calendar_access_codes.expires_at
          FROM calendar_guest_sessions
          INNER JOIN calendar_access_codes
            ON calendar_access_codes.id =
               calendar_guest_sessions.calendar_access_id
          WHERE
            calendar_guest_sessions.token_hash = ?
            AND calendar_guest_sessions.expires_at >
                CURRENT_TIMESTAMP
          LIMIT 1
        `,
      )
      .bind(
        tokenHash,
      )
      .first();

  if (
    row
  ) {
    await env.gyan_registry
      .prepare(
        `
          UPDATE calendar_guest_sessions
          SET last_seen_at =
            CURRENT_TIMESTAMP
          WHERE token_hash = ?
        `,
      )
      .bind(
        tokenHash,
      )
      .run();
  }

  return row;
}


function json(
  body:
    unknown,
  status =
    200,
):
  Response {
  return new Response(
    JSON.stringify(
      body,
    ),
    {
      status,
      headers: {
        "Content-Type":
          "application/json; charset=utf-8",
      },
    },
  );
}


async function createOne(
  env:
    CalendarAccessEnv,
  durationMonths:
    DurationMonths,
  artworkKey:
    ArtworkKey,
) {
  for (
    let attempt = 0;
    attempt < 30;
    attempt += 1
  ) {
    const slug =
      createSlug();

    const gyanName =
      createGyanName();

    const accessCode =
      createAccessCode();

    const qrToken =
      createQrToken();

    const qrTokenHash =
      await sha256(
        qrToken,
      );

    const welcomeGems =
      welcomeGemsForDuration(
        durationMonths,
      );

    try {
      const row =
        await env.gyan_registry
          .prepare(
            `
              INSERT INTO calendar_access_codes (
                slug,
                gyan_name,
                access_code,
                qr_token_hash,
                duration_months,
                welcome_gems,
                artwork_key,
                status
              )
              VALUES (?, ?, ?, ?, ?, ?, ?, 'GENERATED')
              RETURNING
                id,
                slug,
                gyan_name,
                access_code,
                duration_months,
                welcome_gems,
                artwork_key,
                status,
                email
            `,
          )
          .bind(
            slug,
            gyanName,
            accessCode,
            qrTokenHash,
            durationMonths,
            welcomeGems,
            artworkKey,
          )
          .first<{
            id: number;
            slug: string;
            gyan_name: string;
            access_code: string;
            duration_months: DurationMonths;
            welcome_gems: number;
            artwork_key: ArtworkKey;
            status: "GENERATED";
            email: string | null;
          }>();

      if (
        row
      ) {
        const safetyCards =
          await createSafetyResources(
            env,
            row.id,
          );

        return {
          id:
            row.id,

          slug:
            row.slug,

          publicUrl:
            `https://gyan.cc/${row.slug.toLowerCase()}`,

          qrUrl:
            `https://gyan.cc/${row.slug.toLowerCase()}#${qrToken}`,

          gyanName:
            row.gyan_name,

          accessCode:
            row.access_code,

          durationMonths:
            row.duration_months,

          welcomeGems:
            row.welcome_gems,

          artworkKey:
            row.artwork_key,

          status:
            row.status,

          email:
            row.email,

          safetyCards,
        };
      }
    } catch (
      error
    ) {
      const message =
        error instanceof
          Error
          ? error.message
          : String(
              error,
            );

      if (
        message.includes(
          "UNIQUE",
        )
      ) {
        continue;
      }

      throw error;
    }
  }

  throw new Error(
    "Unable to allocate a unique calendar access record.",
  );
}


export async function handleCalendarAccessRoute({
  request,
  env,
  pathname,
}: {
  request:
    Request;

  env:
    CalendarAccessEnv;

  pathname:
    string;
}):
  Promise<Response | null> {
  if (
    pathname ===
      "/api/calendar-access" &&
    request.method ===
      "POST"
  ) {
    const body =
      await request.json() as {
        count?: number;
        durationMonths?: number;
        artworkKey?: unknown;
      };

    const count =
      Math.max(
        1,
        Math.min(
          8,
          Math.floor(
            body.count ??
            1,
          ),
        ),
      );

    const durationMonths =
      body.durationMonths;

    if (
      durationMonths !== 1 &&
      durationMonths !== 3 &&
      durationMonths !== 6 &&
      durationMonths !== 12
    ) {
      return json(
        {
          error:
            "durationMonths must be 1, 3, 6, or 12.",
        },
        400,
      );
    }

    const artworkKey =
      normalizeArtworkKey(
        body.artworkKey,
      );

    const records =
      [];

    for (
      let index = 0;
      index < count;
      index += 1
    ) {
      records.push(
        await createOne(
          env,
          durationMonths,
          artworkKey,
        ),
      );
    }

    return json({
      records,
    });
  }


  if (
    pathname ===
      "/api/calendar-access/printed" &&
    request.method ===
      "POST"
  ) {
    const body =
      await request.json() as {
        ids?: number[];
      };

    const ids =
      Array.isArray(
        body.ids,
      )
        ? body.ids
            .filter(
              (
                id,
              ) =>
                Number.isInteger(
                  id,
                ) &&
                id > 0,
            )
            .slice(
              0,
              8,
            )
        : [];

    if (
      ids.length ===
        0
    ) {
      return json(
        {
          error:
            "No valid ids.",
        },
        400,
      );
    }

    const placeholders =
      ids
        .map(
          () =>
            "?",
        )
        .join(
          ",",
        );

    await env.gyan_registry
      .prepare(
        `
          UPDATE calendar_access_codes
          SET
            status = CASE
              WHEN status = 'GENERATED' THEN 'PRINTED'
              ELSE status
            END,
            printed_at = COALESCE(
              printed_at,
              CURRENT_TIMESTAMP
            )
          WHERE id IN (${placeholders})
        `,
      )
      .bind(
        ...ids,
      )
      .run();

    return json({
      ok:
        true,
    });
  }


  if (
    pathname ===
      "/api/calendar-access" &&
    request.method ===
      "GET"
  ) {
    const rows =
      await env.gyan_registry
        .prepare(
          `
            SELECT
              id,
              slug,
              gyan_name,
              access_code,
              duration_months,
              status,
              generated_at,
              printed_at,
              claimed_at,
              expires_at
            FROM calendar_access_codes
            ORDER BY id DESC
            LIMIT 250
          `,
        )
        .all();

    return json({
      records:
        rows.results,
    });
  }



  if (
    pathname ===
      "/api/calendar-access/me" &&
    request.method ===
      "GET"
  ) {
    const guest =
      await currentGuestAccess(
        request,
        env,
      );

    const user =
      await currentUser(
        request,
        env,
      );

    return json({
      guest,
      authenticated:
        Boolean(
          user,
        ),
      user:
        user
          ? {
              id:
                user.id,
              email:
                user.email,
            }
          : null,
    });
  }


  const previewMatch =
    pathname.match(
      /^\/api\/calendar-access\/(\d+)\/preview$/,
    );

  if (
    previewMatch &&
    request.method ===
      "POST"
  ) {
    const id =
      Number(
        previewMatch[1],
      );

    const body =
      await request.json() as {
        durationMonths?:
          number;

        artworkKey?:
          unknown;
      };

    const durationMonths =
      body.durationMonths;

    if (
      durationMonths !== 1 &&
      durationMonths !== 3 &&
      durationMonths !== 6 &&
      durationMonths !== 12
    ) {
      return json(
        {
          error:
            "durationMonths must be 1, 3, 6, or 12.",
        },
        400,
      );
    }

    const artworkKey =
      normalizeArtworkKey(
        body.artworkKey,
      );

    const welcomeGems =
      welcomeGemsForDuration(
        durationMonths,
      );

    const existing =
      await env.gyan_registry
        .prepare(
          `
            SELECT
              id,
              slug,
              gyan_name,
              access_code,
              duration_months,
              welcome_gems,
              artwork_key,
              status,
              email
            FROM calendar_access_codes
            WHERE id = ?
            LIMIT 1
          `,
        )
        .bind(
          id,
        )
        .first<{
          id: number;
          slug: string;
          gyan_name: string;
          access_code: string;
          duration_months: DurationMonths;
          welcome_gems: number;
          artwork_key: ArtworkKey;
          status: string;
          email: string | null;
        }>();

    if (
      !existing
    ) {
      return json(
        {
          error:
            "GYAN preview not found.",
        },
        404,
      );
    }

    if (
      existing.status !==
        "GENERATED"
    ) {
      return json(
        {
          error:
            "Only an unprinted GYAN preview can change size or artwork.",
        },
        409,
      );
    }

    await env.gyan_registry
      .prepare(
        `
          UPDATE calendar_access_codes
          SET
            duration_months = ?,
            welcome_gems = ?,
            artwork_key = ?
          WHERE id = ?
        `,
      )
      .bind(
        durationMonths,
        welcomeGems,
        artworkKey,
        id,
      )
      .run();

    const safetyCards =
      await loadSafetyResources(
        env,
        existing.id,
      );

    /*
     * The QR token itself is intentionally unchanged when a user
     * changes A5/A6/A7 size in preview.
     */
    return json({
      record: {
        id:
          existing.id,

        slug:
          existing.slug,

        publicUrl:
          `https://gyan.cc/${existing.slug.toLowerCase()}`,

        /*
         * qrUrl is not recoverable from its stored hash.
         * The browser already has the original qrUrl; frontend keeps it.
         * null tells the frontend to preserve the existing QR payload.
         */
        qrUrl:
          null,

        gyanName:
          existing.gyan_name,

        accessCode:
          existing.access_code,

        durationMonths,

        welcomeGems,

        artworkKey,

        status:
          existing.status,

        email:
          existing.email,

        safetyCards,
      },
    });
  }


  const qrGuestMatch =
    pathname.match(
      /^\/api\/calendar-access\/([A-Za-z0-9]{4,5})\/guest-token$/,
    );

  if (
    qrGuestMatch &&
    request.method ===
      "POST"
  ) {
    const body =
      await request.json() as {
        token?:
          unknown;
      };

    const token =
      String(
        body.token ??
        "",
      )
        .trim()
        .toUpperCase();

    if (
      !token
    ) {
      return json(
        {
          error:
            "QR token is missing.",
        },
        400,
      );
    }

    const tokenHash =
      await sha256(
        token,
      );

    const slug =
      qrGuestMatch[1]
        .toUpperCase();

    const row =
      await env.gyan_registry
        .prepare(
          `
            SELECT
              id,
              slug,
              gyan_name,
              duration_months,
              welcome_gems,
              status,
              guest_started_at,
              guest_expires_at
            FROM calendar_access_codes
            WHERE
              slug = ?
              AND qr_token_hash = ?
            LIMIT 1
          `,
        )
        .bind(
          slug,
          tokenHash,
        )
        .first<{
          id: number;
          slug: string;
          gyan_name: string;
          duration_months: DurationMonths;
          welcome_gems: number;
          status: string;
          guest_started_at: string | null;
          guest_expires_at: string | null;
        }>();

    if (
      !row
    ) {
      return json(
        {
          error:
            "This QR is not valid for the GYAN shown.",
        },
        404,
      );
    }

    if (
      row.status ===
        "CLAIMED"
    ) {
      return json(
        {
          error:
            "This GYAN is already protected with an email.",
        },
        409,
      );
    }

    if (
      row.status ===
        "EXPIRED"
    ) {
      return json(
        {
          error:
            "This GYAN access has expired.",
        },
        410,
      );
    }

    if (
      row.status ===
        "GENERATED" ||
      row.status ===
        "PRINTED"
    ) {
      await env.gyan_registry
        .prepare(
          `
            UPDATE calendar_access_codes
            SET
              status = 'GUEST_ACTIVE',
              guest_started_at =
                COALESCE(
                  guest_started_at,
                  CURRENT_TIMESTAMP
                ),
              guest_expires_at =
                COALESCE(
                  guest_expires_at,
                  datetime(
                    'now',
                    '+30 days'
                  )
                )
            WHERE id = ?
          `,
        )
        .bind(
          row.id,
        )
        .run();

      await env.gyan_registry
        .prepare(
          `
            INSERT OR IGNORE INTO gem_transactions (
              calendar_access_id,
              amount,
              reason
            )
            VALUES (?, ?, 'WELCOME_PRINT')
          `,
        )
        .bind(
          row.id,
          row.welcome_gems,
        )
        .run();
    }

    const sessionToken =
      createGuestToken();

    const sessionHash =
      await sha256(
        sessionToken,
      );

    await env.gyan_registry
      .prepare(
        `
          INSERT INTO calendar_guest_sessions (
            calendar_access_id,
            token_hash,
            expires_at
          )
          VALUES (
            ?,
            ?,
            datetime(
              'now',
              '+30 days'
            )
          )
        `,
      )
      .bind(
        row.id,
        sessionHash,
      )
      .run();

    const response =
      json({
        guest:
          true,

        record: {
          id:
            row.id,

          slug:
            row.slug,

          gyanName:
            row.gyan_name,

          durationMonths:
            row.duration_months,

          welcomeGems:
            row.welcome_gems,

          status:
            "GUEST_ACTIVE",
        },
      });

    response.headers.append(
      "set-cookie",
      guestCookie(
        sessionToken,
      ),
    );

    return response;
  }


  const guestMatch =
    pathname.match(
      /^\/api\/calendar-access\/([A-Za-z0-9]{4,5})\/guest$/,
    );

  if (
    guestMatch &&
    request.method ===
      "POST"
  ) {
    let body:
      {
        accessCode?:
          unknown;
      };

    try {
      body =
        await request.json() as {
          accessCode?:
            unknown;
        };
    } catch {
      return json(
        {
          error:
            "Invalid request.",
        },
        400,
      );
    }

    const accessCode =
      String(
        body.accessCode ??
        "",
      )
        .trim()
        .toUpperCase();

    if (
      !accessCode
    ) {
      return json(
        {
          error:
            "Enter the access code printed on your GYAN calendar.",
        },
        400,
      );
    }

    const slug =
      guestMatch[1]
        .toUpperCase();

    const row =
      await env.gyan_registry
        .prepare(
          `
            SELECT
              id,
              slug,
              gyan_name,
              access_code,
              duration_months,
              status,
              email,
              guest_started_at,
              guest_expires_at,
              claimed_at,
              expires_at
            FROM calendar_access_codes
            WHERE slug = ?
            LIMIT 1
          `,
        )
        .bind(
          slug,
        )
        .first<{
          id:
            number;

          slug:
            string;

          gyan_name:
            string;

          access_code:
            string;

          duration_months:
            1 | 3 | 6 | 12;

          status:
            string;

          email:
            string | null;

          guest_started_at:
            string | null;

          guest_expires_at:
            string | null;

          claimed_at:
            string | null;

          expires_at:
            string | null;
        }>();

    if (
      !row
    ) {
      return json(
        {
          error:
            "GYAN code not found.",
        },
        404,
      );
    }

    if (
      row.access_code !==
        accessCode
    ) {
      return json(
        {
          error:
            "The access code does not match this GYAN calendar.",
        },
        400,
      );
    }

    if (
      row.status ===
        "CLAIMED"
    ) {
      return json(
        {
          error:
            "This GYAN is already protected with an email.",
        },
        409,
      );
    }

    if (
      row.status ===
        "EXPIRED"
    ) {
      return json(
        {
          error:
            "This GYAN access has expired.",
        },
        410,
      );
    }

    /*
     * First guest activation starts a 30-day guest window.
     * Re-entering the same code does not restart the clock.
     */
    if (
      row.status ===
        "GENERATED" ||
      row.status ===
        "PRINTED"
    ) {
      await env.gyan_registry
        .prepare(
          `
            UPDATE calendar_access_codes
            SET
              status =
                'GUEST_ACTIVE',
              guest_started_at =
                COALESCE(
                  guest_started_at,
                  CURRENT_TIMESTAMP
                ),
              guest_expires_at =
                COALESCE(
                  guest_expires_at,
                  datetime(
                    'now',
                    '+30 days'
                  )
                )
            WHERE id = ?
          `,
        )
        .bind(
          row.id,
        )
        .run();

      await env.gyan_registry
        .prepare(
          `
            INSERT OR IGNORE INTO gem_transactions (
              calendar_access_id,
              amount,
              reason
            )
            VALUES (?, ?, 'WELCOME_PRINT')
          `,
        )
        .bind(
          row.id,
          row.duration_months === 12
            ? 12
            : row.duration_months === 6
              ? 6
              : 3
        )
        .run();
    }

    const current =
      await env.gyan_registry
        .prepare(
          `
            SELECT
              id,
              slug,
              gyan_name,
              duration_months,
              status,
              guest_started_at,
              guest_expires_at
            FROM calendar_access_codes
            WHERE id = ?
            LIMIT 1
          `,
        )
        .bind(
          row.id,
        )
        .first<{
          id:
            number;

          slug:
            string;

          gyan_name:
            string;

          duration_months:
            1 | 3 | 6 | 12;

          status:
            string;

          guest_started_at:
            string | null;

          guest_expires_at:
            string | null;
        }>();

    if (
      !current
    ) {
      return json(
        {
          error:
            "Unable to activate this GYAN.",
        },
        500,
      );
    }

    if (
      current.guest_expires_at &&
      new Date(
        current.guest_expires_at,
      ).getTime() <=
        Date.now()
    ) {
      await env.gyan_registry
        .prepare(
          `
            UPDATE calendar_access_codes
            SET status =
              'EXPIRED'
            WHERE id = ?
          `,
        )
        .bind(
          row.id,
        )
        .run();

      return json(
        {
          error:
            "The 30-day guest period has expired. Protect this GYAN with email to continue if eligible.",
        },
        410,
      );
    }

    const token =
      createGuestToken();

    const tokenHash =
      await sha256(
        token,
      );

    await env.gyan_registry
      .prepare(
        `
          INSERT INTO calendar_guest_sessions (
            calendar_access_id,
            token_hash,
            expires_at
          )
          VALUES (
            ?,
            ?,
            datetime(
              'now',
              '+30 days'
            )
          )
        `,
      )
      .bind(
        row.id,
        tokenHash,
      )
      .run();

    const response =
      json({
        guest:
          true,

        record: {
          id:
            current.id,

          slug:
            current.slug,

          gyanName:
            current.gyan_name,

          durationMonths:
            current.duration_months,

          status:
            current.status,

          guestStartedAt:
            current.guest_started_at,

          guestExpiresAt:
            current.guest_expires_at,
        },
      });

    response.headers.append(
      "set-cookie",
      guestCookie(
        token,
      ),
    );

    return response;
  }


  const claimMatch =
    pathname.match(
      /^\/api\/calendar-access\/([A-Za-z0-9]{4,5})\/claim$/,
    );

  if (
    claimMatch &&
    request.method ===
      "POST"
  ) {
    const user =
      await currentUser(
        request,
        env,
      );

    if (
      !user
    ) {
      return json(
        {
          error:
            "EMAIL_VERIFICATION_REQUIRED",
        },
        401,
      );
    }

    let body:
      {
        accessCode?:
          unknown;
      };

    try {
      body =
        await request.json() as {
          accessCode?:
            unknown;
        };
    } catch {
      return json(
        {
          error:
            "Invalid request.",
        },
        400,
      );
    }

    const accessCode =
      String(
        body.accessCode ??
        "",
      )
        .trim()
        .toUpperCase();

    const slug =
      claimMatch[1]
        .toUpperCase();

    const guestPossession =
      await currentGuestAccess(
        request,
        env,
      );

    const hasGuestPossession =
      guestPossession
        ?.slug ===
      slug;

    if (
      !accessCode &&
      !hasGuestPossession
    ) {
      return json(
        {
          error:
            "Enter the printed access code, or scan the QR on your GYAN card.",
        },
        400,
      );
    }

    const row =
      await env.gyan_registry
        .prepare(
          `
            SELECT
              id,
              slug,
              gyan_name,
              access_code,
              duration_months,
              status,
              email,
              expires_at
            FROM calendar_access_codes
            WHERE slug = ?
            LIMIT 1
          `,
        )
        .bind(
          slug,
        )
        .first<{
          id:
            number;

          slug:
            string;

          gyan_name:
            string;

          access_code:
            string;

          duration_months:
            1 | 3 | 6 | 12;

          status:
            string;

          email:
            string | null;

          expires_at:
            string | null;
        }>();

    if (
      !row
    ) {
      return json(
        {
          error:
            "GYAN code not found.",
        },
        404,
      );
    }

    if (
      !hasGuestPossession &&
      row.access_code !==
        accessCode
    ) {
      return json(
        {
          error:
            "The access code does not match this GYAN calendar.",
        },
        400,
      );
    }

    if (
      row.status ===
        "CLAIMED"
    ) {
      if (
        row.email ===
          user.email
      ) {
        return json({
          claimed:
            true,

          alreadyClaimed:
            true,

          record: {
            slug:
              row.slug,

            gyanName:
              row.gyan_name,

            durationMonths:
              row.duration_months,

            email:
              row.email,

            expiresAt:
              row.expires_at,
          },
        });
      }

      return json(
        {
          error:
            "This GYAN calendar has already been registered.",
        },
        409,
      );
    }

    if (
      row.status ===
        "EXPIRED"
    ) {
      return json(
        {
          error:
            "This GYAN calendar access has expired.",
        },
        410,
      );
    }

    /*
     * Duration begins when the user claims the calendar, not when
     * the PDF was generated or physically printed.
     */
    await env.gyan_registry
      .prepare(
        `
          UPDATE calendar_access_codes
          SET
            status = 'CLAIMED',
            email = ?,
            claimed_at =
              CURRENT_TIMESTAMP,
            expires_at =
              datetime(
                'now',
                '+' ||
                duration_months ||
                ' months'
              )
          WHERE
            id = ?
            AND status IN (
              'GENERATED',
              'PRINTED',
              'GUEST_ACTIVE'
            )
        `,
      )
      .bind(
        user.email,
        row.id,
      )
      .run();

    await env.gyan_registry
      .prepare(
        `
          INSERT OR IGNORE INTO gem_transactions (
            calendar_access_id,
            amount,
            reason
          )
          VALUES (?, ?, 'WELCOME_PRINT')
        `,
      )
      .bind(
        row.id,
        row.duration_months === 12
          ? 12
          : row.duration_months === 6
            ? 6
            : 3,
      )
      .run();

    await env.gyan_registry
      .prepare(
        `
          DELETE FROM calendar_guest_sessions
          WHERE calendar_access_id = ?
        `,
      )
      .bind(
        row.id,
      )
      .run();

    const claimed =
      await env.gyan_registry
        .prepare(
          `
            SELECT
              slug,
              gyan_name,
              duration_months,
              status,
              email,
              claimed_at,
              expires_at
            FROM calendar_access_codes
            WHERE id = ?
            LIMIT 1
          `,
        )
        .bind(
          row.id,
        )
        .first();

    return json({
      claimed:
        true,

      record:
        claimed,
    });
  }


  const match =
    pathname.match(
      /^\/api\/calendar-access\/([A-Za-z0-9]{4,5})$/,
    );

  if (
    match &&
    request.method ===
      "GET"
  ) {
    const slug =
      match[1]
        .toUpperCase();

    const row =
      await env.gyan_registry
        .prepare(
          `
            SELECT
              id,
              slug,
              gyan_name,
              duration_months,
              status,
              email,
              generated_at,
              printed_at,
              claimed_at,
              expires_at
            FROM calendar_access_codes
            WHERE slug = ?
            LIMIT 1
          `,
        )
        .bind(
          slug,
        )
        .first();

    if (
      !row
    ) {
      return json(
        {
          error:
            "GYAN code not found.",
        },
        404,
      );
    }

    return json({
      record:
        row,
    });
  }


  return null;
}


export interface PuzzleEmailGyan {
  id: number;
  slug: string;
  gyanName: string;
  accessCode: string;
  publicUrl: string;
  safetyCards: SafetyResourceRecord[];
}

export async function ensurePuzzleEmailGyan(
  env: CalendarAccessEnv,
  rawEmail: string,
): Promise<PuzzleEmailGyan> {
  const email = rawEmail.trim().toLowerCase();

  let row = await env.gyan_registry
    .prepare(`
      SELECT id, slug, gyan_name, access_code
      FROM calendar_access_codes
      WHERE LOWER(email) = ?
        AND source = 'PUZZLE_EMAIL'
      ORDER BY id ASC
      LIMIT 1
    `)
    .bind(email)
    .first<{
      id: number;
      slug: string;
      gyan_name: string;
      access_code: string;
    }>();

  if (!row) {
    const created = await createOne(
      env,
      12,
      "EDUCATION",
    );

    await env.gyan_registry
      .prepare(`
        UPDATE calendar_access_codes
        SET
          email = ?,
          source = 'PUZZLE_EMAIL',
          status = 'CLAIMED',
          claimed_at = COALESCE(
            claimed_at,
            CURRENT_TIMESTAMP
          ),
          expires_at = COALESCE(
            expires_at,
            datetime(
              CURRENT_TIMESTAMP,
              '+12 months'
            )
          )
        WHERE id = ?
      `)
      .bind(
        email,
        created.id,
      )
      .run();

    row = {
      id: created.id,
      slug: created.slug,
      gyan_name: created.gyanName,
      access_code: created.accessCode,
    };
  }

  let safetyCards =
    await loadSafetyResources(
      env,
      row.id,
    );

  const existing = new Set(
    safetyCards.map(
      (card) => card.type,
    ),
  );

  for (
    const resourceType
    of SAFETY_RESOURCE_TYPES
  ) {
    if (
      existing.has(
        resourceType,
      )
    ) {
      continue;
    }

    for (
      let attempt = 0;
      attempt < 30;
      attempt += 1
    ) {
      const token =
        createSafetyPublicToken();

      try {
        await env.gyan_registry
          .prepare(`
            INSERT INTO gyan_safety_resources (
              calendar_access_id,
              resource_type,
              public_token,
              status
            )
            VALUES (?, ?, ?, 'ACTIVE')
          `)
          .bind(
            row.id,
            resourceType,
            token,
          )
          .run();

        break;
      } catch (error) {
        const message =
          error instanceof Error
            ? error.message
            : String(error);

        if (
          message.includes(
            "UNIQUE",
          )
        ) {
          continue;
        }

        throw error;
      }
    }
  }

  safetyCards =
    await loadSafetyResources(
      env,
      row.id,
    );

  return {
    id: row.id,
    slug: row.slug,
    gyanName: row.gyan_name,
    accessCode: row.access_code,
    publicUrl:
      `https://gyan.cc/${row.slug.toLowerCase()}`,
    safetyCards,
  };
}
