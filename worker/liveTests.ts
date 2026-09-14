import {
  handleShoppingCartCatalogRoute,
} from "./shoppingCartCatalog";

import {
  getAdminSession,
} from "./adminAuth";

/*
 * worker/liveTests.ts
 *
 * GYAN Live Tests — phase 1
 *
 * Routes:
 *   GET  /api/education/live-tests
 *   POST /api/education/live-tests/enter
 *
 * This phase intentionally does NOT:
 *   - generate/fetch the frozen live question set
 *   - submit attempts
 *   - unlock the detailed report
 *   - run synthetic participants
 *
 * It establishes the public event/status API and the idempotent
 * real-GYAN 💎5 entry path first.
 */

export type LiveTestsEnv =
  Env;


type LiveTestState =
  | "NOT_STARTED"
  | "OPEN"
  | "OVER"
  | "CANCELLED";


type LiveTestRow = {
  id: number;

  series_number:
    number;

  series_suffix:
    string;

  public_code:
    string;

  program_code:
    string;

  starts_at_utc:
    string;

  schedule_timezone:
    string;

  duration_minutes:
    number;

  entry_gem_cost:
    number;

  report_gem_cost:
    number;

  status:
    string;

  test_fraction_percent:
    number | null;

  event_kind:
    string | null;

  source_schedule_date:
    string | null;

  total_participants:
    number;

  human_participants:
    number;

  synthetic_participants:
    number;
};


function liveJson(
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



function parseUtcTimestamp(
  value:
    string,
): number {
  const trimmed =
    value.trim();

  /*
   * D1 stores timestamps such as:
   *   2026-09-09 15:45:00
   *
   * Date.parse() may interpret that form as browser/Worker local time.
   * Live Test timestamps are UTC, so normalize explicitly to ISO UTC.
   */
  const normalized =
    /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$/
      .test(
        trimmed,
      )
      ? `${trimmed.replace(" ", "T")}Z`
      : (
          /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$/
            .test(
              trimmed,
            )
            ? `${trimmed}Z`
            : trimmed
        );

  return Date.parse(
    normalized,
  );
}



function isAdminTest(
  row:
    Pick<
      LiveTestRow,
      | "public_code"
      | "event_kind"
    >,
): boolean {
  return (
    row.public_code ===
      "ADMIN101" ||
    row.event_kind ===
      "ADMIN_TEST"
  );
}


async function requireAdminForTest(
  request:
    Request,

  env:
    LiveTestsEnv,

  test:
    Pick<
      LiveTestRow,
      | "public_code"
      | "event_kind"
    >,
): Promise<Response | null> {
  if (
    !isAdminTest(
      test,
    )
  ) {
    return null;
  }

  const session =
    await getAdminSession(
      request,
      env,
    );

  if (
    session
  ) {
    return null;
  }

  return liveJson(
    {
      error:
        "Administrator authentication is required.",
    },
    401,
  );
}


function effectiveLiveWindow(
  row:
    Pick<
      LiveTestRow,
      | "public_code"
      | "event_kind"
      | "starts_at_utc"
      | "duration_minutes"
    >,

  nowMs =
    Date.now(),
): {
  startMs:
    number;

  endMs:
    number;
} {
  if (
    isAdminTest(
      row,
    )
  ) {
    return {
      startMs:
        nowMs -
        15 *
        60 *
        1000,

      endMs:
        nowMs +
        15 *
        60 *
        1000,
    };
  }

  const startMs =
    parseUtcTimestamp(
      row.starts_at_utc,
    );

  return {
    startMs,

    endMs:
      startMs +
      (
        Math.max(
          1,
          row.duration_minutes,
        ) *
        60 *
        1000
      ),
  };
}


function liveTestState(
  row:
    Pick<
      LiveTestRow,
      | "starts_at_utc"
      | "duration_minutes"
      | "status"
    >,

  nowMs =
    Date.now(),
): LiveTestState {
  if (
    row.status ===
      "CANCELLED"
  ) {
    return "CANCELLED";
  }

  const {
    startMs,
    endMs,
  } =
    effectiveLiveWindow(
      row as LiveTestRow,
      nowMs,
    );

  if (
    !Number.isFinite(
      startMs,
    ) ||
    !Number.isFinite(
      endMs,
    )
  ) {
    return "NOT_STARTED";
  }

  if (
    nowMs <
    startMs
  ) {
    return "NOT_STARTED";
  }

  if (
    nowMs <
    endMs
  ) {
    return "OPEN";
  }

  return "OVER";
}


async function currentGyanOwner(
  request:
    Request,

  env:
    LiveTestsEnv,
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


async function shoppingCartLiveEntitlement(
  env:
    LiveTestsEnv,

  accountId:
    number,

  publicCode:
    string,
): Promise<{
  test: boolean;
  results: boolean;
  aiTips: boolean;
}> {
  try {
    const row =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            access_test,
            access_results,
            access_ai_tips
          FROM education_shopping_cart_entitlements
          WHERE
            gyan_account_id = ?
            AND item_type = 'LIVE'
            AND upper(item_code) = upper(?)
          LIMIT 1
          `,
        )
        .bind(
          accountId,
          publicCode,
        )
        .first<{
          access_test: number;
          access_results: number;
          access_ai_tips: number;
        }>();

    return {
      test:
        Boolean(
          row?.access_test,
        ),
      results:
        Boolean(
          row?.access_results,
        ),
      aiTips:
        Boolean(
          row?.access_ai_tips,
        ),
    };
  } catch {
    /*
     * Backward-compatible while migration 0163 is not present.
     */
    return {
      test:
        false,
      results:
        false,
      aiTips:
        false,
    };
  }
}


async function gemBalance(
  env:
    LiveTestsEnv,

  calendarAccessId:
    number,
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
        WHERE
          calendar_access_id = ?
        `,
      )
      .bind(
        calendarAccessId,
      )
      .first<{
        balance:
          number;
      }>();

  return Number(
    row?.balance ??
    0,
  );
}


function localIsoDate(
  timeZone:
    string,

  nowMs:
    number,
): string {
  try {
    const parts =
      new Intl.DateTimeFormat(
        "en-US",
        {
          timeZone:
            timeZone ||
            "UTC",

          year:
            "numeric",

          month:
            "2-digit",

          day:
            "2-digit",
        },
      ).formatToParts(
        new Date(
          nowMs,
        ),
      );

    const year =
      parts.find(
        (
          part,
        ) =>
          part.type ===
          "year",
      )?.value;

    const month =
      parts.find(
        (
          part,
        ) =>
          part.type ===
          "month",
      )?.value;

    const day =
      parts.find(
        (
          part,
        ) =>
          part.type ===
          "day",
      )?.value;

    if (
      year &&
      month &&
      day
    ) {
      return `${year}-${month}-${day}`;
    }
  } catch {
    // Fall through to UTC below.
  }

  return new Date(
    nowMs,
  )
    .toISOString()
    .slice(
      0,
      10,
    );
}


async function listLiveTests(
  env:
    LiveTestsEnv,

  url:
    URL,
): Promise<Response> {
  /*
   * Education home shows today's Live Tests.
   *
   * JEE / NEET remain anchored to Asia/Kolkata.
   *
   * SAT is selected using the viewer timezone supplied by the browser.
   * This is necessary because the U.S. spans multiple timezones:
   * a test can still belong to "today" in California after New York
   * has crossed midnight.
   *
   * Ended tests stay visible for the rest of the viewer's local day so
   * learners can open the historical test and purchase question access.
   */
  const rows =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          lt.id,
          lt.series_number,
          lt.series_suffix,
          lt.public_code,
          lt.program_code,
          lt.starts_at_utc,
          lt.schedule_timezone,
          lt.duration_minutes,
          lt.entry_gem_cost,
          lt.report_gem_cost,
          lt.status,
          lt.test_fraction_percent,
          lt.event_kind,
          lt.source_schedule_date,

          COUNT(
            le.id
          ) AS total_participants,

          SUM(
            CASE
              WHEN le.participant_type =
                'GYAN'
              THEN 1
              ELSE 0
            END
          ) AS human_participants,

          SUM(
            CASE
              WHEN le.participant_type =
                'SYNTHETIC'
              THEN 1
              ELSE 0
            END
          ) AS synthetic_participants

        FROM education_live_tests lt

        LEFT JOIN education_live_entries le
          ON le.live_test_id =
             lt.id

        WHERE
          COALESCE(
            lt.event_kind,
            'WEEKDAY'
          ) <> 'ADMIN_TEST'

          AND datetime(
            lt.starts_at_utc
          ) >=
            datetime(
              'now',
              '-1 day'
            )

          AND datetime(
            lt.starts_at_utc
          ) <
            datetime(
              'now',
              '+2 days'
            )

        GROUP BY
          lt.id

        ORDER BY
          datetime(
            lt.starts_at_utc
          ),
          lt.id
        `,
      )
      .all<LiveTestRow>();

  const nowMs =
    Date.now();

  const requestedTimezone =
    (
      url.searchParams.get(
        "timezone",
      ) ??
      ""
    ).trim();

  const viewerTimezone =
    (() => {
      if (
        !requestedTimezone
      ) {
        return "America/Los_Angeles";
      }

      try {
        new Intl.DateTimeFormat(
          "en-US",
          {
            timeZone:
              requestedTimezone,
          },
        ).format(
          new Date(
            nowMs,
          ),
        );

        return requestedTimezone;
      } catch {
        return "America/Los_Angeles";
      }
    })();

  const todayPending =
    rows.results.filter(
      (
        row,
      ) => {
        const state =
          liveTestState(
            row,
            nowMs,
          );

        if (
          state ===
            "CANCELLED"
        ) {
          return false;
        }

        if (
          row.program_code ===
            "SAT"
        ) {
          const startMs =
            parseUtcTimestamp(
              row.starts_at_utc,
            );

          return (
            Number.isFinite(
              startMs,
            ) &&
            localIsoDate(
              viewerTimezone,
              startMs,
            ) ===
              localIsoDate(
                viewerTimezone,
                nowMs,
              )
          );
        }

        const indiaTimezone =
          "Asia/Kolkata";

        const scheduleDate =
          row.source_schedule_date ??
          localIsoDate(
            indiaTimezone,
            parseUtcTimestamp(
              row.starts_at_utc,
            ),
          );

        return (
          scheduleDate ===
            localIsoDate(
              indiaTimezone,
              nowMs,
            )
        );
      },
    );

  return liveJson({
    liveTests:
      todayPending.map(
        (
          row,
        ) => ({
          id:
            Number(
              row.id,
            ),

          number:
            Number(
              row.series_number,
            ),

          suffix:
            row.series_suffix,

          code:
            row.public_code,

          program:
            row.program_code,

          startsAt:
            row.starts_at_utc,

          scheduleTimezone:
            row.schedule_timezone,

          durationMinutes:
            Number(
              row.duration_minutes,
            ),

          entryGemCost:
            Number(
              row.entry_gem_cost,
            ),

          reportGemCost:
            Number(
              row.report_gem_cost,
            ),

          fractionPercent:
            Number(
              row.test_fraction_percent ??
              10,
            ),

          eventKind:
            row.event_kind ??
            "WEEKDAY",

          scheduleDate:
            row.source_schedule_date,

          state:
            liveTestState(
              row,
              nowMs,
            ),

          participants:
            Number(
              row.total_participants ??
              0,
            ),

          hearts:
            Number(
              row.human_participants ??
              0,
            ),

          bolts:
            Number(
              row.synthetic_participants ??
              0,
            ),
        }),
      ),
  });
}

async function enterLiveTest(
  request:
    Request,

  env:
    LiveTestsEnv,
): Promise<Response> {
  let body:
    {
      code?:
        unknown;
    };

  try {
    body =
      await request.json() as {
        code?:
          unknown;
      };
  } catch {
    return liveJson(
      {
        error:
          "Invalid request body.",
      },

      400,
    );
  }

  const code =
    typeof body.code ===
      "string"
      ? body.code
          .trim()
          .toUpperCase()
          .replace(
            /^#/,
            "",
          )
      : "";

  if (!code) {
    return liveJson(
      {
        error:
          "Live test code is required.",
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
    return liveJson(
      {
        error:
          "Open your GYAN Card on this device before entering the Live Test.",
      },

      401,
    );
  }

  const test =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          series_number,
          series_suffix,
          public_code,
          program_code,
          starts_at_utc,
          schedule_timezone,
          duration_minutes,
          entry_gem_cost,
          report_gem_cost,
          status,
          test_fraction_percent,
          event_kind,
          source_schedule_date,

          0 AS total_participants,
          0 AS human_participants,
          0 AS synthetic_participants

        FROM education_live_tests

        WHERE
          upper(
            public_code
          ) = ?

        LIMIT 1
        `,
      )
      .bind(
        code,
      )
      .first<LiveTestRow>();

  if (!test) {
    return liveJson(
      {
        error:
          "Live Test not found.",
      },

      404,
    );
  }

  const adminError =
    await requireAdminForTest(
      request,
      env,
      test,
    );

  if (
    adminError
  ) {
    return adminError;
  }


  const state =
    liveTestState(
      test,
    );

  if (
    state ===
      "NOT_STARTED"
  ) {
    return liveJson(
      {
        state,

        error:
          "Test not started.",
      },

      409,
    );
  }

  if (
    state ===
      "OVER"
  ) {
    return liveJson(
      {
        state,

        error:
          "Test over.",
      },

      409,
    );
  }

  if (
    state ===
      "CANCELLED"
  ) {
    return liveJson(
      {
        state,

        error:
          "This Live Test was cancelled.",
      },

      409,
    );
  }

  /*
   * First check the Live entry itself.
   *
   * Refresh/retry after a successful entry returns the existing
   * record and therefore never charges again.
   */
  const existingEntry =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          entered_at,
          submitted_at,
          attempt_id,
          report_unlocked_at
        FROM education_live_entries

        WHERE
          live_test_id = ?
          AND participant_type =
            'GYAN'
          AND participant_key = ?

        LIMIT 1
        `,
      )
      .bind(
        test.id,
        String(
          owner.accountId,
        ),
      )
      .first<{
        id:
          number;

        entered_at:
          string;

        submitted_at:
          string | null;

        attempt_id:
          number | null;

        report_unlocked_at:
          string | null;
      }>();

  if (existingEntry) {
    return liveJson({
      entered:
        true,

      alreadyEntered:
        true,

      state:
        "OPEN",

      liveTestId:
        Number(
          test.id,
        ),

      code:
        test.public_code,

      entryId:
        Number(
          existingEntry.id,
        ),

      enteredAt:
        existingEntry
          .entered_at,

      submitted:
        Boolean(
          existingEntry
            .submitted_at ||
          existingEntry
            .attempt_id,
        ),

      attemptId:
        existingEntry
          .attempt_id,

      reportUnlocked:
        Boolean(
          existingEntry
            .report_unlocked_at,
        ),

      reportGemCost:
        Number(
          test.report_gem_cost,
        ),

      gemBalance:
        await gemBalance(
          env,
          owner.calendarAccessId,
        ),
    });
  }

  const entryCost =
    Math.max(
      0,
      Number(
        test.entry_gem_cost,
      ),
    );

  const purchasedAccess =
    await shoppingCartLiveEntitlement(
      env,
      owner.accountId,
      test.public_code,
    );

  const transactionReason =
    `LIVE_TEST_ENTRY:${test.public_code}`;

  const entryTransactionKey =
    `${transactionReason}:${owner.accountId}`;

  /*
   * ShoppingCart Test access is prepaid access.
   * Otherwise retain the existing idempotent Live Test Gem charge.
   */
  let charged =
    false;

  if (
    !purchasedAccess.test
  ) {
    const charge =
      await env.gyan_registry
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
              SELECT
                COALESCE(
                  SUM(amount),
                  0
                )
              FROM gem_transactions
              WHERE
                calendar_access_id = ?
            ) >= ?
          `,
        )
        .bind(
          owner.calendarAccessId,
          -entryCost,
          transactionReason,
          owner.calendarAccessId,
          entryCost,
        )
        .run();

    charged =
      Number(
        charge.meta?.changes ??
        0,
      ) > 0;

    if (!charged) {
      /*
       * Distinguish a harmless retry from insufficient Gems.
       */
      const priorCharge =
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
            transactionReason,
          )
          .first<{
            id:
              number;
          }>();

      if (!priorCharge) {
        return liveJson(
          {
            error:
              `You need ${entryCost} Gems to enter this Live Test.`,

            requiredGems:
              entryCost,

            gemBalance:
              await gemBalance(
                env,
                owner.calendarAccessId,
              ),
          },

          402,
        );
      }
    }
  }

  try {
    await env.gyan_registry
      .prepare(
        `
        INSERT OR IGNORE INTO education_live_entries (
          live_test_id,
          participant_type,
          participant_key,
          entry_gem_transaction_key
        )
        VALUES (
          ?,
          'GYAN',
          ?,
          ?
        )
        `,
      )
      .bind(
        test.id,
        String(
          owner.accountId,
        ),
        entryTransactionKey,
      )
      .run();
  } catch (
    error
  ) {
    console.error(
      "Unable to create Live Test entry:",
      error,
    );

    return liveJson(
      {
        error:
          "The Live Test entry could not be created.",
      },

      500,
    );
  }

  const entry =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          entered_at
        FROM education_live_entries

        WHERE
          live_test_id = ?
          AND participant_type =
            'GYAN'
          AND participant_key = ?

        LIMIT 1
        `,
      )
      .bind(
        test.id,
        String(
          owner.accountId,
        ),
      )
      .first<{
        id:
          number;

        entered_at:
          string;
      }>();

  if (!entry) {
    return liveJson(
      {
        error:
          "The Live Test entry could not be loaded.",
      },

      500,
    );
  }

  return liveJson({
    entered:
      true,

    alreadyEntered:
      !charged,

    state:
      "OPEN",

    liveTestId:
      Number(
        test.id,
      ),

    code:
      test.public_code,

    entryId:
      Number(
        entry.id,
      ),

    enteredAt:
      entry.entered_at,

    gemCharged:
      charged
        ? entryCost
        : 0,

    gemBalance:
      await gemBalance(
        env,
        owner.calendarAccessId,
      ),
  });
}



async function getLiveTestQuestions(
  request:
    Request,

  env:
    LiveTestsEnv,

  url:
    URL,
): Promise<Response> {
  const code =
    (
      url.searchParams
        .get("code") ??
      ""
    )
      .trim()
      .toUpperCase()
      .replace(
        /^#/,
        "",
      );

  if (!code) {
    return liveJson(
      {
        error:
          "Live test code is required.",
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
    return liveJson(
      {
        error:
          "Open your GYAN Card on this device before entering the Live Test.",
      },
      401,
    );
  }

  const test =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          series_number,
          series_suffix,
          public_code,
          program_code,
          starts_at_utc,
          schedule_timezone,
          duration_minutes,
          entry_gem_cost,
          report_gem_cost,
          status,
          test_fraction_percent,
          event_kind,
          source_schedule_date,

          0 AS total_participants,
          0 AS human_participants,
          0 AS synthetic_participants

        FROM education_live_tests
        WHERE upper(public_code) = ?
        LIMIT 1
        `,
      )
      .bind(
        code,
      )
      .first<LiveTestRow>();

  if (!test) {
    return liveJson(
      {
        error:
          "Live Test not found.",
      },
      404,
    );
  }

  const adminError =
    await requireAdminForTest(
      request,
      env,
      test,
    );

  if (
    adminError
  ) {
    return adminError;
  }


  const state =
    liveTestState(
      test,
    );

  if (
    state !==
      "OPEN"
  ) {
    return liveJson(
      {
        state,

        error:
          state ===
            "NOT_STARTED"
            ? "Test not started."
            : state ===
                "OVER"
              ? "Test over."
              : "This Live Test is unavailable.",
      },
      409,
    );
  }

  const entry =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          entered_at
        FROM education_live_entries
        WHERE
          live_test_id = ?
          AND participant_type = 'GYAN'
          AND participant_key = ?
        LIMIT 1
        `,
      )
      .bind(
        test.id,
        String(
          owner.accountId,
        ),
      )
      .first<{
        id:
          number;

        entered_at:
          string;
      }>();

  if (!entry) {
    return liveJson(
      {
        state:
          "OPEN",

        error:
          "Enter the Live Test before loading questions.",

        entryRequired:
          true,

        entryGemCost:
          Number(
            test.entry_gem_cost,
          ),
      },
      403,
    );
  }

  const rows =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          lq.question_order,
          lq.section_code,
          q.id AS question_id,
          q.difficulty,
          q.question_text,
          q.choice_a,
          q.choice_b,
          q.choice_c,
          q.choice_d

        FROM education_live_test_questions lq

        JOIN education_questions q
          ON q.id =
             lq.question_id

        WHERE
          lq.live_test_id = ?
          AND q.active = 1

        ORDER BY
          lq.question_order
        `,
      )
      .bind(
        test.id,
      )
      .all<{
        question_order:
          number;

        section_code:
          string | null;

        question_id:
          number;

        difficulty:
          string;

        question_text:
          string;

        choice_a:
          string;

        choice_b:
          string;

        choice_c:
          string;

        choice_d:
          string;
      }>();

  if (
    rows.results.length ===
      0
  ) {
    return liveJson(
      {
        error:
          "Live Test questions are not ready.",
      },
      503,
    );
  }

  const eventWindow =
    effectiveLiveWindow(
      test,
    );

  const entryStartMs =
    parseUtcTimestamp(
      entry.entered_at,
    );

  /*
   * Admin Test #101 is always eligible via the rolling Martian window,
   * but once entered its actual runner receives a normal fixed 18-minute
   * session. Real Live Tests remain synchronized to their event clock.
   */

  const endMs =
    isAdminTest(
      test,
    )
      ? entryStartMs +
        (
          Number(
            test.duration_minutes,
          ) *
          60 *
          1000
        )
      : eventWindow.endMs;

  return liveJson({
    liveTest: {
      id:
        Number(
          test.id,
        ),

      code:
        test.public_code,

      program:
        test.program_code,

      state:
        "OPEN",

      startsAt:
        test.starts_at_utc,

      endsAt:
        new Date(
          endMs,
        ).toISOString(),

      durationMinutes:
        Number(
          test.duration_minutes,
        ),

      questionCount:
        rows.results.length,

      entryId:
        Number(
          entry.id,
        ),

      enteredAt:
        entry.entered_at,
    },

    questions:
      rows.results.map(
        (
          row,
        ) => ({
          questionOrder:
            Number(
              row.question_order,
            ),

          questionId:
            Number(
              row.question_id,
            ),

          section:
            row.section_code,

          difficulty:
            row.difficulty,

          questionText:
            row.question_text,

          choices: {
            A:
              row.choice_a,

            B:
              row.choice_b,

            C:
              row.choice_c,

            D:
              row.choice_d,
          },
        }),
      ),
  });
}



async function submitLiveTest(
  request:
    Request,

  env:
    LiveTestsEnv,
): Promise<Response> {
  let body:
    {
      code?:
        unknown;

      answers?:
        unknown;
    };

  try {
    body =
      await request.json() as {
        code?:
          unknown;

        answers?:
          unknown;
      };
  } catch {
    return liveJson(
      {
        error:
          "Invalid request body.",
      },
      400,
    );
  }

  const code =
    typeof body.code ===
      "string"
      ? body.code
          .trim()
          .toUpperCase()
          .replace(
            /^#/,
            "",
          )
      : "";

  if (!code) {
    return liveJson(
      {
        error:
          "Live test code is required.",
      },
      400,
    );
  }

  const submittedAnswers =
    Array.isArray(
      body.answers,
    )
      ? body.answers
      : [];

  const answerByQuestionId =
    new Map<
      number,
      string | null
    >();

  for (
    const item
    of submittedAnswers
  ) {
    if (
      !item ||
      typeof item !==
        "object"
    ) {
      continue;
    }

    const candidate =
      item as {
        questionId?:
          unknown;

        selectedChoice?:
          unknown;
      };

    const questionId =
      Number(
        candidate.questionId,
      );

    if (
      !Number.isInteger(
        questionId,
      ) ||
      questionId <= 0
    ) {
      continue;
    }

    const selectedChoice =
      typeof candidate
          .selectedChoice ===
        "string"
        ? candidate
            .selectedChoice
            .trim()
            .toUpperCase()
        : "";

    answerByQuestionId.set(
      questionId,
      (
        selectedChoice ===
          "A" ||
        selectedChoice ===
          "B" ||
        selectedChoice ===
          "C" ||
        selectedChoice ===
          "D"
      )
        ? selectedChoice
        : null,
    );
  }

  const owner =
    await currentGyanOwner(
      request,
      env,
    );

  if (!owner) {
    return liveJson(
      {
        error:
          "Open your GYAN Card on this device before submitting the Live Test.",
      },
      401,
    );
  }

  const test =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          series_number,
          series_suffix,
          public_code,
          program_code,
          starts_at_utc,
          schedule_timezone,
          duration_minutes,
          entry_gem_cost,
          report_gem_cost,
          status,
          test_fraction_percent,
          event_kind,
          source_schedule_date,

          0 AS total_participants,
          0 AS human_participants,
          0 AS synthetic_participants

        FROM education_live_tests

        WHERE upper(public_code) = ?

        LIMIT 1
        `,
      )
      .bind(
        code,
      )
      .first<LiveTestRow>();

  if (!test) {
    return liveJson(
      {
        error:
          "Live Test not found.",
      },
      404,
    );
  }

  const adminError =
    await requireAdminForTest(
      request,
      env,
      test,
    );

  if (
    adminError
  ) {
    return adminError;
  }


  if (
    test.status ===
      "CANCELLED"
  ) {
    return liveJson(
      {
        error:
          "This Live Test was cancelled.",
      },
      409,
    );
  }

  const entry =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          entered_at,
          submitted_at,
          attempt_id
        FROM education_live_entries

        WHERE
          live_test_id = ?
          AND participant_type = 'GYAN'
          AND participant_key = ?

        LIMIT 1
        `,
      )
      .bind(
        test.id,
        String(
          owner.accountId,
        ),
      )
      .first<{
        id:
          number;

        entered_at:
          string;

        submitted_at:
          string | null;

        attempt_id:
          number | null;
      }>();

  if (!entry) {
    return liveJson(
      {
        error:
          "Enter the Live Test before submitting it.",
      },
      403,
    );
  }

  if (
    entry.submitted_at ||
    entry.attempt_id
  ) {
    return liveJson({
      submitted:
        true,

      alreadySubmitted:
        true,

      code:
        test.public_code,

      attemptId:
        entry.attempt_id,
    });
  }

  const eventWindow =
    effectiveLiveWindow(
      test,
    );

  const entryStartMs =
    parseUtcTimestamp(
      entry.entered_at,
    );

  const startMs =
    isAdminTest(
      test,
    )
      ? entryStartMs
      : eventWindow.startMs;

  const endMs =
    isAdminTest(
      test,
    )
      ? entryStartMs +
        (
          Number(
            test.duration_minutes,
          ) *
          60 *
          1000
        )
      : eventWindow.endMs;

  const nowMs =
    Date.now();

  /*
   * Small network/auto-submit grace period after the shared event clock.
   */
  const submitGraceMs =
    2 *
    60 *
    1000;

  if (
    nowMs <
      startMs ||
    nowMs >
      endMs +
      submitGraceMs
  ) {
    return liveJson(
      {
        error:
          nowMs <
            startMs
            ? "Test not started."
            : "Submission window closed.",
      },
      409,
    );
  }

  const frozen =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          lq.question_order,
          lq.section_code,
          q.id AS question_id,
          q.correct_choice

        FROM education_live_test_questions lq

        JOIN education_questions q
          ON q.id =
             lq.question_id

        WHERE
          lq.live_test_id = ?

        ORDER BY
          lq.question_order
        `,
      )
      .bind(
        test.id,
      )
      .all<{
        question_order:
          number;

        section_code:
          string | null;

        question_id:
          number;

        correct_choice:
          string;
      }>();

  if (
    frozen.results.length ===
      0
  ) {
    return liveJson(
      {
        error:
          "Live Test questions are not ready.",
      },
      503,
    );
  }

  const graded =
    frozen.results.map(
      (
        row,
      ) => {
        const selectedChoice =
          answerByQuestionId
            .get(
              Number(
                row.question_id,
              ),
            ) ??
          null;

        const correctChoice =
          row.correct_choice
            .trim()
            .toUpperCase();

        return {
          questionId:
            Number(
              row.question_id,
            ),

          questionOrder:
            Number(
              row.question_order,
            ),

          sectionCode:
            row.section_code,

          selectedChoice,

          correctChoice,

          isCorrect:
            selectedChoice !==
              null &&
            selectedChoice ===
              correctChoice,
        };
      },
    );

  const answeredCount =
    graded.filter(
      (
        answer,
      ) =>
        answer.selectedChoice !==
        null,
    ).length;

  const correctCount =
    graded.filter(
      (
        answer,
      ) =>
        answer.isCorrect,
    ).length;

  const incorrectCount =
    answeredCount -
    correctCount;

  const unansweredCount =
    graded.length -
    answeredCount;

  /*
   * Initial raw score:
   * +1 correct / 0 incorrect / 0 unanswered.
   *
   * We store counts separately so program-specific marking can replace
   * raw_score later without losing the original answer record.
   */
  const rawScore =
    correctCount;

  const attemptInsert =
    await env.gyan_registry
      .prepare(
        `
        INSERT OR IGNORE INTO education_live_attempts (
          live_test_id,
          live_entry_id,
          participant_type,
          participant_key,
          question_count,
          answered_count,
          correct_count,
          incorrect_count,
          unanswered_count,
          raw_score,
          started_at,
          submitted_at
        )
        VALUES (
          ?,
          ?,
          'GYAN',
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
        `,
      )
      .bind(
        test.id,
        entry.id,
        String(
          owner.accountId,
        ),
        graded.length,
        answeredCount,
        correctCount,
        incorrectCount,
        unansweredCount,
        rawScore,
        entry.entered_at,
      )
      .run();

  let attemptId =
    Number(
      attemptInsert.meta
        ?.last_row_id ??
      0,
    );

  if (
    attemptId <= 0
  ) {
    const existingAttempt =
      await env.gyan_registry
        .prepare(
          `
          SELECT id
          FROM education_live_attempts
          WHERE live_entry_id = ?
          LIMIT 1
          `,
        )
        .bind(
          entry.id,
        )
        .first<{
          id:
            number;
        }>();

    attemptId =
      Number(
        existingAttempt?.id ??
        0,
      );
  }

  if (
    attemptId <= 0
  ) {
    return liveJson(
      {
        error:
          "Live Test attempt could not be created.",
      },
      500,
    );
  }

  await env.gyan_registry.batch(
    graded.map(
      (
        answer,
      ) =>
        env.gyan_registry
          .prepare(
            `
            INSERT OR IGNORE INTO education_live_attempt_answers (
              attempt_id,
              question_id,
              question_order,
              selected_choice,
              correct_choice,
              is_correct,
              section_code
            )
            VALUES (?, ?, ?, ?, ?, ?, ?)
            `,
          )
          .bind(
            attemptId,
            answer.questionId,
            answer.questionOrder,
            answer.selectedChoice,
            answer.correctChoice,
            answer.isCorrect
              ? 1
              : 0,
            answer.sectionCode,
          ),
    ),
  );

  await env.gyan_registry
    .prepare(
      `
      UPDATE education_live_entries
      SET
        submitted_at =
          COALESCE(
            submitted_at,
            CURRENT_TIMESTAMP
          ),
        attempt_id = ?,
        updated_at =
          CURRENT_TIMESTAMP
      WHERE id = ?
      `,
    )
    .bind(
      attemptId,
      entry.id,
    )
    .run();

  /*
   * Deliberately do NOT return score/correct answers here.
   * Those belong to the 💎15 report-unlock route.
   */
  return liveJson({
    submitted:
      true,

    alreadySubmitted:
      false,

    code:
      test.public_code,

    attemptId,

    answeredCount,

    questionCount:
      graded.length,

    reportLocked:
      true,

    reportGemCost:
      Number(
        test.report_gem_cost,
      ),
  });
}




async function unlockLiveTestQuestions(
  request:
    Request,

  env:
    LiveTestsEnv,
): Promise<Response> {
  const questionGemCost =
    3;

  let body:
    {
      code?:
        unknown;
    };

  try {
    body =
      await request.json() as {
        code?:
          unknown;
      };
  } catch {
    return liveJson(
      {
        error:
          "Invalid request body.",
      },
      400,
    );
  }

  const code =
    typeof body.code ===
      "string"
      ? body.code
          .trim()
          .toUpperCase()
          .replace(
            /^#/,
            "",
          )
      : "";

  if (!code) {
    return liveJson(
      {
        error:
          "Live test code is required.",
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
    return liveJson(
      {
        error:
          "Open your GYAN Card on this device before viewing the Live Test questions.",
      },
      401,
    );
  }

  const test =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          series_number,
          series_suffix,
          public_code,
          program_code,
          starts_at_utc,
          schedule_timezone,
          duration_minutes,
          entry_gem_cost,
          report_gem_cost,
          status,
          test_fraction_percent,
          event_kind,
          source_schedule_date,
          0 AS total_participants,
          0 AS human_participants,
          0 AS synthetic_participants
        FROM education_live_tests
        WHERE upper(public_code) = ?
        LIMIT 1
        `,
      )
      .bind(
        code,
      )
      .first<LiveTestRow>();

  if (!test) {
    return liveJson(
      {
        error:
          "Live Test not found.",
      },
      404,
    );
  }

  if (
    isAdminTest(
      test,
    )
  ) {
    return liveJson(
      {
        error:
          "Admin Test #101 does not use the paid question-paper route.",
      },
      400,
    );
  }

  const {
    endMs,
  } =
    effectiveLiveWindow(
      test,
    );

  if (
    !Number.isFinite(
      endMs,
    ) ||
    Date.now() <
      endMs
  ) {
    return liveJson(
      {
        error:
          "Questions become available after the Live Test ends.",
        availableAt:
          Number.isFinite(
            endMs,
          )
            ? new Date(
                endMs,
              ).toISOString()
            : null,
      },
      409,
    );
  }

  /*
   * A detailed-report unlock is stronger than a question-paper unlock.
   * If the same GYAN Card already owns the report, never charge another 3 Gems.
   */
  const entry =
    await env.gyan_registry
      .prepare(
        `
        SELECT report_unlocked_at
        FROM education_live_entries
        WHERE
          live_test_id = ?
          AND participant_type = 'GYAN'
          AND participant_key = ?
        LIMIT 1
        `,
      )
      .bind(
        test.id,
        String(
          owner.accountId,
        ),
      )
      .first<{
        report_unlocked_at:
          string | null;
      }>();

  const questionReason =
    `LIVE_TEST_QUESTIONS:${test.public_code}`;

  const reportReason =
    `LIVE_TEST_REPORT:${test.public_code}`;

  const priorLedgerUnlock =
    await env.gyan_registry
      .prepare(
        `
        SELECT reason
        FROM gem_transactions
        WHERE
          calendar_access_id = ?
          AND reason IN (?, ?)
        LIMIT 1
        `,
      )
      .bind(
        owner.calendarAccessId,
        questionReason,
        reportReason,
      )
      .first<{
        reason:
          string;
      }>();

  const purchasedAccess =
    await shoppingCartLiveEntitlement(
      env,
      owner.accountId,
      test.public_code,
    );

  let alreadyUnlocked =
    purchasedAccess.test ||
    purchasedAccess.results ||
    Boolean(
      entry?.report_unlocked_at,
    ) ||
    Boolean(
      priorLedgerUnlock,
    );

  let gemCharged =
    0;

  if (
    !alreadyUnlocked
  ) {
    const charge =
      await env.gyan_registry
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
              SELECT
                COALESCE(
                  SUM(amount),
                  0
                )
              FROM gem_transactions
              WHERE calendar_access_id = ?
            ) >= ?
          `,
        )
        .bind(
          owner.calendarAccessId,
          -questionGemCost,
          questionReason,
          owner.calendarAccessId,
          questionGemCost,
        )
        .run();

    const charged =
      Number(
        charge.meta?.changes ??
        0,
      ) > 0;

    if (
      charged
    ) {
      gemCharged =
        questionGemCost;
    } else {
      /*
       * INSERT OR IGNORE can also mean a harmless retry after a prior unlock.
       * Distinguish that from insufficient Gems.
       */
      const priorQuestionCharge =
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
            questionReason,
          )
          .first<{
            id:
              number;
          }>();

      if (
        !priorQuestionCharge
      ) {
        return liveJson(
          {
            error:
              `You need ${questionGemCost} Gems to view this Live Test question paper.`,

            requiredGems:
              questionGemCost,

            gemBalance:
              await gemBalance(
                env,
                owner.calendarAccessId,
              ),
          },
          402,
        );
      }

      alreadyUnlocked =
        true;
    }
  }

  const rows =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          lq.question_order,
          lq.section_code,
          q.id AS question_id,
          q.difficulty,
          q.question_text,
          q.choice_a,
          q.choice_b,
          q.choice_c,
          q.choice_d

        FROM education_live_test_questions lq

        JOIN education_questions q
          ON q.id =
             lq.question_id

        WHERE
          lq.live_test_id = ?

        ORDER BY
          lq.question_order
        `,
      )
      .bind(
        test.id,
      )
      .all<{
        question_order:
          number;

        section_code:
          string | null;

        question_id:
          number;

        difficulty:
          string;

        question_text:
          string;

        choice_a:
          string;

        choice_b:
          string;

        choice_c:
          string;

        choice_d:
          string;
      }>();

  if (
    rows.results.length ===
      0
  ) {
    return liveJson(
      {
        error:
          "Live Test question paper is not available.",
      },
      404,
    );
  }

  return liveJson({
    unlocked:
      true,

    alreadyUnlocked,

    gemCharged,

    gemBalance:
      await gemBalance(
        env,
        owner.calendarAccessId,
      ),

    questionGemCost,

    liveTest: {
      code:
        test.public_code,

      program:
        test.program_code,

      questionCount:
        rows.results.length,
    },

    questions:
      rows.results.map(
        (
          row,
        ) => ({
          questionOrder:
            Number(
              row.question_order,
            ),

          questionId:
            Number(
              row.question_id,
            ),

          section:
            row.section_code,

          difficulty:
            row.difficulty,

          questionText:
            row.question_text,

          choices: {
            A:
              row.choice_a,

            B:
              row.choice_b,

            C:
              row.choice_c,

            D:
              row.choice_d,
          },
        }),
      ),
  });
}


async function unlockLiveTestReport(
  request:
    Request,

  env:
    LiveTestsEnv,
): Promise<Response> {
  let body:
    {
      code?:
        unknown;
    };

  try {
    body =
      await request.json() as {
        code?:
          unknown;
      };
  } catch {
    return liveJson(
      {
        error:
          "Invalid request body.",
      },
      400,
    );
  }

  const code =
    typeof body.code ===
      "string"
      ? body.code
          .trim()
          .toUpperCase()
          .replace(
            /^#/,
            "",
          )
      : "";

  if (!code) {
    return liveJson(
      {
        error:
          "Live test code is required.",
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
    return liveJson(
      {
        error:
          "Open your GYAN Card on this device before opening the Live Test report.",
      },
      401,
    );
  }

  const test =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          series_number,
          series_suffix,
          public_code,
          program_code,
          starts_at_utc,
          schedule_timezone,
          duration_minutes,
          entry_gem_cost,
          report_gem_cost,
          status,
          test_fraction_percent,
          event_kind,
          source_schedule_date,
          0 AS total_participants,
          0 AS human_participants,
          0 AS synthetic_participants
        FROM education_live_tests
        WHERE upper(public_code) = ?
        LIMIT 1
        `,
      )
      .bind(
        code,
      )
      .first<LiveTestRow>();

  if (!test) {
    return liveJson(
      {
        error:
          "Live Test not found.",
      },
      404,
    );
  }

  if (
    isAdminTest(
      test,
    )
  ) {
    return liveJson(
      {
        error:
          "Admin Test #101 uses the admin result route.",
      },
      400,
    );
  }

  /*
   * Normal Live Test answers must remain sealed until the
   * synchronized event window is over. A student may submit
   * early, but cannot buy/reveal the report while other
   * participants are still testing.
   */
  const {
    endMs:
      reportAvailableMs,
  } =
    effectiveLiveWindow(
      test,
    );

  if (
    !Number.isFinite(
      reportAvailableMs,
    ) ||
    Date.now() <
      reportAvailableMs
  ) {
    return liveJson(
      {
        error:
          "The detailed report will be available after the Live Test ends.",
        reportAvailableAt:
          Number.isFinite(
            reportAvailableMs,
          )
            ? new Date(
                reportAvailableMs,
              ).toISOString()
            : null,
      },
      409,
    );
  }

  const entry =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          submitted_at,
          attempt_id,
          report_unlocked_at
        FROM education_live_entries
        WHERE
          live_test_id = ?
          AND participant_type = 'GYAN'
          AND participant_key = ?
        LIMIT 1
        `,
      )
      .bind(
        test.id,
        String(
          owner.accountId,
        ),
      )
      .first<{
        id: number;
        submitted_at: string | null;
        attempt_id: number | null;
        report_unlocked_at: string | null;
      }>();

  if (!entry) {
    return liveJson(
      {
        error:
          "Enter and submit the Live Test before opening its report.",
      },
      403,
    );
  }

  if (
    !entry.submitted_at ||
    !entry.attempt_id
  ) {
    return liveJson(
      {
        error:
          "Submit the Live Test before opening its report.",
      },
      409,
    );
  }

  const reportCost =
    Math.max(
      0,
      Number(
        test.report_gem_cost,
      ),
    );

  const purchasedAccess =
    await shoppingCartLiveEntitlement(
      env,
      owner.accountId,
      test.public_code,
    );

  let gemCharged =
    0;

  if (
    !entry.report_unlocked_at
  ) {
    const transactionReason =
      `LIVE_TEST_REPORT:${test.public_code}`;

    if (
      !purchasedAccess.results &&
      reportCost > 0
    ) {
      const charge =
        await env.gyan_registry
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
                SELECT
                  COALESCE(
                    SUM(amount),
                    0
                  )
                FROM gem_transactions
                WHERE calendar_access_id = ?
              ) >= ?
            `,
          )
          .bind(
            owner.calendarAccessId,
            -reportCost,
            transactionReason,
            owner.calendarAccessId,
            reportCost,
          )
          .run();

      const charged =
        Number(
          charge.meta?.changes ??
          0,
        ) > 0;

      if (!charged) {
        const priorCharge =
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
              transactionReason,
            )
            .first<{
              id: number;
            }>();

        if (!priorCharge) {
          return liveJson(
            {
              error:
                `You need ${reportCost} Gems to open this Live Test report.`,
              requiredGems:
                reportCost,
              gemBalance:
                await gemBalance(
                  env,
                  owner.calendarAccessId,
                ),
            },
            402,
          );
        }
      } else {
        gemCharged =
          reportCost;
      }
    }

    await env.gyan_registry
      .prepare(
        `
        UPDATE education_live_entries
        SET
          report_unlocked_at =
            COALESCE(
              report_unlocked_at,
              CURRENT_TIMESTAMP
            ),
          updated_at =
            CURRENT_TIMESTAMP
        WHERE id = ?
        `,
      )
      .bind(
        entry.id,
      )
      .run();
  }

  const attempt =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id AS attempt_id,
          question_count,
          answered_count,
          correct_count,
          incorrect_count,
          unanswered_count,
          raw_score,
          started_at,
          submitted_at
        FROM education_live_attempts
        WHERE id = ?
        LIMIT 1
        `,
      )
      .bind(
        entry.attempt_id,
      )
      .first<{
        attempt_id: number;
        question_count: number;
        answered_count: number;
        correct_count: number;
        incorrect_count: number;
        unanswered_count: number;
        raw_score: number;
        started_at: string;
        submitted_at: string;
      }>();

  if (!attempt) {
    return liveJson(
      {
        error:
          "Live Test report could not be loaded.",
      },
      404,
    );
  }

  const rows =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          aa.question_order,
          aa.section_code,
          aa.selected_choice,
          aa.correct_choice,
          aa.is_correct,
          q.id AS question_id,
          q.question_text,
          q.choice_a,
          q.choice_b,
          q.choice_c,
          q.choice_d,
          q.explanation
        FROM education_live_attempt_answers aa
        JOIN education_questions q
          ON q.id = aa.question_id
        WHERE aa.attempt_id = ?
        ORDER BY aa.question_order
        `,
      )
      .bind(
        attempt.attempt_id,
      )
      .all<{
        question_order: number;
        section_code: string | null;
        selected_choice: string | null;
        correct_choice: string;
        is_correct: number;
        question_id: number;
        question_text: string;
        choice_a: string;
        choice_b: string;
        choice_c: string;
        choice_d: string;
        explanation: string | null;
      }>();

  return liveJson({
    unlocked:
      true,

    alreadyUnlocked:
      Boolean(
        entry.report_unlocked_at,
      ),

    gemCharged,

    gemBalance:
      await gemBalance(
        env,
        owner.calendarAccessId,
      ),

    result: {
      code:
        test.public_code,

      attemptId:
        Number(
          attempt.attempt_id,
        ),

      questionCount:
        Number(
          attempt.question_count,
        ),

      answeredCount:
        Number(
          attempt.answered_count,
        ),

      correctCount:
        Number(
          attempt.correct_count,
        ),

      incorrectCount:
        Number(
          attempt.incorrect_count,
        ),

      unansweredCount:
        Number(
          attempt.unanswered_count,
        ),

      rawScore:
        Number(
          attempt.raw_score,
        ),

      scorePercent:
        Number(
          attempt.question_count,
        ) > 0
          ? Math.round(
              Number(
                attempt.correct_count,
              ) *
                100 /
                Number(
                  attempt.question_count,
                ),
            )
          : 0,

      startedAt:
        attempt.started_at,

      submittedAt:
        attempt.submitted_at,

      questions:
        rows.results.map(
          (
            row,
          ) => ({
            questionOrder:
              Number(
                row.question_order,
              ),

            questionId:
              Number(
                row.question_id,
              ),

            section:
              row.section_code,

            questionText:
              row.question_text,

            selectedChoice:
              row.selected_choice,

            correctChoice:
              row.correct_choice,

            correct:
              Number(
                row.is_correct,
              ) === 1,

            choices: {
              A:
                row.choice_a,

              B:
                row.choice_b,

              C:
                row.choice_c,

              D:
                row.choice_d,
            },

            explanation:
              row.explanation,
          }),
        ),
    },
  });
}


async function adminTestResult(
  request:
    Request,

  env:
    LiveTestsEnv,
): Promise<Response> {
  const session =
    await getAdminSession(
      request,
      env,
    );

  if (!session) {
    return liveJson(
      {
        error:
          "Administrator authentication is required.",
      },
      401,
    );
  }

  const owner =
    await currentGyanOwner(
      request,
      env,
    );

  if (!owner) {
    return liveJson(
      {
        error:
          "Open your GYAN Card on this device before viewing Admin Test #101 results.",
      },
      401,
    );
  }

  const attempt =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          a.id AS attempt_id,
          a.question_count,
          a.answered_count,
          a.correct_count,
          a.incorrect_count,
          a.unanswered_count,
          a.raw_score,
          a.started_at,
          a.submitted_at
        FROM education_live_attempts a
        JOIN education_live_tests lt
          ON lt.id = a.live_test_id
        WHERE
          lt.public_code = 'ADMIN101'
          AND a.participant_type = 'GYAN'
          AND a.participant_key = ?
        ORDER BY a.id DESC
        LIMIT 1
        `,
      )
      .bind(
        String(
          owner.accountId,
        ),
      )
      .first<{
        attempt_id: number;
        question_count: number;
        answered_count: number;
        correct_count: number;
        incorrect_count: number;
        unanswered_count: number;
        raw_score: number;
        started_at: string;
        submitted_at: string;
      }>();

  if (!attempt) {
    return liveJson(
      {
        error:
          "Admin Test #101 has not been submitted on this GYAN yet.",
      },
      404,
    );
  }

  const rows =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          aa.question_order,
          aa.section_code,
          aa.selected_choice,
          aa.correct_choice,
          aa.is_correct,
          q.id AS question_id,
          q.question_text,
          q.choice_a,
          q.choice_b,
          q.choice_c,
          q.choice_d,
          q.explanation
        FROM education_live_attempt_answers aa
        JOIN education_questions q
          ON q.id = aa.question_id
        WHERE aa.attempt_id = ?
        ORDER BY aa.question_order
        `,
      )
      .bind(
        attempt.attempt_id,
      )
      .all<{
        question_order: number;
        section_code: string | null;
        selected_choice: string | null;
        correct_choice: string;
        is_correct: number;
        question_id: number;
        question_text: string;
        choice_a: string;
        choice_b: string;
        choice_c: string;
        choice_d: string;
        explanation: string | null;
      }>();

  return liveJson({
    result: {
      code:
        "ADMIN101",

      attemptId:
        Number(
          attempt.attempt_id,
        ),

      questionCount:
        Number(
          attempt.question_count,
        ),

      answeredCount:
        Number(
          attempt.answered_count,
        ),

      correctCount:
        Number(
          attempt.correct_count,
        ),

      incorrectCount:
        Number(
          attempt.incorrect_count,
        ),

      unansweredCount:
        Number(
          attempt.unanswered_count,
        ),

      rawScore:
        Number(
          attempt.raw_score,
        ),

      scorePercent:
        Number(
          attempt.question_count,
        ) > 0
          ? Math.round(
              Number(
                attempt.correct_count,
              ) *
                100 /
                Number(
                  attempt.question_count,
                ),
            )
          : 0,

      startedAt:
        attempt.started_at,

      submittedAt:
        attempt.submitted_at,

      questions:
        rows.results.map(
          (
            row,
          ) => ({
            questionOrder:
              Number(
                row.question_order,
              ),

            questionId:
              Number(
                row.question_id,
              ),

            section:
              row.section_code,

            questionText:
              row.question_text,

            selectedChoice:
              row.selected_choice,

            correctChoice:
              row.correct_choice,

            correct:
              Number(
                row.is_correct,
              ) === 1,

            choices: {
              A:
                row.choice_a,

              B:
                row.choice_b,

              C:
                row.choice_c,

              D:
                row.choice_d,
            },

            explanation:
              row.explanation,
          }),
        ),
    },
  });
}


async function adminTestStatus(
  request:
    Request,

  env:
    LiveTestsEnv,
): Promise<Response> {
  const session =
    await getAdminSession(
      request,
      env,
    );

  if (
    !session
  ) {
    return liveJson(
      {
        error:
          "Administrator authentication is required.",
      },
      401,
    );
  }

  const test =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          series_number,
          series_suffix,
          public_code,
          program_code,
          starts_at_utc,
          schedule_timezone,
          duration_minutes,
          entry_gem_cost,
          report_gem_cost,
          status,
          test_fraction_percent,
          event_kind,
          source_schedule_date,

          0 AS total_participants,
          0 AS human_participants,
          0 AS synthetic_participants

        FROM education_live_tests
        WHERE public_code = 'ADMIN101'
        LIMIT 1
        `,
      )
      .first<LiveTestRow>();

  if (
    !test
  ) {
    return liveJson(
      {
        error:
          "Admin Test #101 is not seeded.",
      },
      404,
    );
  }

  const nowMs =
    Date.now();

  const window =
    effectiveLiveWindow(
      test,
      nowMs,
    );

  return liveJson({
    id:
      Number(
        test.id,
      ),

    code:
      "ADMIN101",

    label:
      "Admin Test #101",

    state:
      "OPEN",

    martianStartsAt:
      new Date(
        window.startMs,
      ).toISOString(),

    martianEndsAt:
      new Date(
        window.endMs,
      ).toISOString(),

    durationMinutes:
      Number(
        test.duration_minutes,
      ),

    entryGemCost:
      0,

    reportGemCost:
      0,
  });
}



async function liveTestResults(
  request:
    Request,

  env:
    LiveTestsEnv,
): Promise<Response> {
  const owner =
    await currentGyanOwner(
      request,
      env,
    );

  if (!owner) {
    return liveJson(
      {
        error:
          "Open your GYAN Card on this device to view Live Test results.",
      },
      401,
    );
  }

  const rows =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          a.id AS attempt_id,
          lt.id AS live_test_id,
          lt.public_code,
          lt.program_code,
          lt.starts_at_utc,
          COALESCE(
            lt.source_schedule_date,
            substr(
              lt.starts_at_utc,
              1,
              10
            )
          ) AS result_date,
          a.question_count,
          a.answered_count,
          a.correct_count,
          a.incorrect_count,
          a.unanswered_count,
          a.submitted_at,

          CASE
            WHEN le.report_unlocked_at IS NULL
            THEN 0
            ELSE 1
          END AS report_unlocked,

          (
            SELECT COUNT(*)
            FROM education_guidance_unlocks gu
            WHERE
              gu.gyan_account_id = ?
              AND gu.context_type = 'LIVE'
              AND gu.context_id = lt.id
              AND gu.assistance_type = 'TIP'
          ) AS tips_used,

          (
            SELECT COUNT(*)
            FROM education_guidance_unlocks gu
            WHERE
              gu.gyan_account_id = ?
              AND gu.context_type = 'LIVE'
              AND gu.context_id = lt.id
              AND gu.assistance_type = 'FIFTY_FIFTY'
          ) AS fifty_fifty_used,

          (
            SELECT COUNT(*)
            FROM education_live_attempt_answers aa
            WHERE
              aa.attempt_id = a.id
              AND aa.is_correct = 1
              AND NOT EXISTS (
                SELECT 1
                FROM education_guidance_unlocks gu
                WHERE
                  gu.gyan_account_id = ?
                  AND gu.context_type = 'LIVE'
                  AND gu.context_id = lt.id
                  AND gu.question_id = aa.question_id
                  AND gu.assistance_type IN (
                    'TIP',
                    'FIFTY_FIFTY'
                  )
              )
          ) AS unaided_correct

        FROM education_live_attempts a

        JOIN education_live_tests lt
          ON lt.id =
             a.live_test_id

        LEFT JOIN education_live_entries le
          ON le.id =
             a.live_entry_id

        WHERE
          a.participant_type = 'GYAN'
          AND a.participant_key = ?
          AND a.submitted_at IS NOT NULL
          AND COALESCE(
            lt.event_kind,
            'WEEKDAY'
          ) <> 'ADMIN_TEST'

        ORDER BY
          datetime(
            a.submitted_at
          ) DESC,
          a.id DESC

        LIMIT 100
        `,
      )
      .bind(
        owner.accountId,
        owner.accountId,
        owner.accountId,
        String(
          owner.accountId,
        ),
      )
      .all<{
        attempt_id:
          number;

        live_test_id:
          number;

        public_code:
          string;

        program_code:
          string;

        starts_at_utc:
          string;

        result_date:
          string;

        question_count:
          number;

        answered_count:
          number;

        correct_count:
          number;

        incorrect_count:
          number;

        unanswered_count:
          number;

        submitted_at:
          string;

        report_unlocked:
          number;

        tips_used:
          number;

        fifty_fifty_used:
          number;

        unaided_correct:
          number;
      }>();

  return liveJson({
    results:
      rows.results.map(
        (
          row,
        ) => {
          const questionCount =
            Number(
              row.question_count,
            );

          const correctCount =
            Number(
              row.correct_count,
            );

          return {
            attemptId:
              Number(
                row.attempt_id,
              ),

            liveTestId:
              Number(
                row.live_test_id,
              ),

            code:
              row.public_code,

            program:
              row.program_code,

            date:
              row.result_date,

            startsAt:
              row.starts_at_utc,

            submittedAt:
              row.submitted_at,

            questionCount,

            answeredCount:
              Number(
                row.answered_count,
              ),

            correctCount,

            incorrectCount:
              Number(
                row.incorrect_count,
              ),

            unansweredCount:
              Number(
                row.unanswered_count,
              ),

            scorePercent:
              questionCount >
                0
                ? Math.round(
                    correctCount *
                      100 /
                      questionCount,
                  )
                : 0,

            tipsUsed:
              Number(
                row.tips_used ??
                0,
              ),

            fiftyFiftyUsed:
              Number(
                row.fifty_fifty_used ??
                0,
              ),

            unaidedCorrect:
              Number(
                row.unaided_correct ??
                0,
              ),

            reportUnlocked:
              Number(
                row.report_unlocked,
              ) === 1,
          };
        },
      ),
  });
}


export async function handleLiveTestsRoute(
  request:
    Request,

  env:
    LiveTestsEnv,

  url:
    URL,
): Promise<Response | null> {
  const shoppingCartCatalogResponse =
    await handleShoppingCartCatalogRoute(
      request,
      env,
      url,
    );

  if (shoppingCartCatalogResponse) {
    return shoppingCartCatalogResponse;
  }

  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/admin/live-tests/test-101/result"
  ) {
    return adminTestResult(
      request,
      env,
    );
  }

  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/admin/live-tests/test-101"
  ) {
    return adminTestStatus(
      request,
      env,
    );
  }

  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/education/live-tests/results"
  ) {
    return liveTestResults(
      request,
      env,
    );
  }

  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/education/live-tests"
  ) {
    return listLiveTests(
      env,
      url,
    );
  }

  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/education/live-tests/questions"
  ) {
    return getLiveTestQuestions(
      request,
      env,
      url,
    );
  }

  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/education/live-tests/questions/unlock"
  ) {
    return unlockLiveTestQuestions(
      request,
      env,
    );
  }

  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/education/live-tests/report/unlock"
  ) {
    return unlockLiveTestReport(
      request,
      env,
    );
  }

  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/education/live-tests/submit"
  ) {
    return submitLiveTest(
      request,
      env,
    );
  }

  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/education/live-tests/enter"
  ) {
    return enterLiveTest(
      request,
      env,
    );
  }

  return null;
}
