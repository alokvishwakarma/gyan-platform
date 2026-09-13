import {
  getAdminSession,
} from "./adminAuth";

import {
  createAdminLiveTest,
  maintainLiveTestInventory,
  switchLiveTestVisibility,
} from "./liveTestScheduler";

import {
  generateBatch,
  generateClassBatch,
  listBatchCatalog,
  previewBatch,
  previewClassBatch,
} from "./liveTestBatchManager";




type VisibilityMode =
  | "AUTO"
  | "SHOW"
  | "HIDE";


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


async function requireAdmin(
  request:
    Request,

  env:
    Env,
): Promise<Response | null> {
  const session =
    await getAdminSession(
      request,
      env,
    );

  if (session) {
    return null;
  }

  return json(
    {
      error:
        "Administrator authentication is required.",
    },
    401,
  );
}


function isVisibilityMode(
  value:
    unknown,
): value is VisibilityMode {
  return (
    value ===
      "AUTO" ||
    value ===
      "SHOW" ||
    value ===
      "HIDE"
  );
}


function validLocalTime(
  value:
    unknown,
): value is string {
  return (
    typeof value ===
      "string" &&
    /^(?:[01]\d|2[0-3]):[0-5]\d$/
      .test(
        value,
      )
  );
}


function dateInTimeZone(
  value: Date,
  timeZone: string,
): string {
  const parts =
    new Intl.DateTimeFormat(
      "en-CA",
      {
        timeZone,
        year: "numeric",
        month: "2-digit",
        day: "2-digit",
      },
    )
      .formatToParts(
        value,
      );

  const read =
    (
      type:
        Intl.DateTimeFormatPartTypes,
    ): string =>
      parts.find(
        (
          part,
        ) =>
          part.type === type,
      )?.value ??
      "";

  return `${read("year")}-${read("month")}-${read("day")}`;
}


function localClock(
  value:
    Date,

  timeZone:
    string,
): {
  date:
    string;

  time:
    string;
} {
  const parts =
    new Intl.DateTimeFormat(
      "en-CA",
      {
        timeZone,
        year:
          "numeric",
        month:
          "2-digit",
        day:
          "2-digit",
        hour:
          "2-digit",
        minute:
          "2-digit",
        hourCycle:
          "h23",
      },
    )
      .formatToParts(
        value,
      );

  const read =
    (
      type:
        Intl.DateTimeFormatPartTypes,
    ): string =>
      parts.find(
        (
          part,
        ) =>
          part.type ===
          type,
      )?.value ??
      "";

  return {
    date:
      `${read("year")}-${read("month")}-${read("day")}`,

    time:
      `${read("hour")}:${read("minute")}`,
  };
}


function localDateTimeToUtc(
  date:
    string,

  time:
    string,

  timeZone:
    string,
): Date {
  const [
    year,
    month,
    day,
  ] =
    date
      .split("-")
      .map(
        Number,
      );

  const [
    hour,
    minute,
  ] =
    time
      .split(":")
      .map(
        Number,
      );

  const desired =
    Date.UTC(
      year,
      month - 1,
      day,
      hour,
      minute,
      0,
    );

  let guess =
    desired;

  const formatter =
    new Intl.DateTimeFormat(
      "en-CA",
      {
        timeZone,
        year:
          "numeric",
        month:
          "2-digit",
        day:
          "2-digit",
        hour:
          "2-digit",
        minute:
          "2-digit",
        second:
          "2-digit",
        hourCycle:
          "h23",
      },
    );

  for (
    let pass =
      0;
    pass <
      3;
    pass +=
      1
  ) {
    const parts =
      formatter
        .formatToParts(
          new Date(
            guess,
          ),
        );

    const read =
      (
        type:
          Intl.DateTimeFormatPartTypes,
      ): number =>
        Number(
          parts.find(
            (
              part,
            ) =>
              part.type ===
              type,
          )?.value ??
          0,
        );

    const represented =
      Date.UTC(
        read(
          "year",
        ),
        read(
          "month",
        ) -
          1,
        read(
          "day",
        ),
        read(
          "hour",
        ),
        read(
          "minute",
        ),
        read(
          "second",
        ),
      );

    const correction =
      desired -
      represented;

    if (
      Math.abs(
        correction,
      ) <
      1000
    ) {
      break;
    }

    guess +=
      correction;
  }

  return new Date(
    guess,
  );
}


function utcSql(
  value:
    Date,
): string {
  return value
    .toISOString()
    .replace(
      "T",
      " ",
    )
    .replace(
      /\.\d{3}Z$/,
      "",
    );
}


async function listSchedule(
  env:
    Env,

  url:
    URL,
): Promise<Response> {
  const requestedProgram =
    (
      url.searchParams
        .get(
          "program",
        ) ??
      ""
    )
      .trim()
      .toUpperCase();

  const program =
    (
      requestedProgram ===
        "JEE" ||
      requestedProgram ===
        "NEET" ||
      requestedProgram ===
        "SAT"
    )
      ? requestedProgram
      : "";

  const rows =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          lt.id,
          lt.public_code,
          lt.program_code,
          lt.source_schedule_date,
          lt.starts_at_utc,
          lt.schedule_timezone,
          lt.duration_minutes,
          lt.visible,
          lt.visibility_mode,
          lt.status,
          lt.event_kind,
          lt.created_at,
          lt.admin_modified_at,

          COUNT(
            q.question_id
          ) AS frozen_questions,

          CASE
            WHEN COALESCE(p.question_count, 0) <= 0 THEN 0
            ELSE MAX(
              1,
              ROUND(
                p.question_count *
                COALESCE(lt.test_fraction_percent, p.test_fraction_percent, 100) /
                MAX(1, COALESCE(p.test_fraction_percent, 100))
              )
            )
          END AS expected_questions

        FROM education_live_tests lt

        LEFT JOIN education_live_test_questions q
          ON q.live_test_id =
             lt.id

        LEFT JOIN education_live_test_policy p
          ON p.program_code =
             lt.program_code

        WHERE
          COALESCE(
            lt.event_kind,
            'WEEKDAY'
          ) <> 'ADMIN_TEST'

          AND (
            ? = ''
            OR lt.program_code = ?
          )

        GROUP BY
          lt.id

        ORDER BY
          lt.source_schedule_date DESC,
          lt.starts_at_utc DESC,
          lt.public_code DESC

        LIMIT 2000
        `,
      )
      .bind(
        program,
        program,
      )
      .all<{
        id:
          number;

        public_code:
          string;

        program_code:
          string;

        source_schedule_date:
          string | null;

        starts_at_utc:
          string;

        schedule_timezone:
          string;

        duration_minutes:
          number;

        visible:
          number;

        visibility_mode:
          string;

        status:
          string;

        event_kind:
          string | null;

        created_at:
          string;

        admin_modified_at:
          string | null;

        frozen_questions:
          number;

        expected_questions:
          number;
      }>();

  const policyRows =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          program_code,
          country_code,
          schedule_timezone,
          test_start_local,
          duration_minutes,
          question_count,
          test_fraction_percent,
          active
        FROM education_live_test_policy
        ORDER BY
          country_code,
          program_code
        `,
      )
      .all<{
        program_code:
          string;

        country_code:
          string;

        schedule_timezone:
          string;

        test_start_local:
          string;

        duration_minutes:
          number;

        question_count:
          number;

        test_fraction_percent:
          number;

        active:
          number;
      }>();

  return json({
    policies:
      policyRows.results.map(
        (
          row,
        ) => ({
          program:
            row.program_code,

          country:
            row.country_code,

          scheduleTimezone:
            row.schedule_timezone,

          localTime:
            row.test_start_local,

          durationMinutes:
            Number(
              row.duration_minutes,
            ),

          questionCount:
            Number(
              row.question_count,
            ),

          testFractionPercent:
            Number(
              row.test_fraction_percent,
            ),

          active:
            Number(
              row.active,
            ) ===
            1,
        }),
      ),

    tests:
      rows.results.map(
        (
          row,
        ) => {
          const startMs =
            Date.parse(
              row
                .starts_at_utc
                .replace(
                  " ",
                  "T",
                ) +
              "Z",
            );

          const local =
            Number.isFinite(
              startMs,
            )
              ? localClock(
                  new Date(
                    startMs,
                  ),
                  row
                    .schedule_timezone,
                )
              : {
                  date:
                    row
                      .source_schedule_date ??
                    "",
                  time:
                    "",
                };

          return {
            id:
              Number(
                row.id,
              ),

            code:
              row
                .public_code,

            program:
              row
                .program_code,

            scheduleDate:
              row
                .source_schedule_date,

            scheduleTimezone:
              row
                .schedule_timezone,

            localDate:
              local.date,

            localTime:
              local.time,

            startsAtUtc:
              row
                .starts_at_utc,

            durationMinutes:
              Number(
                row
                  .duration_minutes,
              ),

            visible:
              Number(
                row.visible,
              ) ===
              1,

            visibilityMode:
              isVisibilityMode(
                row
                  .visibility_mode,
              )
                ? row
                    .visibility_mode
                : "AUTO",

            status:
              row.status,

            eventKind:
              row.event_kind,

            createdAt:
              row.created_at,

            adminModifiedAt:
              row.admin_modified_at,

            frozenQuestions:
              Number(
                row
                  .frozen_questions,
              ),

            expectedQuestions:
              Number(
                row
                  .expected_questions,
              ),

            ready:
              Number(
                row
                  .expected_questions,
              ) >
                0 &&
              Number(
                row
                  .frozen_questions,
              ) ===
                Number(
                  row
                    .expected_questions,
                ),
          };
        },
      ),
  });
}


async function reviewQuestions(
  env:
    Env,

  code:
    string,
): Promise<Response> {
  const test =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          public_code,
          program_code,
          source_schedule_date,
          starts_at_utc,
          schedule_timezone,
          duration_minutes,
          visible,
          visibility_mode
        FROM education_live_tests
        WHERE
          public_code = ?
          AND COALESCE(
            event_kind,
            'WEEKDAY'
          ) <> 'ADMIN_TEST'
        LIMIT 1
        `,
      )
      .bind(
        code,
      )
      .first<{
        id:
          number;

        public_code:
          string;

        program_code:
          string;

        source_schedule_date:
          string | null;

        starts_at_utc:
          string;

        schedule_timezone:
          string;

        duration_minutes:
          number;

        visible:
          number;

        visibility_mode:
          string;
      }>();

  if (!test) {
    return json(
      {
        error:
          "Live Test was not found.",
      },
      404,
    );
  }

  const rows =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          lq.question_order,
          lq.section_code,
          lq.source_subject_code,
          lq.source_topic_code,
          lq.selection_reason,

          q.id AS question_id,
          q.question_key,
          q.difficulty,
          q.question_text,
          q.choice_a,
          q.choice_b,
          q.choice_c,
          q.choice_d,
          q.correct_choice,
          q.explanation

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

        source_subject_code:
          string | null;

        source_topic_code:
          string | null;

        selection_reason:
          string;

        question_id:
          number;

        question_key:
          string;

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

        correct_choice:
          string;

        explanation:
          string | null;
      }>();

  return json({
    test: {
      id:
        Number(
          test.id,
        ),

      code:
        test.public_code,

      program:
        test.program_code,

      scheduleDate:
        test.source_schedule_date,

      startsAtUtc:
        test.starts_at_utc,

      scheduleTimezone:
        test.schedule_timezone,

      durationMinutes:
        Number(
          test.duration_minutes,
        ),

      visible:
        Number(
          test.visible,
        ) ===
        1,

      visibilityMode:
        isVisibilityMode(
          test.visibility_mode,
        )
          ? test.visibility_mode
          : "AUTO",
    },

    questions:
      rows.results.map(
        (
          row,
        ) => ({
          order:
            Number(
              row.question_order,
            ),

          questionId:
            Number(
              row.question_id,
            ),

          questionKey:
            row.question_key,

          section:
            row.section_code,

          subject:
            row.source_subject_code,

          topic:
            row.source_topic_code,

          selectionReason:
            row.selection_reason,

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

          correctChoice:
            row.correct_choice,

          explanation:
            row.explanation,
        }),
      ),
  });
}


async function updateSchedule(
  request:
    Request,

  env:
    Env,

  code:
    string,
): Promise<Response> {
  let body:
    {
      visibilityMode?:
        unknown;

      localTime?:
        unknown;

      durationMinutes?:
        unknown;
    };

  try {
    body =
      await request.json();
  } catch {
    return json(
      {
        error:
          "Invalid JSON body.",
      },
      400,
    );
  }

  const current =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          lt.id,
          lt.public_code,
          lt.program_code,
          lt.source_schedule_date,
          lt.starts_at_utc,
          lt.schedule_timezone,
          lt.duration_minutes,
          lt.visible,
          lt.visibility_mode,

          COUNT(
            q.question_id
          ) AS frozen_questions,

          COALESCE(
            p.question_count,
            0
          ) AS expected_questions

        FROM education_live_tests lt

        LEFT JOIN education_live_test_questions q
          ON q.live_test_id =
             lt.id

        LEFT JOIN education_live_test_policy p
          ON p.program_code =
             lt.program_code

        WHERE
          lt.public_code = ?

          AND COALESCE(
            lt.event_kind,
            'WEEKDAY'
          ) <> 'ADMIN_TEST'

        GROUP BY
          lt.id

        LIMIT 1
        `,
      )
      .bind(
        code,
      )
      .first<{
        id:
          number;

        public_code:
          string;

        program_code:
          string;

        source_schedule_date:
          string | null;

        starts_at_utc:
          string;

        schedule_timezone:
          string;

        duration_minutes:
          number;

        visible:
          number;

        visibility_mode:
          string;

        frozen_questions:
          number;

        expected_questions:
          number;
      }>();

  if (!current) {
    return json(
      {
        error:
          "Live Test was not found.",
      },
      404,
    );
  }

  const visibilityMode =
    body.visibilityMode ===
      undefined
      ? (
          isVisibilityMode(
            current
              .visibility_mode,
          )
            ? current
                .visibility_mode
            : "AUTO"
        )
      : (
          isVisibilityMode(
            body
              .visibilityMode,
          )
            ? body
                .visibilityMode
            : null
        );

  if (!visibilityMode) {
    return json(
      {
        error:
          "visibilityMode must be AUTO, SHOW, or HIDE.",
      },
      400,
    );
  }

  const durationMinutes =
    body.durationMinutes ===
      undefined
      ? Number(
          current
            .duration_minutes,
        )
      : Number(
          body
            .durationMinutes,
        );

  if (
    !Number.isInteger(
      durationMinutes,
    ) ||
    durationMinutes <
      1 ||
    durationMinutes >
      480
  ) {
    return json(
      {
        error:
          "Duration must be between 1 and 480 minutes.",
      },
      400,
    );
  }

  const localTime =
    body.localTime ===
      undefined
      ? null
      : (
          validLocalTime(
            body
              .localTime,
          )
            ? body
                .localTime
            : ""
        );

  if (
    body.localTime !==
      undefined &&
    !localTime
  ) {
    return json(
      {
        error:
          "localTime must use HH:mm.",
      },
      400,
    );
  }

  const ready =
    Number(
      current
        .expected_questions,
    ) >
      0 &&
    Number(
      current
        .frozen_questions,
    ) ===
      Number(
        current
          .expected_questions,
      );

  if (
    visibilityMode ===
      "SHOW" &&
    !ready
  ) {
    return json(
      {
        error:
          "This test cannot be forced visible until its frozen question set is complete.",
      },
      409,
    );
  }

  let startsAtUtc =
    current
      .starts_at_utc;

  if (localTime) {
    const scheduleDate =
      current
        .source_schedule_date;

    if (!scheduleDate) {
      return json(
        {
          error:
            "This Live Test does not have a schedule date.",
        },
        409,
      );
    }

    startsAtUtc =
      utcSql(
        localDateTimeToUtc(
          scheduleDate,
          localTime,
          current
            .schedule_timezone,
        ),
      );
  }

  // eslint-disable-next-line no-useless-assignment
  let visible =
    Number(
      current.visible,
    );

  if (
    visibilityMode ===
      "SHOW"
  ) {
    visible =
      1;
  } else if (
    visibilityMode ===
      "HIDE"
  ) {
    visible =
      0;
  } else {
    const localToday =
      localClock(
        new Date(),
        current
          .schedule_timezone,
      ).date;

    visible =
      (
        ready &&
        current
          .source_schedule_date ===
          localToday
      )
        ? 1
        : 0;
  }

  await env.gyan_registry
    .prepare(
      `
      UPDATE education_live_tests
      SET
        starts_at_utc = ?,
        duration_minutes = ?,
        visibility_mode = ?,
        visible = ?,
        updated_at =
          CURRENT_TIMESTAMP,
        admin_modified_at =
          CURRENT_TIMESTAMP
      WHERE id = ?
      `,
    )
    .bind(
      startsAtUtc,
      durationMinutes,
      visibilityMode,
      visible,
      current.id,
    )
    .run();

  return json({
    updated:
      true,

    code:
      current
        .public_code,

    startsAtUtc,

    durationMinutes,

    visibilityMode,

    visible:
      visible ===
      1,
  });
}




async function deleteScheduleTest(
  env:
    Env,

  code:
    string,
): Promise<Response> {
  const current =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          public_code,
          event_kind,
          source_schedule_date,
          schedule_timezone
        FROM education_live_tests
        WHERE public_code = ?
        LIMIT 1
        `,
      )
      .bind(
        code,
      )
      .first<{
        id:
          number;

        public_code:
          string;

        event_kind:
          string | null;

        source_schedule_date:
          string | null;

        schedule_timezone:
          string;
      }>();

  if (!current) {
    return json(
      {
        error:
          "Live Test was not found.",
      },
      404,
    );
  }

  if (
    current.event_kind !==
      "ADMIN_AD_HOC"
  ) {
    return json(
      {
        error:
          "Only admin-created sample/ad-hoc Live Tests can be deleted here. Recreate automatic tests from Live Test Batch settings.",
      },
      409,
    );
  }

  const today =
    dateInTimeZone(
      new Date(),
      current.schedule_timezone,
    );

  if (
    current.source_schedule_date &&
    current.source_schedule_date < today
  ) {
    return json(
      {
        error:
          "Historical Live Tests are protected and cannot be deleted.",
      },
      409,
    );
  }

  await env.gyan_registry
    .prepare(
      `
      DELETE FROM education_live_tests
      WHERE id = ?
      `,
    )
    .bind(
      current.id,
    )
    .run();

  return json({
    deleted:
      true,

    code:
      current.public_code,
  });
}


async function createScheduleTest(
  request: Request,
  env: Env,
): Promise<Response> {
  let body: {
    scheduleDate?: unknown;
    program?: unknown;
    localTime?: unknown;
    durationMinutes?: unknown;
    fractionPercent?: unknown;
  };

  try {
    body = await request.json() as typeof body;
  } catch {
    return json({ error: "Invalid JSON body." }, 400);
  }

  const scheduleDate =
    typeof body.scheduleDate === "string" ? body.scheduleDate.trim() : "";
  const program =
    typeof body.program === "string" ? body.program.trim().toUpperCase() : "";
  const localTime =
    typeof body.localTime === "string" ? body.localTime.trim() : "";
  const durationMinutes = Number(body.durationMinutes);
  const fractionPercent = Number(body.fractionPercent);

  if (!/^\d{4}-\d{2}-\d{2}$/.test(scheduleDate)) {
    return json({ error: "A valid schedule date is required." }, 400);
  }
  if (!["JEE", "NEET", "SAT"].includes(program)) {
    return json({ error: "Unsupported Live Test program." }, 400);
  }
  if (!validLocalTime(localTime)) {
    return json({ error: "A valid start time is required." }, 400);
  }
  if (!Number.isFinite(fractionPercent) || fractionPercent < 5 || fractionPercent > 100) {
    return json({ error: "Question percentage must be between 5% and 100%." }, 400);
  }

  try {
    const created = await createAdminLiveTest(env, {
      scheduleDate,
      programCode: program,
      localTime,
      durationMinutes,
      fractionPercent,
    });

    await switchLiveTestVisibility(env);

    return json({ created: true, ...created }, 201);
  } catch (error) {
    return json(
      { error: error instanceof Error ? error.message : "Live Test could not be created." },
      409,
    );
  }
}

export async function handleAdminLiveTestScheduleRoute(
  request:
    Request,

  env:
    Env,

  url:
    URL,
): Promise<Response | null> {
  const isScheduleRoute =
    url.pathname.startsWith(
      "/api/admin/live-tests/schedule",
    );

  const isRebuildRoute =
    url.pathname ===
      "/api/admin/live-tests/rebuild-inventory";

  const isBatchRoute =
    url.pathname.startsWith(
      "/api/admin/live-tests/batches",
    );

  if (
    !isScheduleRoute &&
    !isRebuildRoute &&
    !isBatchRoute
  ) {
    return null;
  }

  const authError =
    await requireAdmin(
      request,
      env,
    );

  if (authError) {
    return authError;
  }

  if (
    request.method === 'GET' &&
    url.pathname === '/api/admin/live-tests/batches'
  ) {
    try {
      return json(await listBatchCatalog(env));
    } catch (error) {
      return json({ error: error instanceof Error ? error.message : 'Batch catalog could not be loaded.' }, 500);
    }
  }

  if (
    request.method === 'GET' &&
    url.pathname === '/api/admin/live-tests/batches/preview'
  ) {
    const program = (url.searchParams.get('program') ?? '').trim().toUpperCase();
    const batchCode = (url.searchParams.get('batchCode') ?? '').trim().toUpperCase();
    try {
      return json(await previewBatch(env, program, batchCode));
    } catch (error) {
      return json({ error: error instanceof Error ? error.message : 'Batch preview could not be loaded.' }, 400);
    }
  }

  if (
    request.method === 'GET' &&
    url.pathname === '/api/admin/live-tests/batches/classes/preview'
  ) {
    const program = (url.searchParams.get('program') ?? '').trim().toUpperCase();
    const batchCode = (url.searchParams.get('batchCode') ?? '').trim().toUpperCase();
    try {
      return json(await previewClassBatch(env, program, batchCode));
    } catch (error) {
      return json({
        error: error instanceof Error
          ? error.message
          : 'Class batch preview could not be loaded.',
      }, 400);
    }
  }

  if (
    request.method === 'POST' &&
    url.pathname === '/api/admin/live-tests/batches/classes/generate'
  ) {
    let body: {
      program?: unknown;
      batchCode?: unknown;
      recreate?: unknown;
    };
    try {
      body = await request.json() as typeof body;
    } catch {
      return json({ error: 'Invalid JSON body.' }, 400);
    }

    const program =
      typeof body.program === 'string'
        ? body.program.trim().toUpperCase()
        : '';
    const batchCode =
      typeof body.batchCode === 'string'
        ? body.batchCode.trim().toUpperCase()
        : '';

    const recreate =
      body.recreate === true;

    try {
      return json({
        ok: true,
        ...(await generateClassBatch(
          env,
          program,
          batchCode,
          recreate,
        )),
      });
    } catch (error) {
      return json({
        error: error instanceof Error
          ? error.message
          : 'Class batch generation failed.',
      }, 409);
    }
  }


  if (
    request.method === 'POST' &&
    url.pathname === '/api/admin/live-tests/batches/generate'
  ) {
    let body: { program?: unknown; batchCode?: unknown; recreate?: unknown };
    try {
      body = await request.json() as typeof body;
    } catch {
      return json({ error: 'Invalid JSON body.' }, 400);
    }
    const program = typeof body.program === 'string' ? body.program.trim().toUpperCase() : '';
    const batchCode = typeof body.batchCode === 'string' ? body.batchCode.trim().toUpperCase() : '';
    const recreate = body.recreate === true;
    try {
      const result = await generateBatch(env, program, batchCode, recreate);
      await switchLiveTestVisibility(env);
      return json({ ok: true, ...result });
    } catch (error) {
      return json({ error: error instanceof Error ? error.message : 'Batch generation failed.' }, 409);
    }
  }

  if (
    request.method ===
      "POST" &&
    isRebuildRoute
  ) {
    try {
      await maintainLiveTestInventory(
        env,
        14,
      );

      await switchLiveTestVisibility(
        env,
      );

      return json({
        ok:
          true,

        days:
          14,
      });
    } catch (
      error
    ) {
      console.error(
        "Admin Live Test inventory rebuild failed:",
        error,
      );

      return json(
        {
          error:
            error instanceof
              Error
              ? error.message
              : "Live Test inventory rebuild failed.",
        },
        500,
      );
    }
  }


  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/admin/live-tests/schedule"
  ) {
    return createScheduleTest(
      request,
      env,
    );
  }


  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/admin/live-tests/schedule"
  ) {
    return listSchedule(
      env,
      url,
    );
  }

  const questionsMatch =
    url.pathname.match(
      /^\/api\/admin\/live-tests\/schedule\/([A-Za-z0-9_-]+)\/questions$/,
    );

  if (
    request.method ===
      "GET" &&
    questionsMatch
  ) {
    return reviewQuestions(
      env,
      questionsMatch[1]
        .toUpperCase(),
    );
  }


  const match =
    url.pathname.match(
      /^\/api\/admin\/live-tests\/schedule\/([A-Za-z0-9_-]+)$/,
    );

  if (
    request.method ===
      "DELETE" &&
    match
  ) {
    return deleteScheduleTest(
      env,
      match[1]
        .toUpperCase(),
    );
  }


  if (
    request.method ===
      "PATCH" &&
    match
  ) {
    return updateSchedule(
      request,
      env,
      match[1]
        .toUpperCase(),
    );
  }

  return json(
    {
      error:
        "Method or route not allowed.",
    },
    405,
  );
}
