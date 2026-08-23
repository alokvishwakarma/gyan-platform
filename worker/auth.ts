interface AuthUserRow {
  id: number;
  email: string;
}

interface SessionRow {
  user_id: number;
  email: string;
}

const MAGIC_LINK_MINUTES = 15;
const SESSION_DAYS = 30;
const SESSION_COOKIE = "gyan_session";

function jsonResponse(
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

function normalizeEmail(
  value: unknown,
): string {
  return String(
    value ?? "",
  )
    .trim()
    .toLowerCase();
}

function validEmail(
  email: string,
): boolean {
  return (
    /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
      email,
    )
  );
}


function normalizeReturnPath(
  value: unknown,
): string {
  const candidate =
    String(
      value ?? "",
    )
      .trim();

  /*
   * Local paths only. This prevents the magic-link endpoint from
   * becoming an open redirect.
   */
  if (
    !candidate.startsWith(
      "/",
    ) ||
    candidate.startsWith(
      "//",
    )
  ) {
    return "/";
  }

  return candidate;
}

function bytesToHex(
  bytes: Uint8Array,
): string {
  return Array.from(
    bytes,
  )
    .map(
      (value) =>
        value
          .toString(16)
          .padStart(2, "0"),
    )
    .join("");
}

function createToken():
  string {
  const bytes =
    new Uint8Array(32);

  crypto.getRandomValues(
    bytes,
  );

  return bytesToHex(
    bytes,
  );
}

async function sha256(
  value: string,
): Promise<string> {
  const encoded =
    new TextEncoder()
      .encode(value);

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

function escapeHtml(
  value: string,
): string {
  return value
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");
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

    if (key === name) {
      return decodeURIComponent(
        rest.join("="),
      );
    }
  }

  return null;
}

function sessionCookie(
  token: string,
): string {
  const maxAge =
    SESSION_DAYS *
    24 *
    60 *
    60;

  return [
    `${SESSION_COOKIE}=${encodeURIComponent(
      token,
    )}`,
    "Path=/",
    `Max-Age=${maxAge}`,
    "HttpOnly",
    "Secure",
    "SameSite=Lax",
  ].join("; ");
}

function clearSessionCookie():
  string {
  return [
    `${SESSION_COOKIE}=`,
    "Path=/",
    "Max-Age=0",
    "HttpOnly",
    "Secure",
    "SameSite=Lax",
  ].join("; ");
}

async function sendMagicLinkEmail(
  env: Env,
  email: string,
  link: string,
): Promise<void> {
  if (!env.RESEND_API_KEY) {
    throw new Error(
      "Email service is not configured.",
    );
  }

  const response =
    await fetch(
      "https://api.resend.com/emails",
      {
        method: "POST",

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

            to: [email],

            subject:
              "Sign in to GYAN",

            html:
              `
              <div style="font-family:Arial,sans-serif;max-width:520px;margin:auto;color:#102a56;">
                <h2 style="margin-bottom:8px;">Sign in to GYAN</h2>
                <p style="line-height:1.5;">
                  Use the button below to sign in. This link expires in ${MAGIC_LINK_MINUTES} minutes
                  and can be used only once.
                </p>

                <p style="margin:24px 0;">
                  <a
                    href="${escapeHtml(link)}"
                    style="display:inline-block;padding:11px 18px;border-radius:9px;background:#1565c0;color:#fff;text-decoration:none;font-weight:700;"
                  >
                    Sign in to GYAN
                  </a>
                </p>

                <p style="font-size:12px;color:#64748b;line-height:1.5;">
                  If you did not request this email, you can ignore it.
                </p>
              </div>
              `,
          }),
      },
    );

  if (!response.ok) {
    const message =
      await response.text();

    console.error(
      "Magic-link email failed:",
      message,
    );

    throw new Error(
      "Sign-in email could not be sent.",
    );
  }
}

export async function currentUser(
  request: Request,
  env: Env,
): Promise<AuthUserRow | null> {
  const sessionToken =
    cookieValue(
      request,
      SESSION_COOKIE,
    );

  if (!sessionToken) {
    return null;
  }

  const tokenHash =
    await sha256(
      sessionToken,
    );

  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          users.id,
          users.email

        FROM user_sessions

        INNER JOIN users
          ON users.id =
             user_sessions.user_id

        WHERE
          user_sessions.token_hash = ?
          AND user_sessions.expires_at >
              CURRENT_TIMESTAMP

        LIMIT 1
        `,
      )
      .bind(
        tokenHash,
      )
      .first<AuthUserRow>();

  if (row) {
    await env.gyan_registry
      .prepare(
        `
        UPDATE user_sessions
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

  return row ?? null;
}

export async function handlePublicAuthRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  /*
   * --------------------------------------------
   * GET /api/auth/me
   * --------------------------------------------
   */
  if (
    request.method === "GET" &&
    url.pathname ===
      "/api/auth/me"
  ) {
    const user =
      await currentUser(
        request,
        env,
      );

    return jsonResponse({
      authenticated:
        Boolean(user),

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

  /*
   * --------------------------------------------
   * POST /api/auth/magic-link
   * --------------------------------------------
   */
  if (
    request.method === "POST" &&
    url.pathname ===
      "/api/auth/magic-link"
  ) {
    let body:
      {
        email?: string;
        returnTo?: string;
      };

    try {
      body =
        await request.json();
    } catch {
      return jsonResponse(
        {
          error:
            "Invalid request.",
        },
        400,
      );
    }

    const email =
      normalizeEmail(
        body.email,
      );


    const returnPath =
      normalizeReturnPath(
        body.returnTo,
      );

    if (
      !validEmail(email)
    ) {
      return jsonResponse(
        {
          error:
            "Enter a valid email address.",
        },
        400,
      );
    }

    /*
     * Basic cooldown:
     * don't issue another live link for the same
     * email within 60 seconds.
     */
    const recent =
      await env.gyan_registry
        .prepare(
          `
          SELECT id
          FROM auth_magic_links
          WHERE
            email = ?
            AND used_at IS NULL
            AND created_at >
              datetime(
                'now',
                '-60 seconds'
              )
          LIMIT 1
          `,
        )
        .bind(email)
        .first<{
          id: number;
        }>();

    if (recent) {
      return jsonResponse({
        sent: true,
      });
    }

    const token =
      createToken();

    const tokenHash =
      await sha256(
        token,
      );

    await env.gyan_registry
      .prepare(
        `
        INSERT INTO auth_magic_links (
          email,
          token_hash,
          return_path,
          expires_at
        )
        VALUES (
          ?,
          ?,
          ?,
          datetime(
            'now',
            '+${MAGIC_LINK_MINUTES} minutes'
          )
        )
        `,
      )
      .bind(
        email,
        tokenHash,
        returnPath,
      )
      .run();

    const verifyUrl =
      new URL(
        "/api/auth/verify",
        url.origin,
      );

    verifyUrl.searchParams.set(
      "token",
      token,
    );

    try {
      await sendMagicLinkEmail(
        env,
        email,
        verifyUrl.toString(),
      );
    } catch (error) {
      await env.gyan_registry
        .prepare(
          `
          DELETE FROM auth_magic_links
          WHERE token_hash = ?
          `,
        )
        .bind(
          tokenHash,
        )
        .run();

      return jsonResponse(
        {
          error:
            error instanceof Error
              ? error.message
              : "Sign-in email could not be sent.",
        },
        500,
      );
    }

    return jsonResponse({
      sent: true,
    });
  }

  /*
   * --------------------------------------------
   * GET /api/auth/verify?token=...
   * --------------------------------------------
   */
  if (
    request.method === "GET" &&
    url.pathname ===
      "/api/auth/verify"
  ) {
    const token =
      url.searchParams.get(
        "token",
      ) ?? "";

    if (!token) {
      return Response.redirect(
        new URL(
          "/?auth=invalid",
          url.origin,
        ).toString(),
        302,
      );
    }

    const tokenHash =
      await sha256(
        token,
      );

    const magic =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            id,
            email,
            return_path

          FROM auth_magic_links

          WHERE
            token_hash = ?
            AND used_at IS NULL
            AND expires_at >
                CURRENT_TIMESTAMP

          LIMIT 1
          `,
        )
        .bind(
          tokenHash,
        )
        .first<{
          id: number;
          email: string;
          return_path:
            string | null;
        }>();

    if (!magic) {
      return Response.redirect(
        new URL(
          "/?auth=invalid",
          url.origin,
        ).toString(),
        302,
      );
    }

    await env.gyan_registry
      .prepare(
        `
        INSERT INTO users (
          email,
          last_login_at
        )
        VALUES (
          ?,
          CURRENT_TIMESTAMP
        )

        ON CONFLICT(email)
        DO UPDATE SET
          updated_at =
            CURRENT_TIMESTAMP,
          last_login_at =
            CURRENT_TIMESTAMP
        `,
      )
      .bind(
        magic.email,
      )
      .run();

    const user =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            id,
            email
          FROM users
          WHERE email = ?
          LIMIT 1
          `,
        )
        .bind(
          magic.email,
        )
        .first<AuthUserRow>();

    if (!user) {
      return Response.redirect(
        new URL(
          "/?auth=error",
          url.origin,
        ).toString(),
        302,
      );
    }

    const sessionToken =
      createToken();

    const sessionHash =
      await sha256(
        sessionToken,
      );

    /*
     * Consume the one-time magic link before
     * establishing the session.
     */
    await env.gyan_registry.batch([
      env.gyan_registry
        .prepare(
          `
          UPDATE auth_magic_links
          SET used_at =
            CURRENT_TIMESTAMP
          WHERE id = ?
          `,
        )
        .bind(
          magic.id,
        ),

      env.gyan_registry
        .prepare(
          `
          INSERT INTO user_sessions (
            user_id,
            token_hash,
            expires_at
          )
          VALUES (
            ?,
            ?,
            datetime(
              'now',
              '+${SESSION_DAYS} days'
            )
          )
          `,
        )
        .bind(
          user.id,
          sessionHash,
        ),
    ]);

    const successUrl =
      new URL(
        normalizeReturnPath(
          magic.return_path,
        ),
        url.origin,
      );

    successUrl.searchParams.set(
      "auth",
      "success",
    );

    const response =
      Response.redirect(
        successUrl.toString(),
        302,
      );

    response.headers.append(
      "set-cookie",
      sessionCookie(
        sessionToken,
      ),
    );

    return response;
  }

  /*
   * --------------------------------------------
   * POST /api/auth/logout
   * --------------------------------------------
   */
  if (
    request.method === "POST" &&
    url.pathname ===
      "/api/auth/logout"
  ) {
    const sessionToken =
      cookieValue(
        request,
        SESSION_COOKIE,
      );

    if (sessionToken) {
      const tokenHash =
        await sha256(
          sessionToken,
        );

      await env.gyan_registry
        .prepare(
          `
          DELETE FROM user_sessions
          WHERE token_hash = ?
          `,
        )
        .bind(
          tokenHash,
        )
        .run();
    }

    const response =
      jsonResponse({
        loggedOut: true,
      });

    response.headers.append(
      "set-cookie",
      clearSessionCookie(),
    );

    return response;
  }

  return null;
}
