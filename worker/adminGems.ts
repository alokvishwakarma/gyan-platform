import {
  getAdminSession,
} from "./adminAuth";


type AdminGemsEnv =
  Parameters<
    typeof getAdminSession
  >[1];


function jsonResponse(
  body:
    unknown,

  status =
    200,
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


type AccountRow = {
  id:
    number;

  code:
    string;

  display_name:
    string;

  calendar_access_id:
    number | null;
};


export async function handleAdminGemsRoute(
  request:
    Request,

  env:
    AdminGemsEnv,

  url:
    URL,
): Promise<Response | null> {
  if (
    url.pathname !==
      "/api/admin/gems/add"
  ) {
    return null;
  }

  if (
    request.method !==
      "POST"
  ) {
    return jsonResponse(
      {
        error:
          "Method not allowed.",
      },
      405,
    );
  }

  const session =
    await getAdminSession(
      request,
      env,
    );

  if (!session) {
    return jsonResponse(
      {
        error:
          "Administrator authentication is required.",
      },
      401,
    );
  }

  let body: {
    recipient?:
      unknown;

    amount?:
      unknown;
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

  const recipient =
    typeof body.recipient ===
      "string"
      ? body.recipient
          .trim()
      : "";

  const amount =
    typeof body.amount ===
      "number"
      ? body.amount
      : Number(
          body.amount,
        );

  if (!recipient) {
    return jsonResponse(
      {
        error:
          "GYAN code or name is required.",
      },
      400,
    );
  }

  if (
    !Number.isInteger(
      amount,
    ) ||
    amount <
      1 ||
    amount >
      9999
  ) {
    return jsonResponse(
      {
        error:
          "Gems must be a whole number from 1 to 9,999.",
      },
      400,
    );
  }

  /*
   * Prefer an exact GYAN code match. If there is no code match,
   * accept an exact display-name match, case-insensitively.
   */
  const codeMatch =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          ga.id,
          ga.code,
          ga.display_name,
          gacl.calendar_access_id

        FROM gyan_accounts ga

        LEFT JOIN gyan_account_calendar_links gacl
          ON gacl.gyan_account_id =
             ga.id

        WHERE
          UPPER(ga.code) =
          UPPER(?)

        LIMIT 1
        `,
      )
      .bind(
        recipient,
      )
      .first<AccountRow>();

  let account =
    codeMatch;

  if (!account) {
    const matches =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            ga.id,
            ga.code,
            ga.display_name,
            gacl.calendar_access_id

          FROM gyan_accounts ga

          LEFT JOIN gyan_account_calendar_links gacl
            ON gacl.gyan_account_id =
               ga.id

          WHERE
            LOWER(ga.display_name) =
            LOWER(?)

          ORDER BY ga.id
          LIMIT 2
          `,
        )
        .bind(
          recipient,
        )
        .all<AccountRow>();

    if (
      matches.results.length >
      1
    ) {
      return jsonResponse(
        {
          error:
            "More than one GYAN account has that name. Please enter the GYAN code instead.",
        },
        409,
      );
    }

    account =
      matches.results[0] ??
      null;
  }

  if (!account) {
    return jsonResponse(
      {
        error:
          "GYAN account was not found.",
      },
      404,
    );
  }

  if (
    !account.calendar_access_id
  ) {
    return jsonResponse(
      {
        error:
          `${account.display_name} [${account.code}] does not have a Gem ledger yet.`,
      },
      409,
    );
  }

  /*
   * The reason must be unique per grant because several Gem award
   * paths use a reason as an idempotency key.
   */
  const reason =
    `ADMIN_GRANT:${Date.now()}:${crypto.randomUUID()}`;

  await env.gyan_registry
    .prepare(
      `
      INSERT INTO gem_transactions (
        calendar_access_id,
        amount,
        reason
      )
      VALUES (?, ?, ?)
      `,
    )
    .bind(
      account.calendar_access_id,
      amount,
      reason,
    )
    .run();

  const balanceRow =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          COALESCE(
            SUM(amount),
            0
          ) AS total

        FROM gem_transactions

        WHERE
          calendar_access_id = ?
        `,
      )
      .bind(
        account.calendar_access_id,
      )
      .first<{
        total:
          number;
      }>();

  return jsonResponse({
    added:
      amount,

    balance:
      Number(
        balanceRow?.total ??
        0,
      ),

    account: {
      code:
        account.code,

      displayName:
        account.display_name,
    },
  });
}
