/*
 * worker/liveTestRestore.ts
 *
 * Read-only historical Live Test restore route.
 *
 * It never creates a Live Test entry and never writes a Gem transaction.
 * This makes Activity -> past Live Test safe to open.
 */

type LiveTestRestoreEnv =
  Env;


function json(
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


function cookieValue(
  request:
    Request,

  name:
    string,
): string | null {
  const raw =
    request.headers.get(
      "cookie",
    );

  if (!raw) {
    return null;
  }

  for (
    const part
    of raw.split(";")
  ) {
    const [
      key,
      ...rest
    ] =
      part
        .trim()
        .split("=");

    if (
      key ===
      name
    ) {
      return decodeURIComponent(
        rest.join("="),
      );
    }
  }

  return null;
}


function bytesToHex(
  bytes:
    Uint8Array,
): string {
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
  value:
    string,
): Promise<string> {
  const digest =
    await crypto.subtle.digest(
      "SHA-256",

      new TextEncoder()
        .encode(
          value,
        ),
    );

  return bytesToHex(
    new Uint8Array(
      digest,
    ),
  );
}


async function currentGyanOwner(
  request:
    Request,

  env:
    LiveTestRestoreEnv,
): Promise<{
  accountId:
    number;

  calendarAccessId:
    number;
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
          ON l.gyan_account_id =
             s.account_id

        WHERE
          s.secret_hash = ?

        LIMIT 1
        `,
      )
      .bind(
        secretHash,
      )
      .first<{
        account_id:
          number;

        calendar_access_id:
          number;
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


export async function handleLiveTestRestoreRoute(
  request:
    Request,

  env:
    LiveTestRestoreEnv,

  url:
    URL,
): Promise<Response | null> {
  if (
    request.method !==
      "GET" ||
    url.pathname !==
      "/api/education/live-tests/restore"
  ) {
    return null;
  }

  const code =
    (
      url.searchParams
        .get(
          "code",
        ) ??
      ""
    )
      .trim()
      .toUpperCase()
      .replace(
        /^#/,
        "",
      );

  if (!code) {
    return json(
      {
        error:
          "Live Test code is required.",
      },
      400,
    );
  }

  const owner =
    await currentGyanOwner(
      request,
      env,
    );

  if (!owner) {
    return json(
      {
        found:
          false,

        error:
          "Open your GYAN Card on this device to view your Live Test history.",
      },
      401,
    );
  }

  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          lt.id AS live_test_id,
          lt.public_code,
          lt.program_code,
          lt.report_gem_cost,

          le.id AS entry_id,
          le.entered_at,
          le.submitted_at,
          le.attempt_id,
          le.report_unlocked_at,

          a.question_count,
          a.answered_count,
          a.correct_count,
          a.incorrect_count,
          a.unanswered_count

        FROM education_live_tests lt

        LEFT JOIN education_live_entries le
          ON le.live_test_id =
             lt.id
         AND le.participant_type =
             'GYAN'
         AND le.participant_key =
             ?

        LEFT JOIN education_live_attempts a
          ON a.id =
             le.attempt_id

        WHERE
          UPPER(
            lt.public_code
          ) = ?

        LIMIT 1
        `,
      )
      .bind(
        String(
          owner.accountId,
        ),
        code,
      )
      .first<{
        live_test_id:
          number;

        public_code:
          string;

        program_code:
          string;

        report_gem_cost:
          number;

        entry_id:
          number | null;

        entered_at:
          string | null;

        submitted_at:
          string | null;

        attempt_id:
          number | null;

        report_unlocked_at:
          string | null;

        question_count:
          number | null;

        answered_count:
          number | null;

        correct_count:
          number | null;

        incorrect_count:
          number | null;

        unanswered_count:
          number | null;
      }>();

  if (!row) {
    return json(
      {
        found:
          false,

        error:
          "Live Test not found.",
      },
      404,
    );
  }

  if (
    !row.entry_id
  ) {
    return json(
      {
        found:
          false,

        code:
          row.public_code,

        program:
          row.program_code,

        reportGemCost:
          Number(
            row.report_gem_cost,
          ),
      },
      404,
    );
  }

  /*
   * report_unlocked_at is the normal durable flag.
   *
   * The Gem ledger is also checked as a recovery path for older rows
   * where the 15-Gem transaction exists but the timestamp was not saved.
   */
  const reportReason =
    `LIVE_TEST_REPORT:${row.public_code}`;

  const priorReportCharge =
    await env.gyan_registry
      .prepare(
        `
        SELECT id

        FROM gem_transactions

        WHERE
          calendar_access_id = ?
          AND reason = ?

        LIMIT 1
        `,
      )
      .bind(
        owner.calendarAccessId,
        reportReason,
      )
      .first<{
        id:
          number;
      }>();

  const reportUnlocked =
    Boolean(
      row.report_unlocked_at,
    ) ||
    Boolean(
      priorReportCharge,
    );

  return json({
    found:
      true,

    code:
      row.public_code,

    program:
      row.program_code,

    entryId:
      Number(
        row.entry_id,
      ),

    enteredAt:
      row.entered_at,

    submitted:
      Boolean(
        row.submitted_at ||
        row.attempt_id,
      ),

    submittedAt:
      row.submitted_at,

    attemptId:
      row.attempt_id,

    reportUnlocked,

    reportGemCost:
      Number(
        row.report_gem_cost,
      ),

    questionCount:
      Number(
        row.question_count ??
        0,
      ),

    answeredCount:
      Number(
        row.answered_count ??
        0,
      ),

    correctCount:
      row.correct_count ===
        null
        ? null
        : Number(
            row.correct_count,
          ),

    incorrectCount:
      row.incorrect_count ===
        null
        ? null
        : Number(
            row.incorrect_count,
          ),

    unansweredCount:
      row.unanswered_count ===
        null
        ? null
        : Number(
            row.unanswered_count,
          ),
  });
}
