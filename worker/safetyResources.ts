export interface SafetyResourcesEnv {
  gyan_registry:
    D1Database;

  RESEND_API_KEY?:
    string;
}


type SafetyResourceType =
  | "MESSAGE"
  | "CERTIFICATE"
  | "LOST_FOUND"
  | "EMERGENCY"
  | "HELP";


type LostFoundProfile = {
  ownerDeliverAt: string;
  ownerContact: string;
  ownerMessage: string;

  finderFoundAt: string;
  finderWillDeliverAt: string;
  finderMessage: string;

  supportRequested: boolean;
};

type EmergencyProfile = {
  emergencyMessage: string;
  primaryContact: string;
  secondaryContact: string;
  medicalNotes: string;
  meetingPlace: string;
};



function json(
  body: unknown,
  status = 200,
): Response {
  return new Response(
    JSON.stringify(
      body,
    ),
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


function cleanText(
  value: unknown,
  maxLength: number,
): string {
  return typeof value ===
    "string"
    ? value
        .trim()
        .slice(
          0,
          maxLength,
        )
    : "";
}



function cookieValue(
  request: Request,
  name: string,
): string {
  const cookie =
    request.headers.get(
      "cookie",
    ) ??
    "";

  for (
    const part
    of cookie.split(
      ";",
    )
  ) {
    const [
      rawName,
      ...rawValue
    ] =
      part
        .trim()
        .split(
          "=",
        );

    if (
      rawName ===
        name
    ) {
      return decodeURIComponent(
        rawValue.join(
          "=",
        ),
      );
    }
  }

  return "";
}


async function sha256Hex(
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

  return Array.from(
    new Uint8Array(
      digest,
    ),
  )
    .map(
      (
        byte,
      ) =>
        byte
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


async function currentBrowserAccount(
  env:
    SafetyResourcesEnv,
  request:
    Request,
): Promise<{
  id: number;
  displayName: string;
  email: string | null;
} | null> {
  const secret =
    cookieValue(
      request,
      "gyan_anon",
    );

  if (!secret) {
    return null;
  }

  const secretHash =
    await safetySessionSha256Hex(
      secret,
    );

  return env.gyan_registry
    .prepare(
      `
        SELECT
          ga.id,
          ga.display_name,
          ga.email

        FROM gyan_browser_sessions bs

        INNER JOIN gyan_accounts ga
          ON ga.id =
             bs.account_id

        WHERE
          bs.secret_hash = ?

        LIMIT 1
      `,
    )
    .bind(
      secretHash,
    )
    .first<{
      id:
        number;

      displayName:
        string;

      email:
        string | null;
    }>();
}


function createWinkToken():
  string {
  return crypto
    .randomUUID()
    .replace(
      /-/g,
      "",
    )
    .slice(
      0,
      16,
    );
}


async function loadResource(
  env:
    SafetyResourcesEnv,
  token:
    string,
) {
  return env.gyan_registry
    .prepare(
      `
        SELECT
          r.id AS resource_id,
          r.calendar_access_id,
          r.resource_type,
          r.status,
          COALESCE(
            ga.display_name,
            c.gyan_name
          ) AS gyan_name,

          c.gyan_name
            AS original_gyan_name,

          COALESCE(
            ga.access_code,
            c.access_code
          ) AS access_code,
          COALESCE(
            ga.code,
            c.slug
          ) AS slug,

          ga.id AS gyan_account_id,
          ga.email AS gyan_email
        FROM gyan_safety_resources r
        INNER JOIN calendar_access_codes c
          ON c.id = r.calendar_access_id
        LEFT JOIN gyan_account_calendar_links gl
          ON gl.calendar_access_id =
             r.calendar_access_id
        LEFT JOIN gyan_accounts ga
          ON ga.id =
             gl.gyan_account_id
        WHERE
          r.public_token = ?
        LIMIT 1
      `,
    )
    .bind(
      token,
    )
    .first<{
      resource_id:
        number;

      calendar_access_id:
        number;

      resource_type:
        SafetyResourceType;

      status:
        string;

      gyan_name:
        string;

      original_gyan_name:
        string;

      access_code:
        string;

      slug:
        string;

      gyan_account_id:
        number | null;

      gyan_email:
        string | null;
    }>();
}


async function loadLostFound(
  env:
    SafetyResourcesEnv,
  resourceId:
    number,
): Promise<LostFoundProfile> {
  const row =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            owner_deliver_at,
            owner_contact,
            owner_message,
            finder_found_at,
            finder_will_deliver_at,
            finder_message,
            support_requested
          FROM gyan_lost_found_profiles
          WHERE
            safety_resource_id = ?
          LIMIT 1
        `,
      )
      .bind(
        resourceId,
      )
      .first<{
        owner_deliver_at:
          string | null;

        owner_contact:
          string | null;

        owner_message:
          string | null;

        finder_found_at:
          string | null;

        finder_will_deliver_at:
          string | null;

        finder_message:
          string | null;

        support_requested:
          number | null;
      }>();

  return {
    ownerDeliverAt:
      row?.owner_deliver_at ??
      "",

    ownerContact:
      row?.owner_contact ??
      "",

    ownerMessage:
      row?.owner_message ??
      "",

    finderFoundAt:
      row?.finder_found_at ??
      "",

    finderWillDeliverAt:
      row?.finder_will_deliver_at ??
      "",

    finderMessage:
      row?.finder_message ??
      "",

    supportRequested:
      Boolean(
        row?.support_requested,
      ),
  };
}


async function loadEmergency(
  env:
    SafetyResourcesEnv,
  resourceId:
    number,
): Promise<EmergencyProfile> {
  const row =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            emergency_message,
            primary_contact,
            secondary_contact,
            medical_notes,
            meeting_place

          FROM gyan_emergency_profiles

          WHERE
            safety_resource_id = ?

          LIMIT 1
        `,
      )
      .bind(
        resourceId,
      )
      .first<{
        emergency_message:
          string | null;

        primary_contact:
          string | null;

        secondary_contact:
          string | null;

        medical_notes:
          string | null;

        meeting_place:
          string | null;
      }>();

  return {
    emergencyMessage:
      row?.emergency_message ??
      "",

    primaryContact:
      row?.primary_contact ??
      "",

    secondaryContact:
      row?.secondary_contact ??
      "",

    medicalNotes:
      row?.medical_notes ??
      "",

    meetingPlace:
      row?.meeting_place ??
      "",
  };
}


function ownerCodeMatches(
  submitted:
    string,
  stored:
    string,
): boolean {
  return submitted
    .trim()
    .toUpperCase() ===
    stored
      .trim()
      .toUpperCase();
}


function maskRecoveryEmail(
  email:
    string,
): string {
  const [
    local,
    domain,
  ] =
    email.split(
      "@",
    );

  if (
    !local ||
    !domain
  ) {
    return "";
  }

  return `${local.slice(
    0,
    1,
  )}${"•".repeat(
    Math.min(
      4,
      Math.max(
        1,
        local.length - 1,
      ),
    ),
  )}@${domain}`;
}


async function safetySessionSha256Hex(
  value:
    string,
): Promise<string> {
  const bytes =
    new TextEncoder()
      .encode(
        value,
      );

  const digest =
    await crypto.subtle.digest(
      "SHA-256",
      bytes,
    );

  return Array.from(
    new Uint8Array(
      digest,
    ),
  )
    .map(
      (
        byte,
      ) =>
        byte
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


async function sendRecoveryVerificationEmail({
  env,
  email,
  displayName,
  verifyUrl,
}: {
  env:
    SafetyResourcesEnv;
  email:
    string;
  displayName:
    string;
  verifyUrl:
    string;
}): Promise<boolean> {
  if (
    !env.RESEND_API_KEY
  ) {
    return false;
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

            to: [
              email,
            ],

            subject:
              `Verify recovery email for ${displayName}`,

            html:
              `<div style="font-family:Arial,sans-serif;max-width:520px;margin:0 auto;padding:24px;color:#243b47;"><h2>Verify your GYAN recovery email</h2><p>This address was added as the recovery email for <strong>${displayName}</strong>.</p><p><a href="${verifyUrl}" style="display:inline-block;padding:10px 14px;background:#1976d2;color:#fff;text-decoration:none;border-radius:6px;">Verify Email</a></p><p style="font-size:12px;color:#667;">Until verified, this email is stored but cannot be used for authentication or Access Code recovery.</p></div>`,

            text:
              `Verify your GYAN recovery email for ${displayName}: ${verifyUrl}\n\nUntil verified, this email is stored but cannot be used for authentication or Access Code recovery.`,
          }),
      },
    );

  return response.ok;
}


function verificationHtml(
  ok:
    boolean,
  message:
    string,
): Response {
  return new Response(
    `<!doctype html><html><head><meta name="viewport" content="width=device-width,initial-scale=1"><title>GYAN Email Verification</title></head><body style="font-family:Arial,sans-serif;margin:0;background:#f6f8fa;color:#243b47;"><main style="max-width:520px;margin:40px auto;padding:24px;background:white;border-radius:12px;"><h2>${ok ? "✓ Email verified" : "Email verification"}</h2><p>${message}</p><p><a href="https://gyan.cc/">Return to GYAN</a></p></main></body></html>`,
    {
      status:
        ok
          ? 200
          : 400,

      headers: {
        "content-type":
          "text/html; charset=utf-8",

        "cache-control":
          "no-store",
      },
    },
  );
}


export async function cleanupExpiredGWinks(
  env:
    SafetyResourcesEnv,
): Promise<number> {
  const result =
    await env.gyan_registry
      .prepare(
        `
          DELETE FROM gyan_winks
          WHERE
            expires_at IS NOT NULL
            AND expires_at <= CURRENT_TIMESTAMP
        `,
      )
      .run();

  return result.meta.changes ??
    0;
}


export async function handleSafetyResourceRoute({
  request,
  env,
  pathname,
}: {
  request: Request;
  env: SafetyResourcesEnv;
  pathname: string;
}): Promise<Response | null> {
  if (
    pathname ===
      "/api/safety-resources/winks/recent" &&
    request.method ===
      "GET"
  ) {
    await cleanupExpiredGWinks(
      env,
    );

    const account =
      await currentBrowserAccount(
        env,
        request,
      );

    if (!account) {
      return json({
        messages: [],
      });
    }

    const rows =
      await env.gyan_registry
        .prepare(
          `
            SELECT
              w.id,
              w.wink_token,
              w.kind,
              w.message,
              w.read_at,
              w.created_at,
              w.sender_account_id,
              w.recipient_account_id,

              sr.public_token
                AS resource_token,

              sender.display_name
                AS sender_display_name,

              sender.code
                AS sender_code,

              recipient.display_name
                AS recipient_display_name,

              recipient.code
                AS recipient_code

            FROM gyan_winks w

            INNER JOIN gyan_safety_resources sr
              ON sr.id =
                 w.safety_resource_id

            LEFT JOIN gyan_accounts sender
              ON sender.id =
                 w.sender_account_id

            LEFT JOIN gyan_accounts recipient
              ON recipient.id =
                 w.recipient_account_id

            WHERE
              (
                w.recipient_account_id = ?
                OR w.sender_account_id = ?
              )
              AND (
                w.expires_at IS NULL
                OR w.expires_at >
                   CURRENT_TIMESTAMP
              )

            ORDER BY
              w.created_at DESC,
              w.id DESC

            LIMIT 10
          `,
        )
        .bind(
          account.id,
          account.id,
        )
        .all<{
          id:
            number;

          wink_token:
            string;

          kind:
            string;

          message:
            string;

          read_at:
            string | null;

          created_at:
            string;

          sender_account_id:
            number | null;

          recipient_account_id:
            number | null;

          resource_token:
            string;

          sender_display_name:
            string | null;

          sender_code:
            string | null;

          recipient_display_name:
            string | null;

          recipient_code:
            string | null;
        }>();

    return json({
      messages:
        rows.results.map(
          (
            message,
          ) => ({
            id:
              message.id,

            winkToken:
              message.wink_token,

            resourceToken:
              message.resource_token,

            kind:
              message.kind,

            preview:
              message.message.slice(
                0,
                80,
              ),

            direction:
              message.sender_account_id ===
                account.id
                ? "sent"
                : "received",

            senderDisplayName:
              message.sender_display_name ??
              "A GYAN Friend",

            senderCode:
              message.sender_code ??
              null,

            recipientDisplayName:
              message.recipient_display_name ??
              null,

            recipientCode:
              message.recipient_code ??
              null,

            read:
              Boolean(
                message.read_at,
              ),

            createdAt:
              message.created_at,
          }),
        ),
    });
  }


  if (
    pathname ===
      "/api/safety-resources/winks/unread" &&
    request.method ===
      "GET"
  ) {
    await cleanupExpiredGWinks(
      env,
    );

    const account =
      await currentBrowserAccount(
        env,
        request,
      );

    if (!account) {
      return json({
        unread:
          0,
      });
    }

    const row =
      await env.gyan_registry
        .prepare(
          `
            SELECT
              COUNT(*) AS unread

            FROM gyan_winks

            WHERE
              recipient_account_id = ?
              AND read_at IS NULL
              AND (
                expires_at IS NULL
                OR expires_at >
                   CURRENT_TIMESTAMP
              )
          `,
        )
        .bind(
          account.id,
        )
        .first<{
          unread:
            number;
        }>();

    return json({
      unread:
        Number(
          row?.unread ??
          0,
        ),
    });
  }

  const match =
    pathname.match(
      /^\/api\/safety-resources\/([a-z0-9]{10,12})(?:\/(lost-found|emergency|help|message)\/(finder|verify-owner|owner|chat|support|message|messages|email|verify-email|wink|winks|reply))?$/i,
    );

  if (!match) {
    return null;
  }

  const token =
    match[1]
      .toLowerCase();

  const module =
    match[2]
      ?.toLowerCase() ??
    null;

  const action =
    match[3]
      ?.toLowerCase() ??
    null;

  await cleanupExpiredGWinks(
    env,
  );

  const row =
    await loadResource(
      env,
      token,
    );

  if (
    !row ||
    row.status !==
      "ACTIVE"
  ) {
    return json(
      {
        error:
          "This GYAN card is not active.",
      },
      404,
    );
  }

  if (
    action &&
    (
      (
        module ===
          "lost-found" &&
        row.resource_type !==
          "LOST_FOUND"
      ) ||
      (
        module ===
          "emergency" &&
        row.resource_type !==
          "EMERGENCY"
      ) ||
      (
        module ===
          "help" &&
        row.resource_type !==
          "HELP"
      ) ||
      (
        module ===
          "message" &&
        row.resource_type !==
          "MESSAGE"
      )
    )
  ) {
    return json(
      {
        error:
          "This action is not available for this GYAN card.",
      },
      400,
    );
  }


  if (
    !action &&
    request.method ===
      "GET"
  ) {
    const lostFound =
      row.resource_type ===
        "LOST_FOUND"
        ? await loadLostFound(
            env,
            row.resource_id,
          )
        : undefined;

    const emergency =
      row.resource_type ===
        "EMERGENCY"
        ? await loadEmergency(
            env,
            row.resource_id,
          )
        : undefined;

    let helpData:
      {
        accountUrl: string;
        recoveryEmailStored: boolean;
        recoveryEmailVerified: boolean;
        maskedRecoveryEmail: string;
        safetyCards: Array<{
          type: SafetyResourceType;
          token: string;
          publicUrl: string;
        }>;
      } |
      undefined;

    if (
      row.resource_type ===
        "HELP"
    ) {
      const resources =
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

              ORDER BY id ASC
            `,
          )
          .bind(
            row.calendar_access_id,
          )
          .all<{
            resource_type:
              SafetyResourceType;

            public_token:
              string;
          }>();

      const recovery =
        await env.gyan_registry
          .prepare(
            `
              SELECT
                email,
                verified

              FROM gyan_recovery_emails

              WHERE
                calendar_access_id = ?

              LIMIT 1
            `,
          )
          .bind(
            row.calendar_access_id,
          )
          .first<{
            email:
              string;

            verified:
              number;
          }>();

      helpData = {
        accountUrl:
          `https://gyan.cc/${row.slug.toLowerCase()}`,

        recoveryEmailStored:
          Boolean(
            recovery?.email,
          ),

        recoveryEmailVerified:
          recovery?.verified ===
            1,

        maskedRecoveryEmail:
          recovery?.email
            ? maskRecoveryEmail(
                recovery.email,
              )
            : "",

        safetyCards:
          resources.results.map(
            (
              resource,
            ) => ({
              type:
                resource.resource_type,

              token:
                resource.public_token,

              publicUrl:
                `https://gyan.cc/${resource.public_token}`,
            }),
          ),
      };
    }


    /*
     * Privacy boundary:
     * Do NOT return calendar_access_id, parent slug,
     * email, access code, or any other account
     * credential here.
     */
    return json({
      token,

      type:
        row.resource_type,

      displayName:
        row.gyan_name,

      messageCard:
        row.resource_type ===
          "MESSAGE"
          ? {
              purpose:
                "Share a GYAN greeting or message using this QR.",
            }
          : undefined,

      lostFound,

      emergency,

      accountUrl:
        helpData?.accountUrl,

      recoveryEmailStored:
        helpData?.recoveryEmailStored,

      recoveryEmailVerified:
        helpData?.recoveryEmailVerified,

      maskedRecoveryEmail:
        helpData?.maskedRecoveryEmail,

      safetyCards:
        helpData?.safetyCards,
    });
  }


  if (
    module ===
      "message" &&
    action ===
      "winks" &&
    request.method ===
      "POST"
  ) {
    const body =
      await request.json<{
        kind?: unknown;
        message?: unknown;
        recipient?: unknown;
        addFriend?: unknown;
      }>();

    const kind =
      cleanText(
        body.kind,
        24,
      );

    const message =
      cleanText(
        body.message,
        240,
      );

    const recipient =
      cleanText(
        body.recipient,
        120,
      );

    const addFriend =
      body.addFriend ===
        true
        ? 1
        : 0;

    let recipientAccount:
      {
        id: number;
        code: string;
        display_name: string;
        email: string | null;
      } | null =
      null;

    if (
      recipient
    ) {
      recipientAccount =
        await env.gyan_registry
          .prepare(
            `
              SELECT
                id,
                code,
                display_name,
                email

              FROM gyan_accounts

              WHERE
                UPPER(code) =
                  UPPER(?)
                OR LOWER(display_name) =
                  LOWER(?)

              ORDER BY
                CASE
                  WHEN UPPER(code) =
                       UPPER(?)
                  THEN 0
                  ELSE 1
                END

              LIMIT 1
            `,
          )
          .bind(
            recipient,
            recipient,
            recipient,
          )
          .first<{
            id: number;
            code: string;
            display_name: string;
            email: string | null;
          }>();

      if (
        !recipientAccount
      ) {
        return json(
          {
            error:
              `GYAN recipient ${recipient} was not found.`,
          },
          404,
        );
      }
    }

    if (!message) {
      return json(
        {
          error:
            "Write a G-Wink message first.",
        },
        400,
      );
    }

    let winkToken =
      "";

    for (
      let attempt = 0;
      attempt < 20;
      attempt += 1
    ) {
      winkToken =
        crypto
          .randomUUID()
          .replace(
            /-/g,
            "",
          )
          .slice(
            0,
            16,
          );

      try {
        await env.gyan_registry
          .prepare(
            `
              INSERT INTO gyan_winks (
                safety_resource_id,
                wink_token,
                kind,
                message,
                recipient_query,
                add_friend,
                sender_account_id,
                recipient_account_id,
                expires_at
              )
              VALUES (
                ?, ?, ?, ?, ?, ?, ?, ?,
                datetime('now', '+30 days')
              )
            `,
          )
          .bind(
            row.resource_id,
            winkToken,
            kind,
            message,
            recipient ||
              null,
            addFriend,
            row.gyan_account_id,
            recipientAccount?.id ??
              null,
          )
          .run();

        break;
      } catch (
        error
      ) {
        const detail =
          error instanceof Error
            ? error.message
            : String(
                error,
              );

        if (
          detail.includes(
            "UNIQUE",
          )
        ) {
          winkToken =
            "";

          continue;
        }

        throw error;
      }
    }

    if (!winkToken) {
      return json(
        {
          error:
            "A G-Wink link could not be created.",
        },
        500,
      );
    }

    const origin =
      new URL(
        request.url,
      ).origin;

    const revealUrl =
      `${origin}/${token}?wink=${winkToken}`;

    let recipientEmailSent =
      false;

    if (
      recipientAccount &&
      env.RESEND_API_KEY
    ) {
      const recipientEmail =
        recipientAccount.email
          ?.trim()
          .toLowerCase() ??
        "";

      if (
        recipientEmail
      ) {
        try {
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

                    to: [
                      recipientEmail,
                    ],

                    cc:
                      recipientEmail ===
                        "admin@gyan.cc"
                        ? undefined
                        : [
                            "admin@gyan.cc",
                          ],

                    subject:
                      `😉 New G-Wink from ${row.gyan_name}`,

                    html:
                      `<div style="font-family:Arial,sans-serif;max-width:520px;margin:0 auto;padding:24px;color:#243b47;"><h2>😉 You received a G-Wink</h2><p>From <strong>${row.gyan_name}</strong></p><p>The message is waiting in your GYAN account.</p><p><a href="${revealUrl}" style="display:inline-block;padding:10px 14px;background:#6d4cc2;color:#fff;text-decoration:none;border-radius:8px;">Open G-Wink</a></p><p style="font-size:12px;color:#667;word-break:break-all;">${revealUrl}</p></div>`,

                    text:
                      `You received a G-Wink from ${row.gyan_name}.\n\nOpen it here:\n${revealUrl}\n\nThe message is also waiting in your GYAN account.`,
                  }),
              },
            );

          recipientEmailSent =
            response.ok;

          if (
            !response.ok
          ) {
            console.error(
              "GYAN recipient G-Wink email failed:",
              response.status,
              await response.text(),
            );
          }
        } catch (
          error
        ) {
          console.error(
            "GYAN recipient G-Wink email network error:",
            error,
          );
        }
      }
    }

    return json({
      created:
        true,

      winkToken,

      revealUrl,

      deliveredToAccount:
        recipientAccount
          ? {
              id:
                recipientAccount.id,
              code:
                recipientAccount.code,
              displayName:
                recipientAccount.display_name,
            }
          : null,

      recipientEmailSent,
    });
  }


  if (
    module ===
      "message" &&
    action ===
      "wink" &&
    request.method ===
      "GET"
  ) {
    const winkToken =
      cleanText(
        new URL(
          request.url,
        ).searchParams.get(
          "wink",
        ),
        64,
      );

    if (!winkToken) {
      return json(
        {
          error:
            "G-Wink link is incomplete.",
        },
        400,
      );
    }

    const wink =
      await env.gyan_registry
        .prepare(
          `
            SELECT
              w.kind,
              w.message,
              w.created_at,

              sender.display_name
                AS sender_display_name,

              sender.code
                AS sender_code,

              (
                SELECT
                  source_calendar.gyan_name

                FROM gyan_account_calendar_links source_link

                INNER JOIN calendar_access_codes source_calendar
                  ON source_calendar.id =
                     source_link.calendar_access_id

                WHERE
                  source_link.gyan_account_id =
                    w.sender_account_id

                LIMIT 1
              ) AS sender_original_name,

              recipient.display_name
                AS recipient_display_name,

              recipient.code
                AS recipient_code,

              w.recipient_account_id

            FROM gyan_winks w

            LEFT JOIN gyan_accounts sender
              ON sender.id =
                 w.sender_account_id

            LEFT JOIN gyan_accounts recipient
              ON recipient.id =
                 w.recipient_account_id

            WHERE
              w.safety_resource_id = ?
              AND w.wink_token = ?
              AND (
                w.expires_at IS NULL
                OR w.expires_at >
                   CURRENT_TIMESTAMP
              )

            LIMIT 1
          `,
        )
        .bind(
          row.resource_id,
          winkToken,
        )
        .first<{
          kind:
            string;

          message:
            string;

          created_at:
            string;

          sender_display_name:
            string | null;

          sender_code:
            string | null;

          sender_original_name:
            string | null;

          recipient_display_name:
            string | null;

          recipient_code:
            string | null;

          recipient_account_id:
            number | null;
        }>();

    if (
      wink
    ) {
      const viewer =
        await currentBrowserAccount(
          env,
          request,
        );

      if (
        viewer &&
        wink.recipient_account_id ===
          viewer.id
      ) {
        await env.gyan_registry
          .prepare(
            `
              UPDATE gyan_winks
              SET read_at =
                COALESCE(
                  read_at,
                  CURRENT_TIMESTAMP
                )
              WHERE
                safety_resource_id = ?
                AND wink_token = ?
            `,
          )
          .bind(
            row.resource_id,
            winkToken,
          )
          .run();
      }
    }

    if (!wink) {
      return json(
        {
          error:
            "This G-Wink could not be found.",
        },
        404,
      );
    }

    return json({
      wink: {
        token:
          winkToken,

        kind:
          wink.kind,

        message:
          wink.message,

        senderDisplayName:
          wink.sender_display_name ??
          row.gyan_name,

        senderCode:
          wink.sender_code ??
          null,

        senderOriginalName:
          wink.sender_original_name ??
          null,

        recipientDisplayName:
          wink.recipient_display_name ??
          null,

        recipientCode:
          wink.recipient_code ??
          null,

        createdAt:
          wink.created_at,
      },
    });
  }


  if (
    module ===
      "message" &&
    action ===
      "reply" &&
    request.method ===
      "POST"
  ) {
    const body =
      await request.json<{
        winkToken?: unknown;
        message?: unknown;
      }>();

    const originalWinkToken =
      cleanText(
        body.winkToken,
        64,
      );

    const replyMessage =
      cleanText(
        body.message,
        240,
      );

    if (
      !originalWinkToken ||
      !replyMessage
    ) {
      return json(
        {
          error:
            "Write a reply first.",
        },
        400,
      );
    }

    const original =
      await env.gyan_registry
        .prepare(
          `
            SELECT
              id

            FROM gyan_winks

            WHERE
              safety_resource_id = ?
              AND wink_token = ?

            LIMIT 1
          `,
        )
        .bind(
          row.resource_id,
          originalWinkToken,
        )
        .first<{
          id:
            number;
        }>();

    if (!original) {
      return json(
        {
          error:
            "The original G-Wink could not be found.",
        },
        404,
      );
    }

    if (
      !row.gyan_account_id
    ) {
      return json(
        {
          error:
            "The recipient GYAN account could not be found.",
        },
        409,
      );
    }

    const sender =
      await currentBrowserAccount(
        env,
        request,
      );

    let replyToken =
      "";

    for (
      let attempt = 0;
      attempt < 20;
      attempt += 1
    ) {
      replyToken =
        createWinkToken();

      try {
        await env.gyan_registry
          .prepare(
            `
              INSERT INTO gyan_winks (
                safety_resource_id,
                wink_token,
                kind,
                message,
                sender_account_id,
                recipient_account_id,
                parent_wink_id,
                expires_at
              )
              VALUES (
                ?, ?, '↩️', ?, ?, ?, ?,
                datetime('now', '+30 days')
              )
            `,
          )
          .bind(
            row.resource_id,
            replyToken,
            replyMessage,
            sender?.id ??
              null,
            row.gyan_account_id,
            original.id,
          )
          .run();

        break;
      } catch (
        error
      ) {
        const detail =
          error instanceof Error
            ? error.message
            : String(
                error,
              );

        if (
          detail.includes(
            "UNIQUE",
          )
        ) {
          replyToken =
            "";

          continue;
        }

        throw error;
      }
    }

    if (!replyToken) {
      return json(
        {
          error:
            "The reply could not be created.",
        },
        500,
      );
    }

    const origin =
      new URL(
        request.url,
      ).origin;

    const replyUrl =
      `${origin}/${token}?wink=${replyToken}`;

    const senderName =
      sender?.displayName ??
      "A GYAN Friend";

    let emailSent =
      false;

    if (
      env.RESEND_API_KEY
    ) {
      const ownerEmail =
        row.gyan_email
          ?.trim()
          .toLowerCase() ??
        "";

      const to =
        ownerEmail
          ? [
              ownerEmail,
            ]
          : [
              "admin@gyan.cc",
            ];

      const cc =
        ownerEmail &&
        ownerEmail !==
          "admin@gyan.cc"
          ? [
              "admin@gyan.cc",
            ]
          : undefined;

      try {
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

                  to,

                  cc,

                  subject:
                    `↩️ New G-Wink reply from ${senderName}`,

                  html:
                    `<div style="font-family:Arial,sans-serif;max-width:520px;margin:0 auto;padding:24px;color:#243b47;"><h2>↩️ You received a G-Wink reply</h2><p>From <strong>${senderName}</strong></p><p>The reply is stored in your GYAN account.</p><p><a href="${replyUrl}" style="display:inline-block;padding:10px 14px;background:#6d4cc2;color:#fff;text-decoration:none;border-radius:8px;">Open reply</a></p><p style="font-size:12px;color:#667;word-break:break-all;">${replyUrl}</p></div>`,

                  text:
                    `You received a G-Wink reply from ${senderName}.\n\nOpen reply:\n${replyUrl}\n\nThe reply is stored in your GYAN account.`,
                }),
            },
          );

        emailSent =
          response.ok;

        if (
          !response.ok
        ) {
          console.error(
            "G-Wink reply email failed:",
            response.status,
            await response.text(),
          );
        }
      } catch (
        error
      ) {
        console.error(
          "G-Wink reply email network error:",
          error,
        );
      }
    }

    return json({
      sent:
        true,

      replyToken,

      replyUrl,

      storedForAccount:
        row.gyan_account_id,

      emailSent,
    });
  }


  if (
    module ===
      "message" &&
    action ===
      "email" &&
    request.method ===
      "POST"
  ) {
    if (
      !env.RESEND_API_KEY
    ) {
      return json(
        {
          error:
            "Email delivery is not configured.",
        },
        503,
      );
    }

    const body =
      await request.json<{
        email?: unknown;
        cc?: unknown;
        winkToken?: unknown;
        qrPngBase64?: unknown;
      }>();

    const email =
      cleanText(
        body.email,
        320,
      ).toLowerCase();

    const cc =
      cleanText(
        body.cc,
        320,
      ).toLowerCase();

    const winkToken =
      cleanText(
        body.winkToken,
        64,
      );

    const qrPngBase64 =
      typeof body.qrPngBase64 ===
        "string"
        ? body.qrPngBase64
            .trim()
        : "";

    if (
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
        email,
      )
    ) {
      return json(
        {
          error:
            "Enter a valid email address.",
        },
        400,
      );
    }

    if (
      cc &&
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
        cc,
      )
    ) {
      return json(
        {
          error:
            "Enter a valid CC email address.",
        },
        400,
      );
    }

    if (
      !winkToken
    ) {
      return json(
        {
          error:
            "Create the G-Wink before emailing it.",
        },
        400,
      );
    }

    const savedWink =
      await env.gyan_registry
        .prepare(
          `
            SELECT id
            FROM gyan_winks
            WHERE
              safety_resource_id = ?
              AND wink_token = ?
            LIMIT 1
          `,
        )
        .bind(
          row.resource_id,
          winkToken,
        )
        .first();

    if (!savedWink) {
      return json(
        {
          error:
            "This G-Wink could not be found.",
        },
        404,
      );
    }

    if (
      !qrPngBase64 ||
      qrPngBase64.length >
        4_000_000
    ) {
      return json(
        {
          error:
            "G-Wink QR image is missing or too large.",
        },
        400,
      );
    }

    const requestOrigin =
      new URL(
        request.url,
      ).origin;

    const winkUrl =
      `${requestOrigin}/${token}?wink=${encodeURIComponent(
        winkToken,
      )}`;

    let resendResponse:
      Response;

    try {
      resendResponse =
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

              to: [
                email,
              ],

              cc:
                cc
                  ? [
                      cc,
                    ]
                  : undefined,

              subject:
                `😉 You got a G-Wink from ${row.gyan_name}`,

              html:
                `<div style="font-family:Arial,sans-serif;max-width:520px;margin:0 auto;padding:24px;text-align:center;color:#243b47;"><h2>😉 You got a G-Wink!</h2><p>From <strong>${row.gyan_name}</strong></p><p>The message is kept behind the QR and is not shown in this email.</p><p><a href="${winkUrl}" style="display:inline-block;padding:10px 14px;background:#6d4cc2;color:#fff;text-decoration:none;border-radius:8px;">Open G-Wink</a></p><p style="margin:10px 0 4px;font-size:12px;color:#667;">If you are reading this on your phone and cannot scan the QR, tap or copy this link:</p><p style="margin:0 0 12px;word-break:break-all;"><a href="${winkUrl}" style="color:#285f85;text-decoration:underline;">${winkUrl}</a></p><p style="font-size:12px;color:#667;">The attached PNG contains the G-Wink QR.</p></div>`,

              text:
                `You got a G-Wink from ${row.gyan_name}.\n\nOpen it here:\n${winkUrl}\n\nIf you cannot scan the QR from your phone, tap or copy the link above.\n\nThe message itself is not included in this email.`,

              attachments: [
                {
                  filename:
                    "G-Wink.png",

                  content:
                    qrPngBase64,
                },
              ],
            }),
          },
        );
    } catch (
      error
    ) {
      console.error(
        "G-Wink email network error:",
        error,
      );

      return json(
        {
          error:
            "Temporary network problem while sending G-Wink. Please try again.",
          retryable:
            true,
        },
        503,
      );
    }

    if (
      !resendResponse.ok
    ) {
      const detail =
        await resendResponse.text();

      console.error(
        "G-Wink email failed:",
        resendResponse.status,
        detail,
      );

      return json(
        {
          error:
            "G-Wink email could not be sent.",
        },
        502,
      );
    }

    return json({
      sent:
        true,
    });
  }


  if (
    module ===
      "lost-found" &&
    action ===
      "finder" &&
    request.method ===
      "POST"
  ) {
    const body =
      await request.json<{
        foundAt?: unknown;
        willDeliverAt?: unknown;
        message?: unknown;
      }>();

    const foundAt =
      cleanText(
        body.foundAt,
        120,
      );

    const willDeliverAt =
      cleanText(
        body.willDeliverAt,
        120,
      );

    const message =
      cleanText(
        body.message,
        300,
      );

    await env.gyan_registry
      .prepare(
        `
          INSERT INTO gyan_lost_found_profiles (
            safety_resource_id,
            finder_found_at,
            finder_will_deliver_at,
            finder_message,
            updated_at
          )
          VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP)

          ON CONFLICT (
            safety_resource_id
          )
          DO UPDATE SET
            finder_found_at =
              excluded.finder_found_at,

            finder_will_deliver_at =
              excluded.finder_will_deliver_at,

            finder_message =
              excluded.finder_message,

            updated_at =
              CURRENT_TIMESTAMP
        `,
      )
      .bind(
        row.resource_id,
        foundAt,
        willDeliverAt,
        message,
      )
      .run();

    return json({
      saved:
        true,

      lostFound:
        await loadLostFound(
          env,
          row.resource_id,
        ),
    });
  }


  if (
    module ===
      "lost-found" &&
    action ===
      "verify-owner" &&
    request.method ===
      "POST"
  ) {
    const body =
      await request.json<{
        accessCode?: unknown;
      }>();

    const accessCode =
      cleanText(
        body.accessCode,
        32,
      );

    if (
      !ownerCodeMatches(
        accessCode,
        row.access_code,
      )
    ) {
      return json(
        {
          error:
            "Access Code was not accepted.",
        },
        403,
      );
    }

    return json({
      verified:
        true,
    });
  }


  if (
    module ===
      "lost-found" &&
    action ===
      "owner" &&
    request.method ===
      "POST"
  ) {
    const body =
      await request.json<{
        accessCode?: unknown;
        deliverAt?: unknown;
        contact?: unknown;
        message?: unknown;
      }>();

    const accessCode =
      cleanText(
        body.accessCode,
        32,
      );

    if (
      !ownerCodeMatches(
        accessCode,
        row.access_code,
      )
    ) {
      return json(
        {
          error:
            "Access Code was not accepted.",
        },
        403,
      );
    }

    const deliverAt =
      cleanText(
        body.deliverAt,
        120,
      );

    const contact =
      cleanText(
        body.contact,
        120,
      );

    const message =
      cleanText(
        body.message,
        300,
      );

    await env.gyan_registry
      .prepare(
        `
          INSERT INTO gyan_lost_found_profiles (
            safety_resource_id,
            owner_deliver_at,
            owner_contact,
            owner_message,
            updated_at
          )
          VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP)

          ON CONFLICT (
            safety_resource_id
          )
          DO UPDATE SET
            owner_deliver_at =
              excluded.owner_deliver_at,

            owner_contact =
              excluded.owner_contact,

            owner_message =
              excluded.owner_message,

            updated_at =
              CURRENT_TIMESTAMP
        `,
      )
      .bind(
        row.resource_id,
        deliverAt,
        contact,
        message,
      )
      .run();

    return json({
      saved:
        true,

      lostFound:
        await loadLostFound(
          env,
          row.resource_id,
        ),
    });
  }


  if (
    module ===
      "lost-found" &&
    action ===
      "support" &&
    request.method ===
      "POST"
  ) {
    await env.gyan_registry
      .prepare(
        `
          INSERT INTO gyan_lost_found_profiles (
            safety_resource_id,
            support_requested,
            updated_at
          )
          VALUES (?, 1, CURRENT_TIMESTAMP)

          ON CONFLICT (
            safety_resource_id
          )
          DO UPDATE SET
            support_requested = 1,
            updated_at = CURRENT_TIMESTAMP
        `,
      )
      .bind(
        row.resource_id,
      )
      .run();

    return json({
      requested:
        true,

      lostFound:
        await loadLostFound(
          env,
          row.resource_id,
        ),
    });
  }


  if (
    module ===
      "lost-found" &&
    action ===
      "chat" &&
    request.method ===
      "GET"
  ) {
    const messages =
      await env.gyan_registry
        .prepare(
          `
            SELECT
              id,
              sender_role,
              message,
              created_at
            FROM gyan_lost_found_messages
            WHERE
              safety_resource_id = ?
            ORDER BY
              id ASC
            LIMIT 100
          `,
        )
        .bind(
          row.resource_id,
        )
        .all<{
          id:
            number;

          sender_role:
            "FINDER" |
            "OWNER" |
            "SUPPORT";

          message:
            string;

          created_at:
            string;
        }>();

    return json({
      messages:
        messages.results.map(
          (
            message,
          ) => ({
            id:
              message.id,

            senderRole:
              message.sender_role,

            message:
              message.message,

            createdAt:
              message.created_at,
          }),
        ),
    });
  }


  if (
    module ===
      "lost-found" &&
    action ===
      "chat" &&
    request.method ===
      "POST"
  ) {
    const body =
      await request.json<{
        senderRole?: unknown;
        accessCode?: unknown;
        message?: unknown;
      }>();

    const senderRole =
      body.senderRole ===
        "OWNER"
        ? "OWNER"
        : "FINDER";

    if (
      senderRole ===
        "OWNER"
    ) {
      const accessCode =
        cleanText(
          body.accessCode,
          32,
        );

      if (
        !ownerCodeMatches(
          accessCode,
          row.access_code,
        )
      ) {
        return json(
          {
            error:
              "Access Code was not accepted.",
          },
          403,
        );
      }
    }

    const message =
      cleanText(
        body.message,
        500,
      );

    if (!message) {
      return json(
        {
          error:
            "Message is required.",
        },
        400,
      );
    }

    const inserted =
      await env.gyan_registry
        .prepare(
          `
            INSERT INTO gyan_lost_found_messages (
              safety_resource_id,
              sender_role,
              message
            )
            VALUES (?, ?, ?)
            RETURNING
              id,
              sender_role,
              message,
              created_at
          `,
        )
        .bind(
          row.resource_id,
          senderRole,
          message,
        )
        .first<{
          id:
            number;

          sender_role:
            "FINDER" |
            "OWNER";

          message:
            string;

          created_at:
            string;
        }>();

    return json({
      message: {
        id:
          inserted?.id ??
          0,

        senderRole:
          inserted?.sender_role ??
          senderRole,

        message:
          inserted?.message ??
          message,

        createdAt:
          inserted?.created_at ??
          new Date()
            .toISOString(),
      },
    });
  }


  if (
    module ===
      "emergency" &&
    action ===
      "verify-owner" &&
    request.method ===
      "POST"
  ) {
    const body =
      await request.json<{
        accessCode?: unknown;
      }>();

    const accessCode =
      cleanText(
        body.accessCode,
        32,
      );

    if (
      !ownerCodeMatches(
        accessCode,
        row.access_code,
      )
    ) {
      return json(
        {
          error:
            "Access Code was not accepted.",
        },
        403,
      );
    }

    return json({
      verified:
        true,
    });
  }


  if (
    module ===
      "emergency" &&
    action ===
      "owner" &&
    request.method ===
      "POST"
  ) {
    const body =
      await request.json<{
        accessCode?: unknown;
        emergencyMessage?: unknown;
        primaryContact?: unknown;
        secondaryContact?: unknown;
        medicalNotes?: unknown;
        meetingPlace?: unknown;
      }>();

    const accessCode =
      cleanText(
        body.accessCode,
        32,
      );

    if (
      !ownerCodeMatches(
        accessCode,
        row.access_code,
      )
    ) {
      return json(
        {
          error:
            "Access Code was not accepted.",
        },
        403,
      );
    }

    const emergencyMessage =
      cleanText(
        body.emergencyMessage,
        300,
      );

    const primaryContact =
      cleanText(
        body.primaryContact,
        160,
      );

    const secondaryContact =
      cleanText(
        body.secondaryContact,
        160,
      );

    const medicalNotes =
      cleanText(
        body.medicalNotes,
        500,
      );

    const meetingPlace =
      cleanText(
        body.meetingPlace,
        160,
      );

    await env.gyan_registry
      .prepare(
        `
          INSERT INTO gyan_emergency_profiles (
            safety_resource_id,
            emergency_message,
            primary_contact,
            secondary_contact,
            medical_notes,
            meeting_place,
            updated_at
          )
          VALUES (
            ?,
            ?,
            ?,
            ?,
            ?,
            ?,
            CURRENT_TIMESTAMP
          )

          ON CONFLICT (
            safety_resource_id
          )
          DO UPDATE SET
            emergency_message =
              excluded.emergency_message,

            primary_contact =
              excluded.primary_contact,

            secondary_contact =
              excluded.secondary_contact,

            medical_notes =
              excluded.medical_notes,

            meeting_place =
              excluded.meeting_place,

            updated_at =
              CURRENT_TIMESTAMP
        `,
      )
      .bind(
        row.resource_id,
        emergencyMessage,
        primaryContact,
        secondaryContact,
        medicalNotes,
        meetingPlace,
      )
      .run();

    return json({
      saved:
        true,

      emergency:
        await loadEmergency(
          env,
          row.resource_id,
        ),
    });
  }


  if (
    module ===
      "emergency" &&
    action ===
      "message" &&
    request.method ===
      "POST"
  ) {
    const body =
      await request.json<{
        message?: unknown;
        contact?: unknown;
      }>();

    const message =
      cleanText(
        body.message,
        500,
      );

    const contact =
      cleanText(
        body.contact,
        160,
      );

    if (!message) {
      return json(
        {
          error:
            "Message is required.",
        },
        400,
      );
    }

    await env.gyan_registry
      .prepare(
        `
          INSERT INTO gyan_emergency_messages (
            safety_resource_id,
            message,
            contact
          )
          VALUES (
            ?,
            ?,
            ?
          )
        `,
      )
      .bind(
        row.resource_id,
        message,
        contact ||
          null,
      )
      .run();

    return json({
      sent:
        true,
    });
  }


  if (
    module ===
      "emergency" &&
    action ===
      "messages" &&
    request.method ===
      "POST"
  ) {
    const body =
      await request.json<{
        accessCode?: unknown;
      }>();

    const accessCode =
      cleanText(
        body.accessCode,
        32,
      );

    if (
      !ownerCodeMatches(
        accessCode,
        row.access_code,
      )
    ) {
      return json(
        {
          error:
            "Access Code was not accepted.",
        },
        403,
      );
    }

    const rows =
      await env.gyan_registry
        .prepare(
          `
            SELECT
              id,
              message,
              contact,
              created_at

            FROM gyan_emergency_messages

            WHERE
              safety_resource_id = ?

            ORDER BY
              id DESC

            LIMIT 100
          `,
        )
        .bind(
          row.resource_id,
        )
        .all<{
          id:
            number;

          message:
            string;

          contact:
            string | null;

          created_at:
            string;
        }>();

    return json({
      messages:
        rows.results.map(
          (
            item,
          ) => ({
            id:
              item.id,

            message:
              item.message,

            contact:
              item.contact ??
              "",

            createdAt:
              item.created_at,
          }),
        ),
    });
  }


  if (
    module ===
      "help" &&
    action ===
      "email" &&
    request.method ===
      "POST"
  ) {
    const body =
      await request.json<{
        accessCode?: unknown;
        email?: unknown;
      }>();

    const accessCode =
      cleanText(
        body.accessCode,
        32,
      );

    const email =
      cleanText(
        body.email,
        254,
      )
        .toLowerCase();

    if (
      !ownerCodeMatches(
        accessCode,
        row.access_code,
      )
    ) {
      return json(
        {
          error:
            "Access Code was not accepted.",
        },
        403,
      );
    }

    if (
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
        email,
      )
    ) {
      return json(
        {
          error:
            "Enter a valid email address.",
        },
        400,
      );
    }

    const rawToken =
      crypto.randomUUID()
        .replaceAll(
          "-",
          "",
        );

    const tokenHash =
      await sha256Hex(
        rawToken,
      );

    await env.gyan_registry
      .prepare(
        `
          INSERT INTO gyan_recovery_emails (
            calendar_access_id,
            email,
            verified,
            verification_token_hash,
            verification_expires_at,
            updated_at
          )
          VALUES (
            ?,
            ?,
            0,
            ?,
            datetime(
              CURRENT_TIMESTAMP,
              '+24 hours'
            ),
            CURRENT_TIMESTAMP
          )

          ON CONFLICT (
            calendar_access_id
          )
          DO UPDATE SET
            email =
              excluded.email,

            verified =
              0,

            verification_token_hash =
              excluded.verification_token_hash,

            verification_expires_at =
              excluded.verification_expires_at,

            updated_at =
              CURRENT_TIMESTAMP
        `,
      )
      .bind(
        row.calendar_access_id,
        email,
        tokenHash,
      )
      .run();

    const verifyUrl =
      `https://gyan.cc/api/safety-resources/${token}/help/verify-email?token=${encodeURIComponent(
        rawToken,
      )}`;

    let verificationSent =
      false;

    try {
      verificationSent =
        await sendRecoveryVerificationEmail({
          env,
          email,
          displayName:
            row.gyan_name,
          verifyUrl,
        });
    } catch {
      verificationSent =
        false;
    }

    return json({
      stored:
        true,

      verificationSent,

      verified:
        false,

      maskedEmail:
        maskRecoveryEmail(
          email,
        ),
    });
  }


  if (
    module ===
      "help" &&
    action ===
      "verify-email" &&
    request.method ===
      "GET"
  ) {
    const requestUrl =
      new URL(
        request.url,
      );

    const rawToken =
      requestUrl.searchParams
        .get(
          "token",
        )
        ?.trim() ??
      "";

    if (
      !rawToken
    ) {
      return verificationHtml(
        false,
        "The verification link is incomplete.",
      );
    }

    const tokenHash =
      await sha256Hex(
        rawToken,
      );

    const recovery =
      await env.gyan_registry
        .prepare(
          `
            SELECT
              email

            FROM gyan_recovery_emails

            WHERE
              calendar_access_id = ?
              AND verification_token_hash = ?
              AND verification_expires_at >
                CURRENT_TIMESTAMP

            LIMIT 1
          `,
        )
        .bind(
          row.calendar_access_id,
          tokenHash,
        )
        .first<{
          email:
            string;
        }>();

    if (
      !recovery
    ) {
      return verificationHtml(
        false,
        "This verification link is invalid or has expired.",
      );
    }

    await env.gyan_registry
      .prepare(
        `
          UPDATE gyan_recovery_emails

          SET
            verified = 1,
            verified_at =
              CURRENT_TIMESTAMP,
            verification_token_hash =
              NULL,
            verification_expires_at =
              NULL,
            updated_at =
              CURRENT_TIMESTAMP

          WHERE
            calendar_access_id = ?
        `,
      )
      .bind(
        row.calendar_access_id,
      )
      .run();

    return verificationHtml(
      true,
      "Your recovery email is now verified. It may be used for future GYAN Access Code recovery.",
    );
  }


  return json(
    {
      error:
        "Method not allowed.",
    },
    405,
  );
}
