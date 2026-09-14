/*
 * worker/gyanCardCatalog.ts
 *
 * Shopping Cart — Phase 1
 *
 * GET  /api/shopping-cart/catalog
 * GET  /api/shopping-cart/catalog?program=JEE&batch=2026_SEP_OCT
 * POST /api/shopping-cart/contact
 * POST /api/shopping-cart/purchase
 * GET  /api/shopping-cart/verify?token=...
 *
 * Phase 1 supports direct Gem purchases for Live Test entitlements.
 */

export interface ShoppingCartCatalogEnv {
  gyan_registry: D1Database;
  RESEND_API_KEY?: string;
}

type BatchRow = {
  batch_code: string;
  label: string;
  start_date: string;
  end_date: string;
  sort_order: number;
};

type ProgramRow = {
  program_code: string;
};

type LiveRow = {
  public_code: string;
  source_schedule_date: string | null;
  test_fraction_percent: number | null;
  entry_gem_cost: number;
  report_gem_cost: number;
  status: string;
};

type MockRow = {
  id: number;
  test_kind: string;
  test_code: string;
  published: number;
  question_count: number;
};

function json(
  body: unknown,
  status = 200,
): Response {
  return new Response(
    JSON.stringify(body),
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

function utcDate(): string {
  return new Date()
    .toISOString()
    .slice(0, 10);
}


function cookieValue(
  request: Request,
  name: string,
): string | null {
  const cookie =
    request.headers.get(
      "cookie",
    ) ??
    "";

  for (
    const part
    of cookie.split(";")
  ) {
    const [
      rawName,
      ...rawValue
    ] =
      part.trim().split("=");

    if (
      rawName ===
      name
    ) {
      return decodeURIComponent(
        rawValue.join("="),
      );
    }
  }

  return null;
}

async function currentGyanOwner(
  request: Request,
  env: ShoppingCartCatalogEnv,
): Promise<{
  accountId: number;
  calendarAccessId: number;
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
    await sha256(
      secret,
    );

  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          s.account_id AS account_id,
          l.calendar_access_id AS calendar_access_id
        FROM gyan_browser_sessions s
        INNER JOIN gyan_account_calendar_links l
          ON l.gyan_account_id = s.account_id
        WHERE s.secret_hash = ?
        LIMIT 1
        `,
      )
      .bind(
        secretHash,
      )
      .first<{
        account_id: number;
        calendar_access_id: number;
      }>();

  if (!row) {
    return null;
  }

  return {
    accountId:
      Number(
        row.account_id,
      ),
    calendarAccessId:
      Number(
        row.calendar_access_id,
      ),
  };
}

async function currentGemBalance(
  env: ShoppingCartCatalogEnv,
  calendarAccessId: number,
): Promise<number> {
  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          COALESCE(
            SUM(amount),
            0
          ) AS balance
        FROM gem_transactions
        WHERE calendar_access_id = ?
        `,
      )
      .bind(
        calendarAccessId,
      )
      .first<{
        balance: number;
      }>();

  return Number(
    row?.balance ??
    0,
  );
}

function normalizedEmail(
  value: unknown,
): string | null {
  if (
    typeof value !==
      "string"
  ) {
    return null;
  }

  const email =
    value
      .trim()
      .toLowerCase();

  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    .test(email)
    ? email
    : null;
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

function randomHex(
  byteLength: number,
): string {
  const bytes =
    new Uint8Array(
      byteLength,
    );

  crypto.getRandomValues(
    bytes,
  );

  return Array.from(
    bytes,
  )
    .map(
      (
        value,
      ) =>
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
  const digest =
    await crypto.subtle.digest(
      "SHA-256",
      new TextEncoder()
        .encode(
          value,
        ),
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
          .toString(16)
          .padStart(
            2,
            "0",
          ),
    )
    .join("");
}

function requestCode(): string {
  const today =
    new Date()
      .toISOString()
      .slice(
        0,
        10,
      )
      .replaceAll(
        "-",
        "",
      );

  return `SC-${today}-${randomHex(
    4,
  ).toUpperCase()}`;
}

async function sendAccessRequestEmail(
  env: ShoppingCartCatalogEnv,
  to: string,
  subject: string,
  html: string,
  text: string,
): Promise<boolean> {
  if (
    !env.RESEND_API_KEY
  ) {
    return false;
  }

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
                "GYAN Education <admin@gyan.cc>",
              to:
                [to],
              cc:
                ["admin@gyan.cc"],
              subject,
              html,
              text,
            }),
        },
      );

    if (
      !response.ok
    ) {
      console.error(
        "Shopping-cart access email failed:",
        await response.text(),
      );
      return false;
    }

    return true;
  } catch (
    error
  ) {
    console.error(
      "Shopping-cart access email failed:",
      error,
    );
    return false;
  }
}

async function createAccessRequest(
  request: Request,
  env: ShoppingCartCatalogEnv,
  url: URL,
): Promise<Response> {
  let body: {
    email?: unknown;
    program?: unknown;
    batchCode?: unknown;
    batchLabel?: unknown;
    access?: {
      test?: unknown;
      results?: unknown;
      aiTips?: unknown;
    };
    items?: unknown;
    estimatedGems?: unknown;
    shopCode?: unknown;
  };

  try {
    body =
      await request.json();
  } catch {
    return json(
      {
        error:
          "Invalid request.",
      },
      400,
    );
  }

  const email =
    normalizedEmail(
      body.email,
    );

  const program =
    typeof body.program ===
      "string"
      ? body.program
          .trim()
          .toUpperCase()
      : "";

  const batchCode =
    typeof body.batchCode ===
      "string"
      ? body.batchCode
          .trim()
          .toUpperCase()
      : "";

  const batchLabel =
    typeof body.batchLabel ===
      "string"
      ? body.batchLabel
          .trim()
      : "";

  const accessTest =
    body.access?.test ===
      true;

  const accessResults =
    body.access?.results ===
      true;

  const accessAiTips =
    body.access?.aiTips ===
      true;

  const estimatedGems =
    Number(
      body.estimatedGems,
    );

  const shopCode =
    typeof body.shopCode ===
      "string"
      ? body.shopCode
          .trim()
          .toUpperCase()
      : "GYAN_ONLINE";

  if (!email) {
    return json(
      {
        error:
          "Please enter a valid email address.",
      },
      400,
    );
  }

  if (
    !program ||
    !batchCode ||
    !batchLabel
  ) {
    return json(
      {
        error:
          "Program and batch are required.",
      },
      400,
    );
  }

  if (
    !accessTest &&
    !accessResults &&
    !accessAiTips
  ) {
    return json(
      {
        error:
          "Select at least one access type.",
      },
      400,
    );
  }

  /*
   * Enforce the same dependency rules on the server.
   * AI Tips -> Results -> Test.
   */
  const normalizedAccessAi =
    accessAiTips;

  const normalizedAccessResults =
    accessResults ||
    normalizedAccessAi;

  const normalizedAccessTest =
    accessTest ||
    normalizedAccessResults;

  if (
    !Array.isArray(
      body.items,
    ) ||
    body.items.length ===
      0 ||
    body.items.length >
      250
  ) {
    return json(
      {
        error:
          "Select at least one test.",
      },
      400,
    );
  }

  const items =
    body.items
      .map(
        (
          item,
        ) => {
          if (
            !item ||
            typeof item !==
              "object"
          ) {
            return null;
          }

          const candidate =
            item as {
              type?: unknown;
              code?: unknown;
              label?: unknown;
            };

          const type =
            typeof candidate.type ===
              "string"
              ? candidate.type
                  .trim()
                  .toUpperCase()
              : "";

          const code =
            typeof candidate.code ===
              "string"
              ? candidate.code
                  .trim()
              : "";

          const label =
            typeof candidate.label ===
              "string"
              ? candidate.label
                  .trim()
              : "";

          if (
            !["LIVE", "MOCK", "MINI"]
              .includes(
                type,
              ) ||
            !code ||
            !label
          ) {
            return null;
          }

          return {
            type,
            code:
              code.slice(
                0,
                120,
              ),
            label:
              label.slice(
                0,
                200,
              ),
          };
        },
      )
      .filter(
        (
          item,
        ): item is {
          type: string;
          code: string;
          label: string;
        } =>
          item !==
            null,
      );

  if (
    items.length ===
      0
  ) {
    return json(
      {
        error:
          "Selected test details are invalid.",
      },
      400,
    );
  }

  const safeEstimatedGems =
    Number.isFinite(
      estimatedGems,
    ) &&
    estimatedGems >=
      0
      ? Math.round(
          estimatedGems,
        )
      : 0;

  const code =
    requestCode();

  const rawToken =
    randomHex(
      32,
    );

  const tokenHash =
    await sha256(
      rawToken,
    );

  const liveTestCount =
    items.filter(
      (
        item,
      ) =>
        item.type ===
          "LIVE",
    ).length;

  await env.gyan_registry
    .prepare(
      `
      INSERT INTO education_shopping_cart_access_requests (
        request_code,
        email,
        program_code,
        batch_code,
        batch_label,
        access_test,
        access_results,
        access_ai_tips,
        selected_items_json,
        selected_item_count,
        live_test_count,
        estimated_gems,
        shop_code,
        status,
        verification_token_hash,
        verification_expires_at
      )
      VALUES (
        ?, ?, ?, ?, ?,
        ?, ?, ?, ?,
        ?, ?, ?, ?,
        'PENDING_EMAIL',
        ?,
        datetime('now', '+24 hours')
      )
      `,
    )
    .bind(
      code,
      email,
      program,
      batchCode,
      batchLabel,
      normalizedAccessTest
        ? 1
        : 0,
      normalizedAccessResults
        ? 1
        : 0,
      normalizedAccessAi
        ? 1
        : 0,
      JSON.stringify(
        items,
      ),
      items.length,
      liveTestCount,
      safeEstimatedGems,
      shopCode ||
        "GYAN_ONLINE",
      tokenHash,
    )
    .run();

  const verifyUrl =
    `${url.origin}/api/shopping-cart/verify?token=${encodeURIComponent(
      rawToken,
    )}`;

  const accessLabels =
    [
      normalizedAccessTest
        ? "Test access"
        : "",
      normalizedAccessResults
        ? "Results"
        : "",
      normalizedAccessAi
        ? "AI Tips"
        : "",
    ]
      .filter(
        Boolean,
      )
      .join(", ");

  const safeEmail =
    escapeHtml(
      email,
    );

  const safeProgram =
    escapeHtml(
      program,
    );

  const safeBatch =
    escapeHtml(
      batchLabel,
    );

  const safeCode =
    escapeHtml(
      code,
    );

  const safeAccess =
    escapeHtml(
      accessLabels,
    );

  const safeVerifyUrl =
    escapeHtml(
      verifyUrl,
    );

  const itemLines =
    items
      .map(
        (
          item,
        ) =>
          `<li>${escapeHtml(
            item.label,
          )}</li>`,
      )
      .join("");

  const textItems =
    items
      .map(
        (
          item,
        ) =>
          `- ${item.label}`,
      )
      .join("\n");

  const sent =
    await sendAccessRequestEmail(
      env,
      email,
      `Verify your GYAN access request · ${program} · ${batchLabel}`,
      `
      <div style="font-family:Arial,sans-serif;line-height:1.55;color:#17345c">
        <h2 style="margin:0 0 12px">GYAN Access Request</h2>
        <p>Hello,</p>
        <p>Please verify your email to confirm this access request.</p>

        <p>
          <a href="${safeVerifyUrl}"
             style="display:inline-block;padding:10px 14px;border-radius:8px;background:#17345c;color:#fff;text-decoration:none;font-weight:700">
            Verify email &amp; confirm request
          </a>
        </p>

        <p style="font-size:12px;color:#667085">
          This verification link expires in 24 hours.
        </p>

        <hr style="border:0;border-top:1px solid #e5e7eb">

        <p>
          <strong>Request:</strong> ${safeCode}<br>
          <strong>Email:</strong> ${safeEmail}<br>
          <strong>Program:</strong> ${safeProgram}<br>
          <strong>Batch:</strong> ${safeBatch}<br>
          <strong>Access:</strong> ${safeAccess}<br>
          <strong>Estimated total:</strong> 💎 ${safeEstimatedGems}
        </p>

        <p><strong>Selected items (${items.length})</strong></p>
        <ul>${itemLines}</ul>

        <p><strong>Payment options</strong></p>
        <ul>
          <li>India: UPI or NEFT</li>
          <li>United States: Zelle</li>
          <li>GYAN Gems: available directly in GYAN when your Gem balance is sufficient</li>
        </ul>

        <p>After verification, GYAN will provide the applicable payment details or confirm Gem access.</p>
      </div>
      `,
      [
        "GYAN Access Request",
        "",
        "Please verify your email to confirm this request:",
        verifyUrl,
        "",
        `Request: ${code}`,
        `Email: ${email}`,
        `Program: ${program}`,
        `Batch: ${batchLabel}`,
        `Access: ${accessLabels}`,
        `Estimated total: ${safeEstimatedGems} Gems`,
        "",
        `Selected items (${items.length}):`,
        textItems,
        "",
        "Payment options:",
        "- India: UPI or NEFT",
        "- United States: Zelle",
        "- GYAN Gems: available directly in GYAN when your Gem balance is sufficient",
        "",
        "After verification, GYAN will provide the applicable payment details or confirm Gem access.",
      ].join(
        "\n",
      ),
    );

  if (!sent) {
    await env.gyan_registry
      .prepare(
        `
        UPDATE education_shopping_cart_access_requests
        SET
          status = 'EMAIL_FAILED',
          updated_at = CURRENT_TIMESTAMP
        WHERE request_code = ?
        `,
      )
      .bind(
        code,
      )
      .run();

    return json(
      {
        error:
          "GYAN could not send the verification email. Please try again.",
      },
      503,
    );
  }

  await env.gyan_registry
    .prepare(
      `
      UPDATE education_shopping_cart_access_requests
      SET
        email_sent_at = CURRENT_TIMESTAMP,
        updated_at = CURRENT_TIMESTAMP
      WHERE request_code = ?
      `,
    )
    .bind(
      code,
    )
    .run();

  return json({
    sent:
      true,
    email,
    requestCode:
      code,
    verificationExpiresHours:
      24,
  });
}

async function verifyAccessRequest(
  env: ShoppingCartCatalogEnv,
  url: URL,
): Promise<Response> {
  const rawToken =
    (
      url.searchParams.get(
        "token",
      ) ??
      ""
    ).trim();

  if (!rawToken) {
    return new Response(
      "Verification link is invalid.",
      {
        status:
          400,
        headers: {
          "content-type":
            "text/plain; charset=utf-8",
        },
      },
    );
  }

  const tokenHash =
    await sha256(
      rawToken,
    );

  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          request_code,
          email,
          program_code,
          batch_label,
          status,
          verification_expires_at
        FROM education_shopping_cart_access_requests
        WHERE verification_token_hash = ?
        LIMIT 1
        `,
      )
      .bind(
        tokenHash,
      )
      .first<{
        request_code: string;
        email: string;
        program_code: string;
        batch_label: string;
        status: string;
        verification_expires_at: string;
      }>();

  if (!row) {
    return new Response(
      "This verification link is invalid or has already been replaced.",
      {
        status:
          404,
        headers: {
          "content-type":
            "text/plain; charset=utf-8",
        },
      },
    );
  }

  if (
    row.status ===
      "VERIFIED" ||
    row.status ===
      "CONTACTED" ||
    row.status ===
      "FULFILLED"
  ) {
    return new Response(
      `
      <!doctype html>
      <html>
        <head>
          <meta name="viewport" content="width=device-width,initial-scale=1">
          <title>GYAN request verified</title>
        </head>
        <body style="font-family:Arial,sans-serif;padding:24px;color:#17345c">
          <h2>Email already verified</h2>
          <p>Your GYAN access request <strong>${escapeHtml(
            row.request_code,
          )}</strong> is already confirmed.</p>
          <p><a href="/education">Return to GYAN Education</a></p>
        </body>
      </html>
      `,
      {
        headers: {
          "content-type":
            "text/html; charset=utf-8",
        },
      },
    );
  }

  const expiresMs =
    Date.parse(
      row.verification_expires_at
        .replace(
          " ",
          "T",
        ) +
        "Z",
    );

  if (
    !Number.isFinite(
      expiresMs,
    ) ||
    expiresMs <
      Date.now()
  ) {
    await env.gyan_registry
      .prepare(
        `
        UPDATE education_shopping_cart_access_requests
        SET
          status = 'EXPIRED',
          updated_at = CURRENT_TIMESTAMP
        WHERE request_code = ?
        `,
      )
      .bind(
        row.request_code,
      )
      .run();

    return new Response(
      `
      <!doctype html>
      <html>
        <head>
          <meta name="viewport" content="width=device-width,initial-scale=1">
          <title>GYAN verification expired</title>
        </head>
        <body style="font-family:Arial,sans-serif;padding:24px;color:#17345c">
          <h2>Verification link expired</h2>
          <p>Please return to GYAN and submit the access request again.</p>
          <p><a href="/education">Return to GYAN Education</a></p>
        </body>
      </html>
      `,
      {
        status:
          410,
        headers: {
          "content-type":
            "text/html; charset=utf-8",
        },
      },
    );
  }

  await env.gyan_registry
    .prepare(
      `
      UPDATE education_shopping_cart_access_requests
      SET
        status = 'VERIFIED',
        verified_at = CURRENT_TIMESTAMP,
        verification_token_hash = NULL,
        updated_at = CURRENT_TIMESTAMP
      WHERE request_code = ?
      `,
    )
    .bind(
      row.request_code,
    )
    .run();

  return new Response(
    `
    <!doctype html>
    <html>
      <head>
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>GYAN email verified</title>
      </head>
      <body style="font-family:Arial,sans-serif;padding:24px;color:#17345c">
        <h2>Email verified ✓</h2>
        <p>Thank you. Your GYAN access request <strong>${escapeHtml(
          row.request_code,
        )}</strong> is confirmed.</p>
        <p>
          ${escapeHtml(
            row.program_code,
          )} · ${escapeHtml(
            row.batch_label,
          )}
        </p>
        <p>GYAN will provide the applicable payment details or confirm Gem access.</p>
        <p><a href="/education">Return to GYAN Education</a></p>
      </body>
    </html>
    `,
    {
      headers: {
        "content-type":
          "text/html; charset=utf-8",
      },
    },
  );
}


async function purchaseWithGems(
  request: Request,
  env: ShoppingCartCatalogEnv,
): Promise<Response> {
  const owner =
    await currentGyanOwner(
      request,
      env,
    );

  if (!owner) {
    return json(
      {
        error:
          "Open your GYAN Card on this device before purchasing access.",
      },
      401,
    );
  }

  let body: {
    requestKey?: unknown;
    program?: unknown;
    batchCode?: unknown;
    access?: {
      test?: unknown;
      results?: unknown;
      aiTips?: unknown;
    };
    items?: unknown;
  };

  try {
    body =
      await request.json();
  } catch {
    return json(
      {
        error:
          "Invalid purchase request.",
      },
      400,
    );
  }

  const requestKey =
    typeof body.requestKey ===
      "string"
      ? body.requestKey
          .trim()
          .slice(
            0,
            120,
          )
      : "";

  if (!requestKey) {
    return json(
      {
        error:
          "Purchase request key is required.",
      },
      400,
    );
  }

  const priorPurchase =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          purchase_code,
          gem_cost,
          status
        FROM education_shopping_cart_purchases
        WHERE
          gyan_account_id = ?
          AND request_key = ?
        LIMIT 1
        `,
      )
      .bind(
        owner.accountId,
        requestKey,
      )
      .first<{
        purchase_code: string;
        gem_cost: number;
        status: string;
      }>();

  if (
    priorPurchase?.status ===
      "COMPLETED"
  ) {
    return json({
      purchased:
        true,
      alreadyPurchased:
        true,
      purchaseCode:
        priorPurchase.purchase_code,
      chargedGems:
        Number(
          priorPurchase.gem_cost,
        ),
      gemBalance:
        await currentGemBalance(
          env,
          owner.calendarAccessId,
        ),
      grantedItems:
        0,
    });
  }

  const requestedTest =
    body.access?.test ===
      true;

  const requestedResults =
    body.access?.results ===
      true;

  const requestedAiTips =
    body.access?.aiTips ===
      true;

  const accessAiTips =
    requestedAiTips;

  const accessResults =
    requestedResults ||
    accessAiTips;

  const accessTest =
    requestedTest ||
    accessResults;

  if (
    !accessTest
  ) {
    return json(
      {
        error:
          "Select at least one access type.",
      },
      400,
    );
  }

  if (
    !Array.isArray(
      body.items,
    ) ||
    body.items.length ===
      0 ||
    body.items.length >
      250
  ) {
    return json(
      {
        error:
          "Select at least one Live Test.",
      },
      400,
    );
  }

  const itemCodes =
    Array.from(
      new Set(
        body.items
          .map(
            (
              item,
            ) => {
              if (
                !item ||
                typeof item !==
                  "object"
              ) {
                return "";
              }

              const candidate =
                item as {
                  type?: unknown;
                  code?: unknown;
                };

              const type =
                typeof candidate.type ===
                  "string"
                  ? candidate.type
                      .trim()
                      .toUpperCase()
                  : "";

              const code =
                typeof candidate.code ===
                  "string"
                  ? candidate.code
                      .trim()
                      .toUpperCase()
                      .replace(
                        /^#/,
                        "",
                      )
                  : "";

              return type ===
                "LIVE"
                ? code
                : "";
            },
          )
          .filter(
            Boolean,
          ),
      ),
    );

  if (
    itemCodes.length !==
      body.items.length
  ) {
    return json(
      {
        error:
          "Direct Gem checkout currently supports Live Tests only. Remove Mock/Mini items or use other payment options.",
      },
      400,
    );
  }

  const placeholders =
    itemCodes
      .map(
        () =>
          "?",
      )
      .join(", ");

  const validRows =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          upper(public_code) AS public_code
        FROM education_live_tests
        WHERE upper(public_code) IN (${placeholders})
        `,
      )
      .bind(
        ...itemCodes,
      )
      .all<{
        public_code: string;
      }>();

  const validCodes =
    new Set(
      validRows.results.map(
        (
          row,
        ) =>
          row.public_code,
      ),
    );

  if (
    validCodes.size !==
      itemCodes.length
  ) {
    return json(
      {
        error:
          "One or more selected Live Tests are no longer available.",
      },
      409,
    );
  }

  const existingRows =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          item_code,
          access_test,
          access_results,
          access_ai_tips
        FROM education_shopping_cart_entitlements
        WHERE
          gyan_account_id = ?
          AND item_type = 'LIVE'
          AND item_code IN (${placeholders})
        `,
      )
      .bind(
        owner.accountId,
        ...itemCodes,
      )
      .all<{
        item_code: string;
        access_test: number;
        access_results: number;
        access_ai_tips: number;
      }>();

  const existing =
    new Map(
      existingRows.results.map(
        (
          row,
        ) => [
          row.item_code,
          row,
        ],
      ),
    );

  let gemCost =
    0;

  for (
    const code
    of itemCodes
  ) {
    const current =
      existing.get(
        code,
      );

    if (
      accessTest &&
      !current?.access_test
    ) {
      gemCost +=
        5;
    }

    if (
      accessResults &&
      !current?.access_results
    ) {
      gemCost +=
        20;
    }

    if (
      accessAiTips &&
      !current?.access_ai_tips
    ) {
      gemCost +=
        10;
    }
  }

  const currentBalance =
    await currentGemBalance(
      env,
      owner.calendarAccessId,
    );

  if (
    currentBalance <
      gemCost
  ) {
    return json(
      {
        error:
          `You need ${gemCost} Gems for this purchase.`,
        requiredGems:
          gemCost,
        gemBalance:
          currentBalance,
      },
      402,
    );
  }

  const purchaseCode =
    `GP-${new Date()
      .toISOString()
      .slice(0, 10)
      .replaceAll("-", "")}-${randomHex(4).toUpperCase()}`;

  const transactionReason =
    `SHOPPING_CART:${purchaseCode}`;

  if (
    gemCost ===
      0
  ) {
    const statements =
      itemCodes.map(
        (
          code,
        ) =>
          env.gyan_registry
            .prepare(
              `
              INSERT INTO education_shopping_cart_entitlements (
                gyan_account_id,
                item_type,
                item_code,
                access_test,
                access_results,
                access_ai_tips,
                source_purchase_code
              )
              VALUES (?, 'LIVE', ?, ?, ?, ?, ?)
              ON CONFLICT(gyan_account_id, item_type, item_code)
              DO UPDATE SET
                access_test = MAX(access_test, excluded.access_test),
                access_results = MAX(access_results, excluded.access_results),
                access_ai_tips = MAX(access_ai_tips, excluded.access_ai_tips),
                source_purchase_code = excluded.source_purchase_code,
                updated_at = CURRENT_TIMESTAMP
              `,
            )
            .bind(
              owner.accountId,
              code,
              accessTest ? 1 : 0,
              accessResults ? 1 : 0,
              accessAiTips ? 1 : 0,
              purchaseCode,
            ),
      );

    statements.unshift(
      env.gyan_registry
        .prepare(
          `
          INSERT INTO education_shopping_cart_purchases (
            purchase_code,
            request_key,
            gyan_account_id,
            calendar_access_id,
            program_code,
            batch_code,
            selected_items_json,
            access_test,
            access_results,
            access_ai_tips,
            gem_cost,
            gem_transaction_reason,
            status
          )
          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0, NULL, 'COMPLETED')
          `,
        )
        .bind(
          purchaseCode,
          requestKey,
          owner.accountId,
          owner.calendarAccessId,
          typeof body.program === "string" ? body.program : "",
          typeof body.batchCode === "string" ? body.batchCode : "",
          JSON.stringify(itemCodes),
          accessTest ? 1 : 0,
          accessResults ? 1 : 0,
          accessAiTips ? 1 : 0,
        ),
    );

    await env.gyan_registry.batch(
      statements,
    );

    return json({
      purchased:
        true,
      purchaseCode,
      chargedGems:
        0,
      gemBalance:
        currentBalance,
      grantedItems:
        itemCodes.length,
    });
  }

  const purchaseInsert =
    env.gyan_registry
      .prepare(
        `
        INSERT INTO education_shopping_cart_purchases (
          purchase_code,
          request_key,
          gyan_account_id,
          calendar_access_id,
          program_code,
          batch_code,
          selected_items_json,
          access_test,
          access_results,
          access_ai_tips,
          gem_cost,
          gem_transaction_reason,
          status
        )
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'PENDING')
        `,
      )
      .bind(
        purchaseCode,
        requestKey,
        owner.accountId,
        owner.calendarAccessId,
        typeof body.program === "string" ? body.program : "",
        typeof body.batchCode === "string" ? body.batchCode : "",
        JSON.stringify(itemCodes),
        accessTest ? 1 : 0,
        accessResults ? 1 : 0,
        accessAiTips ? 1 : 0,
        gemCost,
        transactionReason,
      );

  const chargeStatement =
    env.gyan_registry
      .prepare(
        `
        INSERT OR IGNORE INTO gem_transactions (
          calendar_access_id,
          amount,
          reason
        )
        SELECT
          ?,
          ?,
          ?
        WHERE
          (
            SELECT COALESCE(SUM(amount), 0)
            FROM gem_transactions
            WHERE calendar_access_id = ?
          ) >= ?
        `,
      )
      .bind(
        owner.calendarAccessId,
        -gemCost,
        transactionReason,
        owner.calendarAccessId,
        gemCost,
      );

  const entitlementStatements =
    itemCodes.map(
      (
        code,
      ) =>
        env.gyan_registry
          .prepare(
            `
            INSERT INTO education_shopping_cart_entitlements (
              gyan_account_id,
              item_type,
              item_code,
              access_test,
              access_results,
              access_ai_tips,
              source_purchase_code
            )
            SELECT
              ?,
              'LIVE',
              ?,
              ?,
              ?,
              ?,
              ?
            WHERE EXISTS (
              SELECT 1
              FROM gem_transactions
              WHERE
                calendar_access_id = ?
                AND reason = ?
            )
            ON CONFLICT(gyan_account_id, item_type, item_code)
            DO UPDATE SET
              access_test = MAX(access_test, excluded.access_test),
              access_results = MAX(access_results, excluded.access_results),
              access_ai_tips = MAX(access_ai_tips, excluded.access_ai_tips),
              source_purchase_code = excluded.source_purchase_code,
              updated_at = CURRENT_TIMESTAMP
            `,
          )
          .bind(
            owner.accountId,
            code,
            accessTest ? 1 : 0,
            accessResults ? 1 : 0,
            accessAiTips ? 1 : 0,
            purchaseCode,
            owner.calendarAccessId,
            transactionReason,
          ),
    );

  const results =
    await env.gyan_registry.batch([
      purchaseInsert,
      chargeStatement,
      ...entitlementStatements,
    ]);

  const charged =
    Number(
      results[1]?.meta?.changes ??
      0,
    ) >
    0;

  if (!charged) {
    await env.gyan_registry
      .prepare(
        `
        UPDATE education_shopping_cart_purchases
        SET
          status = 'INSUFFICIENT_GEMS',
          updated_at = CURRENT_TIMESTAMP
        WHERE purchase_code = ?
        `,
      )
      .bind(
        purchaseCode,
      )
      .run();

    const balance =
      await currentGemBalance(
        env,
        owner.calendarAccessId,
      );

    return json(
      {
        error:
          `You need ${gemCost} Gems for this purchase.`,
        requiredGems:
          gemCost,
        gemBalance:
          balance,
      },
      402,
    );
  }

  await env.gyan_registry
    .prepare(
      `
      UPDATE education_shopping_cart_purchases
      SET
        status = 'COMPLETED',
        completed_at = CURRENT_TIMESTAMP,
        updated_at = CURRENT_TIMESTAMP
      WHERE purchase_code = ?
      `,
    )
    .bind(
      purchaseCode,
    )
    .run();

  return json({
    purchased:
      true,
    purchaseCode,
    chargedGems:
      gemCost,
    gemBalance:
      await currentGemBalance(
        env,
        owner.calendarAccessId,
      ),
    grantedItems:
      itemCodes.length,
  });
}


async function activeBatches(
  env: ShoppingCartCatalogEnv,
): Promise<BatchRow[]> {
  const result =
    await env.gyan_registry
      .prepare(`
        SELECT
          batch_code,
          label,
          start_date,
          end_date,
          sort_order
        FROM education_live_test_batches
        WHERE active = 1
        ORDER BY sort_order, start_date
      `)
      .all<BatchRow>();

  return result.results;
}

function currentAndNext(
  batches: BatchRow[],
  today: string,
): {
  current: BatchRow | null;
  next: BatchRow | null;
} {
  const currentIndex =
    batches.findIndex(
      (batch) =>
        batch.start_date <= today &&
        batch.end_date >= today,
    );

  if (currentIndex >= 0) {
    return {
      current:
        batches[currentIndex] ?? null,
      next:
        batches[currentIndex + 1] ?? null,
    };
  }

  const futureIndex =
    batches.findIndex(
      (batch) =>
        batch.start_date > today,
    );

  return {
    current:
      futureIndex >= 0
        ? batches[futureIndex] ?? null
        : batches[batches.length - 1] ?? null,
    next:
      futureIndex >= 0
        ? batches[futureIndex + 1] ?? null
        : null,
  };
}

async function activePrograms(
  env: ShoppingCartCatalogEnv,
): Promise<string[]> {
  const result =
    await env.gyan_registry
      .prepare(`
        SELECT program_code
        FROM education_live_test_policy
        WHERE active = 1
        ORDER BY
          CASE program_code
            WHEN 'JEE' THEN 1
            WHEN 'NEET' THEN 2
            WHEN 'SAT' THEN 3
            WHEN 'GRE' THEN 4
            ELSE 100
          END,
          program_code
      `)
      .all<ProgramRow>();

  return result.results.map(
    (row) =>
      row.program_code
        .trim()
        .toUpperCase(),
  );
}

async function liveCatalog(
  env: ShoppingCartCatalogEnv,
  program: string,
  batchCode: string,
): Promise<LiveRow[]> {
  const result =
    await env.gyan_registry
      .prepare(`
        SELECT
          public_code,
          source_schedule_date,
          test_fraction_percent,
          entry_gem_cost,
          report_gem_cost,
          status
        FROM education_live_tests
        WHERE
          program_code = ?
          AND batch_code = ?
          AND event_kind = 'BATCH_AUTO'
          AND status <> 'CANCELLED'
        ORDER BY
          source_schedule_date,
          series_number,
          id
      `)
      .bind(
        program,
        batchCode,
      )
      .all<LiveRow>();

  return result.results;
}

async function mockCatalog(
  env: ShoppingCartCatalogEnv,
  program: string,
): Promise<MockRow[]> {
  const result =
    await env.gyan_registry
      .prepare(`
        SELECT
          m.id,
          m.test_kind,
          m.test_code,
          m.published,
          COUNT(mtq.question_id) AS question_count
        FROM education_mock_tests m
        LEFT JOIN education_mock_test_questions mtq
          ON mtq.mock_test_id = m.id
        WHERE m.program_code = ?
        GROUP BY
          m.id,
          m.test_kind,
          m.test_code,
          m.published
        ORDER BY
          CASE m.test_kind
            WHEN 'FULL' THEN 1
            WHEN 'MINI' THEN 2
            ELSE 100
          END,
          m.id
      `)
      .bind(program)
      .all<MockRow>();

  return result.results;
}

export async function handleShoppingCartCatalogRoute(
  request: Request,
  env: ShoppingCartCatalogEnv,
  url: URL,
): Promise<Response | null> {
  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/shopping-cart/contact"
  ) {
    return createAccessRequest(
      request,
      env,
      url,
    );
  }

  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/shopping-cart/purchase"
  ) {
    return purchaseWithGems(
      request,
      env,
    );
  }

  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/shopping-cart/verify"
  ) {
    return verifyAccessRequest(
      env,
      url,
    );
  }

  if (
    request.method !==
      "GET" ||
    url.pathname !==
      "/api/shopping-cart/catalog"
  ) {
    return null;
  }

  const batches =
    await activeBatches(env);

  const programs =
    await activePrograms(env);

  const choices =
    currentAndNext(
      batches,
      utcDate(),
    );

  const requestedProgram =
    (
      url.searchParams.get(
        "program",
      ) ??
      programs[0] ??
      ""
    )
      .trim()
      .toUpperCase();

  if (
    !requestedProgram ||
    !programs.includes(
      requestedProgram,
    )
  ) {
    return json(
      {
        error:
          "Select an active education program.",
        programs,
      },
      400,
    );
  }

  const requestedBatch =
    (
      url.searchParams.get(
        "batch",
      ) ??
      choices.current?.batch_code ??
      ""
    )
      .trim()
      .toUpperCase();

  const selectedBatch =
    batches.find(
      (batch) =>
        batch.batch_code ===
          requestedBatch,
    ) ??
    null;

  if (!selectedBatch) {
    return json(
      {
        error:
          "Select a valid Live Test batch.",
      },
      400,
    );
  }

  const [
    liveRows,
    mockRows,
  ] =
    await Promise.all([
      liveCatalog(
        env,
        requestedProgram,
        selectedBatch.batch_code,
      ),
      mockCatalog(
        env,
        requestedProgram,
      ),
    ]);

  const liveTests =
    liveRows.map(
      (row) => ({
        key:
          `LIVE:${row.public_code}`,
        type:
          "LIVE",
        code:
          row.public_code,
        label:
          `Live Test #${row.public_code}`,
        scheduleDate:
          row.source_schedule_date,
        fractionPercent:
          Number(
            row.test_fraction_percent ??
            0,
          ),
        available:
          true,
        gemCost:
          Math.max(
            0,
            Number(
              row.entry_gem_cost,
            ),
          ),
        reportGemCost:
          Math.max(
            0,
            Number(
              row.report_gem_cost,
            ),
          ),
      }),
    );

  const mockTests =
    mockRows
      .filter(
        (row) =>
          row.test_kind ===
            "FULL",
      )
      .map(
        (row) => ({
          key:
            `MOCK:${row.test_code}`,
          type:
            "MOCK",
          code:
            row.test_code,
          label:
            row.test_code,
          available:
            Number(
              row.published,
            ) === 1 &&
            Number(
              row.question_count,
            ) > 0,
          published:
            Number(
              row.published,
            ) === 1,
          questionCount:
            Number(
              row.question_count,
            ),
          accessMode:
            "OPEN",
          gemCost:
            null,
        }),
      );

  const miniTests =
    mockRows
      .filter(
        (row) =>
          row.test_kind ===
            "MINI",
      )
      .map(
        (row) => ({
          key:
            `MINI:${row.test_code}`,
          type:
            "MINI",
          code:
            row.test_code,
          label:
            row.test_code,
          available:
            Number(
              row.published,
            ) === 1 &&
            Number(
              row.question_count,
            ) > 0,
          published:
            Number(
              row.published,
            ) === 1,
          questionCount:
            Number(
              row.question_count,
            ),
          accessMode:
            "OPEN",
          gemCost:
            null,
        }),
      );

  return json({
    phase:
      1,

    programs,

    batches: {
      current:
        choices.current,
      next:
        choices.next,
      selected:
        selectedBatch,
    },

    selectedProgram:
      requestedProgram,

    liveTests,
    mockTests,
    miniTests,

    pricing: {
      live:
        "DB_ENTRY_GEM_COST",
      mock:
        "PHASE_2",
      mini:
        "PHASE_2",
      note:
        "Phase 1 totals use existing Live Test entry Gem costs. Mock/Mini package pricing is intentionally deferred to Phase 2.",
    },
  });
}
