type Env = {
  gyan_registry: D1Database;
};

type AssistanceType =
  | "TIP"
  | "FIFTY_FIFTY";

type ContextType =
  | "MOCK"
  | "LIVE";

type Owner = {
  accountId: number;
  calendarAccessId: number;
};

type Context = {
  type: ContextType;
  id: number;
  questionCount: number;
  assistanceCap: number | null;
  challengeMode: boolean;
};

type GuidanceRow = {
  question_id: number;
  tip_text: string | null;
  tip_status: string;
  fifty_fifty_choice_1: string | null;
  fifty_fifty_reason_1: string | null;
  fifty_fifty_choice_2: string | null;
  fifty_fifty_reason_2: string | null;
  question_format: string;
};

const FULL_TEST_ASSISTANCE_CAP = 20;
const SINGLE_HELP_COST = 1;

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

function cookieValue(
  request: Request,
  name: string,
): string {
  const raw =
    request.headers.get("cookie") ?? "";

  for (const part of raw.split(";")) {
    const [key, ...rest] =
      part.trim().split("=");

    if (key === name) {
      return decodeURIComponent(
        rest.join("="),
      );
    }
  }

  return "";
}

async function sha256Hex(
  value: string,
): Promise<string> {
  const digest =
    await crypto.subtle.digest(
      "SHA-256",
      new TextEncoder().encode(value),
    );

  return Array.from(
    new Uint8Array(digest),
    (byte) =>
      byte
        .toString(16)
        .padStart(2, "0"),
  ).join("");
}

async function currentOwner(
  request: Request,
  env: Env,
): Promise<Owner | null> {
  const secret =
    cookieValue(
      request,
      "gyan_anon",
    );

  if (!secret) {
    return null;
  }

  const secretHash =
    await sha256Hex(secret);

  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          gbs.account_id,
          gacl.calendar_access_id
        FROM gyan_browser_sessions gbs
        JOIN gyan_account_calendar_links gacl
          ON gacl.gyan_account_id =
             gbs.account_id
        WHERE gbs.secret_hash = ?
        LIMIT 1
        `,
      )
      .bind(secretHash)
      .first<{
        account_id: number;
        calendar_access_id: number;
      }>();

  return row
    ? {
        accountId:
          Number(row.account_id),
        calendarAccessId:
          Number(
            row.calendar_access_id,
          ),
      }
    : null;
}

function normalizeAssistance(
  value: unknown,
): AssistanceType | null {
  const normalized =
    typeof value === "string"
      ? value
          .trim()
          .toUpperCase()
      : "";

  return normalized === "TIP" ||
    normalized === "FIFTY_FIFTY"
      ? normalized
      : null;
}

function normalizeContextType(
  value: unknown,
): ContextType | null {
  const normalized =
    typeof value === "string"
      ? value
          .trim()
          .toUpperCase()
      : "";

  return normalized === "MOCK" ||
    normalized === "LIVE"
      ? normalized
      : null;
}

function isWeekendDate(
  date: string | null,
): boolean {
  if (!date) return false;

  const day =
    new Date(
      `${date}T12:00:00Z`,
    ).getUTCDay();

  return day === 0 || day === 6;
}

async function resolveContext(
  env: Env,
  type: ContextType,
  id: number,
  questionId: number,
): Promise<Context | null> {
  if (type === "MOCK") {
    const row =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            mt.id,
            mt.test_kind,
            COUNT(allq.question_id)
              AS question_count
          FROM education_mock_tests mt
          JOIN education_mock_test_questions targetq
            ON targetq.mock_test_id = mt.id
           AND targetq.question_id = ?
          LEFT JOIN education_mock_test_questions allq
            ON allq.mock_test_id = mt.id
          WHERE mt.id = ?
            AND mt.published = 1
          GROUP BY mt.id
          LIMIT 1
          `,
        )
        .bind(
          questionId,
          id,
        )
        .first<{
          id: number;
          test_kind: string;
          question_count: number;
        }>();

    if (!row) {
      return null;
    }

    return {
      type,
      id: Number(row.id),
      questionCount:
        Number(row.question_count),
      assistanceCap:
        row.test_kind === "FULL"
          ? FULL_TEST_ASSISTANCE_CAP
          : null,
      challengeMode: false,
    };
  }

  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          lt.id,
          lt.source_schedule_date,
          COUNT(allq.question_id)
            AS question_count
        FROM education_live_entries le
        JOIN education_live_tests lt
          ON lt.id =
             le.live_test_id
        JOIN education_live_test_questions targetq
          ON targetq.live_test_id = lt.id
         AND targetq.question_id = ?
        LEFT JOIN education_live_test_questions allq
          ON allq.live_test_id = lt.id
        WHERE le.id = ?
        GROUP BY lt.id
        LIMIT 1
        `,
      )
      .bind(
        questionId,
        id,
      )
      .first<{
        id: number;
        source_schedule_date:
          string | null;
        question_count: number;
      }>();

  if (!row) {
    return null;
  }

  return {
    type,
    id: Number(row.id),
    questionCount:
      Number(row.question_count),
    assistanceCap: null,
    challengeMode:
      isWeekendDate(
        row.source_schedule_date,
      ),
  };
}

async function loadGuidance(
  env: Env,
  questionId: number,
): Promise<GuidanceRow | null> {
  return env.gyan_registry
    .prepare(
      `
      SELECT
        q.id AS question_id,
        g.tip_text,
        g.tip_status,
        g.fifty_fifty_choice_1,
        g.fifty_fifty_reason_1,
        g.fifty_fifty_choice_2,
        g.fifty_fifty_reason_2,
        COALESCE(
          qm.question_format,
          'SINGLE_CHOICE'
        ) AS question_format
      FROM education_questions q
      LEFT JOIN education_question_guidance g
        ON g.question_id = q.id
      LEFT JOIN education_question_metadata qm
        ON qm.question_id = q.id
      WHERE q.id = ?
        AND q.active = 1
      LIMIT 1
      `,
    )
    .bind(questionId)
    .first<GuidanceRow>();
}

function assistanceAvailable(
  row: GuidanceRow,
  assistance:
    AssistanceType,
): boolean {
  if (assistance === "TIP") {
    return (
      row.tip_status === "READY" &&
      Boolean(
        row.tip_text?.trim(),
      )
    );
  }

  return (
    row.question_format ===
      "SINGLE_CHOICE" &&
    Boolean(
      row.fifty_fifty_choice_1 &&
      row.fifty_fifty_reason_1 &&
      row.fifty_fifty_choice_2 &&
      row.fifty_fifty_reason_2
    )
  );
}

async function gemBalance(
  env: Env,
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
          ) AS total
        FROM gem_transactions
        WHERE calendar_access_id = ?
        `,
      )
      .bind(calendarAccessId)
      .first<{
        total: number;
      }>();

  return Number(
    row?.total ?? 0,
  );
}

async function alreadyUnlocked(
  env: Env,
  accountId: number,
  questionId: number,
  assistance:
    AssistanceType,
): Promise<boolean> {
  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT 1 AS found
        FROM education_guidance_unlocks
        WHERE gyan_account_id = ?
          AND question_id = ?
          AND assistance_type = ?
        LIMIT 1
        `,
      )
      .bind(
        accountId,
        questionId,
        assistance,
      )
      .first<{
        found: number;
      }>();

  return Boolean(row);
}

async function contextSpend(
  env: Env,
  accountId: number,
  context: Context,
): Promise<number> {
  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          COALESCE(
            SUM(gem_cost),
            0
          ) AS total
        FROM education_guidance_unlocks
        WHERE gyan_account_id = ?
          AND context_type = ?
          AND context_id = ?
        `,
      )
      .bind(
        accountId,
        context.type,
        context.id,
      )
      .first<{
        total: number;
      }>();

  return Number(
    row?.total ?? 0,
  );
}

function payload(
  row: GuidanceRow,
  tipUnlocked: boolean,
  fiftyUnlocked: boolean,
  capRemaining:
    number | null,
  gemBalanceValue:
    number | null,
) {
  const tipAvailable =
    assistanceAvailable(
      row,
      "TIP",
    );

  const fiftyAvailable =
    assistanceAvailable(
      row,
      "FIFTY_FIFTY",
    );

  return {
    questionId:
      Number(row.question_id),

    tipAvailable,

    fiftyFiftyAvailable:
      fiftyAvailable,

    tipUnlocked,

    fiftyFiftyUnlocked:
      fiftyUnlocked,

    tipText:
      tipUnlocked
        ? row.tip_text
        : null,

    eliminatedChoices:
      fiftyUnlocked &&
      fiftyAvailable
        ? [
            {
              choice:
                row.fifty_fifty_choice_1,
              reason:
                row.fifty_fifty_reason_1,
            },
            {
              choice:
                row.fifty_fifty_choice_2,
              reason:
                row.fifty_fifty_reason_2,
            },
          ]
        : [],

    tipGemCost:
      tipUnlocked ||
      (
        capRemaining !== null &&
        capRemaining <= 0
      )
        ? 0
        : SINGLE_HELP_COST,

    fiftyFiftyGemCost:
      fiftyUnlocked ||
      (
        capRemaining !== null &&
        capRemaining <= 0
      )
        ? 0
        : SINGLE_HELP_COST,

    assistanceCapRemaining:
      capRemaining,

    gemBalance:
      gemBalanceValue,
  };
}

export async function handleEducationGuidanceRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  const route =
    url.pathname ===
      "/api/education/guidance";

  const unlockRoute =
    url.pathname ===
      "/api/education/guidance/unlock";

  if (!route && !unlockRoute) {
    return null;
  }

  const owner =
    await currentOwner(
      request,
      env,
    );

  if (!owner) {
    return json(
      {
        error:
          "Open your GYAN Card on this device before using guided help.",
      },
      401,
    );
  }

  if (
    route &&
    request.method === "GET"
  ) {
    const questionId =
      Number(
        url.searchParams.get(
          "questionId",
        ),
      );

    const contextType =
      normalizeContextType(
        url.searchParams.get(
          "contextType",
        ),
      );

    const contextId =
      Number(
        url.searchParams.get(
          "contextId",
        ),
      );

    if (
      !Number.isInteger(questionId) ||
      questionId <= 0 ||
      !contextType ||
      !Number.isInteger(contextId) ||
      contextId <= 0
    ) {
      return json(
        {
          error:
            "Invalid guidance request.",
        },
        400,
      );
    }

    const [
      context,
      guidance,
      balance,
    ] =
      await Promise.all([
        resolveContext(
          env,
          contextType,
          contextId,
          questionId,
        ),
        loadGuidance(
          env,
          questionId,
        ),
        gemBalance(
          env,
          owner.calendarAccessId,
        ),
      ]);

    if (!context || !guidance) {
      return json(
        {
          error:
            "Question guidance was not found.",
        },
        404,
      );
    }

    const spent =
      await contextSpend(
        env,
        owner.accountId,
        context,
      );

    const capRemaining =
      context.assistanceCap == null
        ? null
        : Math.max(
            0,
            context.assistanceCap -
              spent,
          );

    const [
      tipUnlocked,
      fiftyUnlocked,
    ] =
      await Promise.all([
        alreadyUnlocked(
          env,
          owner.accountId,
          questionId,
          "TIP",
        ),
        alreadyUnlocked(
          env,
          owner.accountId,
          questionId,
          "FIFTY_FIFTY",
        ),
      ]);

    return json({
      questionId,
      challengeMode:
        context.challengeMode,
      tipAvailable:
        assistanceAvailable(
          guidance,
          "TIP",
        ),
      fiftyFiftyAvailable:
        assistanceAvailable(
          guidance,
          "FIFTY_FIFTY",
        ),
      tipUnlocked,
      fiftyFiftyUnlocked:
        fiftyUnlocked,
      tipText:
        tipUnlocked
          ? guidance.tip_text
          : null,
      eliminatedChoices:
        fiftyUnlocked
          ? [
              {
                choice:
                  guidance
                    .fifty_fifty_choice_1,
                reason:
                  guidance
                    .fifty_fifty_reason_1,
              },
              {
                choice:
                  guidance
                    .fifty_fifty_choice_2,
                reason:
                  guidance
                    .fifty_fifty_reason_2,
              },
            ]
          : [],
      tipGemCost:
        tipUnlocked ||
        (
          context.assistanceCap != null &&
          spent >=
            context.assistanceCap
        )
          ? 0
          : SINGLE_HELP_COST,
      fiftyFiftyGemCost:
        fiftyUnlocked ||
        (
          context.assistanceCap != null &&
          spent >=
            context.assistanceCap
        )
          ? 0
          : SINGLE_HELP_COST,
      assistanceCapRemaining:
        capRemaining,
      gemBalance:
        balance,
    });
  }

  if (
    unlockRoute &&
    request.method === "POST"
  ) {
    let body: {
      questionId?: unknown;
      kind?: unknown;
      contextType?: unknown;
      contextId?: unknown;
    };

    try {
      body =
        await request.json() as
          typeof body;
    } catch {
      return json(
        {
          error:
            "Invalid request body.",
        },
        400,
      );
    }

    const questionId =
      Number(body.questionId);

    const assistance =
      normalizeAssistance(
        body.kind,
      );

    const contextType =
      normalizeContextType(
        body.contextType,
      );

    const contextId =
      Number(body.contextId);

    if (
      !Number.isInteger(questionId) ||
      questionId <= 0 ||
      !assistance ||
      !contextType ||
      !Number.isInteger(contextId) ||
      contextId <= 0
    ) {
      return json(
        {
          error:
            "Invalid guided-help request.",
        },
        400,
      );
    }

    const [
      context,
      guidance,
    ] =
      await Promise.all([
        resolveContext(
          env,
          contextType,
          contextId,
          questionId,
        ),
        loadGuidance(
          env,
          questionId,
        ),
      ]);

    if (!context || !guidance) {
      return json(
        {
          error:
            "Question guidance was not found.",
        },
        404,
      );
    }

    if (context.challengeMode) {
      return json(
        {
          error:
            "Guided help is available after submission for this Challenge Test.",
          challengeMode:
            true,
        },
        403,
      );
    }

    if (
      !assistanceAvailable(
        guidance,
        assistance,
      )
    ) {
      return json(
        {
          error:
            assistance === "TIP"
              ? "A Tip is not available for this question."
              : "50/50 is not available for this question.",
        },
        404,
      );
    }

    const existing =
      await alreadyUnlocked(
        env,
        owner.accountId,
        questionId,
        assistance,
      );

    const spent =
      await contextSpend(
        env,
        owner.accountId,
        context,
      );

    const capReached =
      context.assistanceCap != null &&
      spent >=
        context.assistanceCap;

    const capRemainingBefore =
      context.assistanceCap == null
        ? null
        : Math.max(
            0,
            context.assistanceCap -
              spent,
          );

    if (existing) {
      const balance =
        await gemBalance(
          env,
          owner.calendarAccessId,
        );

      const [
        tipOwned,
        fiftyOwned,
      ] =
        await Promise.all([
          alreadyUnlocked(
            env,
            owner.accountId,
            questionId,
            "TIP",
          ),
          alreadyUnlocked(
            env,
            owner.accountId,
            questionId,
            "FIFTY_FIFTY",
          ),
        ]);

      return json(
        payload(
          guidance,
          tipOwned,
          fiftyOwned,
          capRemainingBefore,
          balance,
        ),
      );
    }

    const cost =
      capReached
        ? 0
        : SINGLE_HELP_COST;

    const balanceBefore =
      await gemBalance(
        env,
        owner.calendarAccessId,
      );

    if (
      cost > 0 &&
      balanceBefore < cost
    ) {
      return json(
        {
          error:
            `This help needs 💎${cost}. Your balance is 💎${balanceBefore}.`,
          gemBalance:
            balanceBefore,
        },
        402,
      );
    }

    const reason =
      assistance === "TIP"
        ? `EDUCATION_AI_TIP:${questionId}`
        : `EDUCATION_FIFTY_FIFTY:${questionId}`;

    try {
      const statements =
        [
          env.gyan_registry
            .prepare(
              `
              INSERT INTO education_guidance_unlocks (
                gyan_account_id,
                question_id,
                assistance_type,
                context_type,
                context_id,
                gem_cost
              )
              VALUES (?, ?, ?, ?, ?, ?)
              `,
            )
            .bind(
              owner.accountId,
              questionId,
              assistance,
              context.type,
              context.id,
              cost,
            ),
        ];

      if (cost > 0) {
        statements.push(
          env.gyan_registry
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
              owner.calendarAccessId,
              -cost,
              reason,
            ),
        );
      }

      await env.gyan_registry.batch(
        statements,
      );
    } catch (caught) {
      console.error(
        "Guided help unlock write failed:",
        caught,
      );

      /*
       * A simultaneous duplicate click may lose the UNIQUE race.
       * If ownership now exists, treat it as success and never
       * charge again.
       */
      const wonElsewhere =
        await alreadyUnlocked(
          env,
          owner.accountId,
          questionId,
          assistance,
        );

      if (!wonElsewhere) {
        return json(
          {
            error:
              "Guided help could not be unlocked.",
          },
          500,
        );
      }
    }

    const [
      balanceAfter,
      spentAfter,
      tipOwnedAfter,
      fiftyOwnedAfter,
    ] =
      await Promise.all([
        gemBalance(
          env,
          owner.calendarAccessId,
        ),
        contextSpend(
          env,
          owner.accountId,
          context,
        ),
        alreadyUnlocked(
          env,
          owner.accountId,
          questionId,
          "TIP",
        ),
        alreadyUnlocked(
          env,
          owner.accountId,
          questionId,
          "FIFTY_FIFTY",
        ),
      ]);

    const capRemainingAfter =
      context.assistanceCap == null
        ? null
        : Math.max(
            0,
            context.assistanceCap -
              spentAfter,
          );

    return json(
      payload(
        guidance,
        tipOwnedAfter,
        fiftyOwnedAfter,
        capRemainingAfter,
        balanceAfter,
      ),
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
