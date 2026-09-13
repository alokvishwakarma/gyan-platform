/*
 * worker/liveTestScheduler.ts
 *
 * GYAN Live Test two-stage automation.
 *
 * Daily builder:
 *   maintainLiveTestInventory(env, 14)
 *
 * Hourly switcher:
 *   switchLiveTestVisibility(env)
 */

export interface LiveTestSchedulerEnv {
  gyan_registry: D1Database;
}

type PolicyRow = {
  program_code: string;
  series_suffix: string;
  schedule_timezone: string;
  test_start_local: string;
  duration_minutes: number;
  question_count: number;
  entry_gem_cost: number;
  report_gem_cost: number;
  test_fraction_percent: number;
  series_epoch_date: string;
  series_epoch_number: number;
};

export type SubjectPolicyRow = {
  subject_code: string;
  question_count: number;
  sort_order: number;
};

export type ClassRow = {
  id: number;
  subject_code: string;
  topic_code: string | null;
  topic_name: string;
  sequence_number: number;
};

type TestRow = {
  id: number;
  public_code: string;
};

function datePartsInZone(
  value: Date,
  timeZone: string,
): { date: string; time: string } {
  const parts =
    new Intl.DateTimeFormat(
      "en-CA",
      {
        timeZone,
        year: "numeric",
        month: "2-digit",
        day: "2-digit",
        hour: "2-digit",
        minute: "2-digit",
        hourCycle: "h23",
      },
    ).formatToParts(value);

  const get = (
    type: Intl.DateTimeFormatPartTypes,
  ): string =>
    parts.find((part) => part.type === type)?.value ?? "";

  return {
    date: `${get("year")}-${get("month")}-${get("day")}`,
    time: `${get("hour")}:${get("minute")}`,
  };
}

function addDays(
  date: string,
  amount: number,
): string {
  const [year, month, day] =
    date.split("-").map(Number);

  return new Date(
    Date.UTC(
      year,
      month - 1,
      day + amount,
    ),
  )
    .toISOString()
    .slice(0, 10);
}

function dayDifference(
  fromDate: string,
  toDate: string,
): number {
  const parse = (date: string): number => {
    const [year, month, day] =
      date.split("-").map(Number);

    return Date.UTC(
      year,
      month - 1,
      day,
    );
  };

  return Math.round(
    (parse(toDate) - parse(fromDate)) /
      86400000,
  );
}

function weekdayUtc(
  date: string,
): number {
  return new Date(
    `${date}T12:00:00Z`,
  ).getUTCDay();
}


function automaticFractionForDate(
  date: string,
): number {
  const day =
    weekdayUtc(
      date,
    );

  if (day === 0) {
    return 50;
  }

  return day === 6
    ? 20
    : 10;
}



function liveTestFormulaCost(
  percentage:
    number,
): number {
  const safePercent =
    Math.max(
      1,
      Number(
        percentage,
      ),
    );

  return (
    5 *
    Math.floor(
      (
        20 *
        Math.log10(
          safePercent,
        )
      ) /
      5,
    )
  );
}


function liveTestParticipationCost(
  percentage:
    number,
): number {
  return Math.max(
    1,
    Math.floor(
      liveTestFormulaCost(
        percentage,
      ) *
      0.25,
    ),
  );
}


function liveTestResultCost(
  percentage:
    number,
): number {
  return liveTestFormulaCost(
    percentage,
  );
}




function scaledValue(
  baseValue: number,
  baseFraction: number,
  targetFraction: number,
): number {
  return Math.max(
    1,
    Math.round(
      Number(baseValue) *
      Number(targetFraction) /
      Math.max(
        1,
        Number(baseFraction),
      ),
    ),
  );
}


async function weeklyClassRows(
  env: LiveTestSchedulerEnv,
  weekendDate: string,
  programCode: string,
): Promise<ClassRow[]> {
  const day =
    weekdayUtc(
      weekendDate,
    );

  const mondayOffset =
    day === 0
      ? -6
      : -5;

  const fridayOffset =
    day === 0
      ? -2
      : -1;

  const monday =
    addDays(
      weekendDate,
      mondayOffset,
    );

  const friday =
    addDays(
      weekendDate,
      fridayOffset,
    );

  const result =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          subject_code,
          topic_code,
          topic_name,
          sequence_number
        FROM education_live_class_schedule
        WHERE
          schedule_date BETWEEN ? AND ?
          AND program_code = ?
          AND active = 1
        ORDER BY
          schedule_date,
          sequence_number,
          id
        `,
      )
      .bind(
        monday,
        friday,
        programCode,
      )
      .all<ClassRow>();

  return result.results;
}


async function classRowsForAutomaticTest(
  env: LiveTestSchedulerEnv,
  scheduleDate: string,
  programCode: string,
): Promise<ClassRow[]> {
  const day =
    weekdayUtc(
      scheduleDate,
    );

  return (
    day === 6 ||
    day === 0
  )
    ? weeklyClassRows(
        env,
        scheduleDate,
        programCode,
      )
    : classRows(
        env,
        scheduleDate,
        programCode,
      );
}


function localDateTimeToUtc(
  date: string,
  time: string,
  timeZone: string,
): Date {
  const [year, month, day] =
    date.split("-").map(Number);

  const [hour, minute] =
    time.split(":").map(Number);

  const desired =
    Date.UTC(
      year,
      month - 1,
      day,
      hour,
      minute,
      0,
    );

  let guess = desired;

  const formatter =
    new Intl.DateTimeFormat(
      "en-CA",
      {
        timeZone,
        year: "numeric",
        month: "2-digit",
        day: "2-digit",
        hour: "2-digit",
        minute: "2-digit",
        second: "2-digit",
        hourCycle: "h23",
      },
    );

  for (
    let pass = 0;
    pass < 3;
    pass += 1
  ) {
    const parts =
      formatter.formatToParts(
        new Date(guess),
      );

    const read = (
      type: Intl.DateTimeFormatPartTypes,
    ): number =>
      Number(
        parts.find(
          (part) => part.type === type,
        )?.value ?? 0,
      );

    const represented =
      Date.UTC(
        read("year"),
        read("month") - 1,
        read("day"),
        read("hour"),
        read("minute"),
        read("second"),
      );

    const correction =
      desired - represented;

    if (Math.abs(correction) < 1000) {
      break;
    }

    guess += correction;
  }

  return new Date(guess);
}

function utcSql(
  value: Date,
): string {
  return value
    .toISOString()
    .replace("T", " ")
    .replace(/\.\d{3}Z$/, "");
}

async function policies(
  env: LiveTestSchedulerEnv,
): Promise<PolicyRow[]> {
  const result =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          program_code,
          series_suffix,
          schedule_timezone,
          test_start_local,
          duration_minutes,
          question_count,
          entry_gem_cost,
          report_gem_cost,
          test_fraction_percent,
          series_epoch_date,
          series_epoch_number
        FROM education_live_test_policy
        WHERE active = 1
        ORDER BY program_code
        `,
      )
      .all<PolicyRow>();

  return result.results;
}

async function subjectPolicies(
  env: LiveTestSchedulerEnv,
  programCode: string,
): Promise<SubjectPolicyRow[]> {
  const result =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          subject_code,
          question_count,
          sort_order
        FROM education_live_test_policy_subjects
        WHERE program_code = ?
        ORDER BY sort_order, subject_code
        `,
      )
      .bind(programCode)
      .all<SubjectPolicyRow>();

  return result.results;
}

async function classRows(
  env: LiveTestSchedulerEnv,
  scheduleDate: string,
  programCode: string,
): Promise<ClassRow[]> {
  const result =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          subject_code,
          topic_code,
          topic_name,
          sequence_number
        FROM education_live_class_schedule
        WHERE
          schedule_date = ?
          AND program_code = ?
          AND active = 1
        ORDER BY
          sequence_number,
          id
        `,
      )
      .bind(
        scheduleDate,
        programCode,
      )
      .all<ClassRow>();

  return result.results;
}

async function mockAnchorId(
  env: LiveTestSchedulerEnv,
  programCode: string,
): Promise<number> {
  const result =
    await env.gyan_registry
      .prepare(
        `
        SELECT id
        FROM education_mock_tests
        WHERE
          program_code = ?
          AND test_kind = 'MINI'
        ORDER BY
          CASE
            WHEN test_code = 'MINI_A'
              THEN 0
            ELSE 1
          END,
          id
        LIMIT 1
        `,
      )
      .bind(programCode)
      .first<{ id: number }>();

  if (!result) {
    throw new Error(
      `No MINI mock-test anchor exists for ${programCode}.`,
    );
  }

  return Number(result.id);
}

async function findOrCreateTest(
  env: LiveTestSchedulerEnv,
  policy: PolicyRow,
  scheduleDate: string,
  options?: {
    fractionPercent?: number;
    durationMinutes?: number;
    eventKind?: string;
    batchCode?: string | null;
  },
): Promise<TestRow> {
  const seriesNumber =
    Number(policy.series_epoch_number) +
    dayDifference(
      policy.series_epoch_date,
      scheduleDate,
    );

  const publicCode =
    `${seriesNumber}${policy.series_suffix}`;

  const existing =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          public_code
        FROM education_live_tests
        WHERE public_code = ?
        LIMIT 1
        `,
      )
      .bind(publicCode)
      .first<TestRow>();

  if (existing) {
    return existing;
  }

  const anchorId =
    await mockAnchorId(
      env,
      policy.program_code,
    );

  const startUtc =
    localDateTimeToUtc(
      scheduleDate,
      policy.test_start_local,
      policy.schedule_timezone,
    );

  const fractionPercent =
    Math.max(
      1,
      Math.round(
        options?.fractionPercent ??
        Number(policy.test_fraction_percent),
      ),
    );

  const durationMinutes =
    Math.max(
      1,
      Math.round(
        options?.durationMinutes ??
        Number(policy.duration_minutes),
      ),
    );

  const eventKind =
    options?.eventKind ??
    'WEEKDAY';

  const batchCode =
    options?.batchCode ??
    null;

  await env.gyan_registry
    .prepare(
      `
      INSERT OR IGNORE INTO education_live_tests (
        series_number,
        series_suffix,
        public_code,
        program_code,
        mock_test_id,
        starts_at_utc,
        schedule_timezone,
        duration_minutes,
        entry_gem_cost,
        report_gem_cost,
        status,
        test_fraction_percent,
        event_kind,
        source_schedule_date,
        visible,
        batch_code
      )
      VALUES (
        ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
        'SCHEDULED', ?, ?, ?, 0, ?
      )
      `,
    )
    .bind(
      seriesNumber,
      policy.series_suffix,
      publicCode,
      policy.program_code,
      anchorId,
      utcSql(startUtc),
      policy.schedule_timezone,
      durationMinutes,
      liveTestParticipationCost(
        fractionPercent,
      ),
      liveTestResultCost(
        fractionPercent,
      ),
      fractionPercent,
      eventKind,
      scheduleDate,
      batchCode,
    )
    .run();

  const saved =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          public_code
        FROM education_live_tests
        WHERE public_code = ?
        LIMIT 1
        `,
      )
      .bind(publicCode)
      .first<TestRow>();

  if (!saved) {
    throw new Error(
      `Unable to create ${publicCode}.`,
    );
  }

  return saved;
}

function splitAcrossRows(
  rows: ClassRow[],
  count: number,
): Map<number, number> {
  const result =
    new Map<number, number>();

  if (
    rows.length === 0 ||
    count <= 0
  ) {
    return result;
  }

  const base =
    Math.floor(
      count / rows.length,
    );

  let extra =
    count % rows.length;

  for (const row of rows) {
    result.set(
      row.id,
      base + (extra > 0 ? 1 : 0),
    );

    if (extra > 0) {
      extra -= 1;
    }
  }

  return result;
}

async function questionCandidates(
  env: LiveTestSchedulerEnv,
  programCode: string,
  slot: ClassRow,
  wanted: number,
  used: ReadonlySet<number>,
): Promise<number[]> {
  const countryCode =
    programCode === "JEE" || programCode === "NEET"
      ? "IN"
      : "US";

  const preferred =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          q.id AS question_id
        FROM education_questions q
        JOIN education_subtopics st
          ON st.id = q.subtopic_id
        JOIN education_topics t
          ON t.id = st.topic_id
        JOIN education_subjects s
          ON s.id = t.subject_id
        LEFT JOIN education_live_test_questions history
          ON history.question_id = q.id
        WHERE
          q.active = 1
          AND s.country_code = ?
          AND s.grade_code = ?
          AND s.subject_code = ?
          AND (
            (
              ? IS NOT NULL
              AND t.topic_code = ?
            )
            OR
            (
              ? IS NULL
              AND lower(t.topic_name) =
                  lower(?)
            )
          )
        GROUP BY q.id
        ORDER BY
          COUNT(history.live_test_id),
          COALESCE(MAX(history.live_test_id), 0),
          CASE lower(q.difficulty)
            WHEN 'medium' THEN 1
            WHEN 'easy' THEN 2
            WHEN 'hard' THEN 3
            WHEN 'challenge' THEN 4
            ELSE 5
          END,
          q.id
        LIMIT ?
        `,
      )
      .bind(
        countryCode,
        `PROGRAM_${programCode}`,
        slot.subject_code,
        slot.topic_code,
        slot.topic_code,
        slot.topic_code,
        slot.topic_name,
        Math.max(wanted * 4, wanted),
      )
      .all<{ question_id: number }>();

  const preferredIds =
    preferred.results
      .map(
        (row) => Number(row.question_id),
      )
      .filter(
        (questionId) =>
          !used.has(questionId),
      );

  /*
   * Some Master Class labels are narrower than the current question-bank
   * taxonomy, and the same topic may appear on several class rows in one
   * weekend paper. Exclude questions already chosen earlier in THIS test
   * before deciding whether the preferred pool is large enough.
   */
  if (preferredIds.length >= wanted) {
    return preferredIds;
  }

  /*
   * Fill a shortfall from the same program + subject, still preferring
   * the least-used Live Test questions and excluding anything already used
   * in the current paper.
   */
  const fallback =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          q.id AS question_id
        FROM education_questions q
        JOIN education_subtopics st
          ON st.id = q.subtopic_id
        JOIN education_topics t
          ON t.id = st.topic_id
        JOIN education_subjects s
          ON s.id = t.subject_id
        LEFT JOIN education_live_test_questions history
          ON history.question_id = q.id
        WHERE
          q.active = 1
          AND s.country_code = ?
          AND s.grade_code = ?
          AND s.subject_code = ?
        GROUP BY q.id
        ORDER BY
          COUNT(history.live_test_id),
          COALESCE(MAX(history.live_test_id), 0),
          CASE lower(q.difficulty)
            WHEN 'medium' THEN 1
            WHEN 'easy' THEN 2
            WHEN 'hard' THEN 3
            WHEN 'challenge' THEN 4
            ELSE 5
          END,
          q.id
        LIMIT ?
        `,
      )
      .bind(
        countryCode,
        `PROGRAM_${programCode}`,
        slot.subject_code,
        Math.max(
          wanted * 12,
          80,
        ),
      )
      .all<{ question_id: number }>();

  const seen = new Set(preferredIds);
  const combined = [...preferredIds];

  for (const row of fallback.results) {
    const questionId = Number(row.question_id);

    if (
      seen.has(questionId) ||
      used.has(questionId)
    ) {
      continue;
    }

    combined.push(questionId);
    seen.add(questionId);

    if (combined.length >= Math.max(wanted * 4, wanted)) {
      break;
    }
  }

  return combined;
}

export async function freezeTest(
  env: LiveTestSchedulerEnv,
  testId: number,
  programCode: string,
  rows: ClassRow[],
  subjectMix: SubjectPolicyRow[],
  requiredTotal: number,
): Promise<number> {
  const current =
    await env.gyan_registry
      .prepare(
        `
        SELECT COUNT(*) AS count
        FROM education_live_test_questions
        WHERE live_test_id = ?
        `,
      )
      .bind(testId)
      .first<{ count: number }>();

  if (
    Number(current?.count ?? 0) ===
    requiredTotal
  ) {
    return requiredTotal;
  }

  await env.gyan_registry
    .prepare(
      `
      DELETE FROM education_live_test_questions
      WHERE live_test_id = ?
      `,
    )
    .bind(testId)
    .run();

  const used =
    new Set<number>();

  const inserts:
    D1PreparedStatement[] = [];

  let questionOrder = 1;

  for (const subject of subjectMix) {
    const slots =
      rows.filter(
        (row) =>
          row.subject_code ===
          subject.subject_code,
      );

    if (slots.length === 0) {
      return 0;
    }

    const allocations =
      splitAcrossRows(
        slots,
        Number(subject.question_count),
      );

    for (const slot of slots) {
      const wanted =
        allocations.get(slot.id) ?? 0;

      if (wanted <= 0) {
        continue;
      }

      const candidates =
        await questionCandidates(
          env,
          programCode,
          slot,
          wanted,
          used,
        );

      const chosen =
        candidates.slice(
          0,
          wanted,
        );

      if (chosen.length !== wanted) {
        await env.gyan_registry
          .prepare(
            `
            DELETE FROM education_live_test_questions
            WHERE live_test_id = ?
            `,
          )
          .bind(testId)
          .run();

        return 0;
      }

      for (const questionId of chosen) {
        used.add(questionId);

        inserts.push(
          env.gyan_registry
            .prepare(
              `
              INSERT INTO education_live_test_questions (
                live_test_id,
                question_id,
                question_order,
                section_code,
                source_subject_code,
                source_topic_code,
                selection_reason
              )
              VALUES (?, ?, ?, ?, ?, ?, 'TOPIC')
              `,
            )
            .bind(
              testId,
              questionId,
              questionOrder,
              slot.subject_code,
              slot.subject_code,
              slot.topic_code,
            ),
        );

        questionOrder += 1;
      }
    }
  }

  if (
    inserts.length !==
    requiredTotal
  ) {
    return 0;
  }

  await env.gyan_registry
    .batch(inserts);

  return inserts.length;
}

async function logGeneration(
  env: LiveTestSchedulerEnv,
  scheduleDate: string,
  programCode: string,
  publicCode: string | null,
  status:
    "READY" |
    "INCOMPLETE" |
    "ERROR" |
    "SKIPPED",
  frozenQuestionCount: number,
  message: string | null,
): Promise<void> {
  await env.gyan_registry
    .prepare(
      `
      INSERT INTO education_live_generation_runs (
        schedule_date,
        program_code,
        public_code,
        status,
        frozen_question_count,
        message
      )
      VALUES (?, ?, ?, ?, ?, ?)
      `,
    )
    .bind(
      scheduleDate,
      programCode,
      publicCode,
      status,
      frozenQuestionCount,
      message,
    )
    .run();
}


function scaledSubjectMix(
  source: SubjectPolicyRow[],
  targetTotal: number,
): SubjectPolicyRow[] {
  const safeTarget =
    Math.max(1, Math.round(targetTotal));
  const baseTotal =
    source.reduce(
      (total, row) => total + Number(row.question_count),
      0,
    );

  if (baseTotal <= 0 || source.length === 0) {
    return [];
  }

  const drafted = source.map((row) => {
    const exact =
      (Number(row.question_count) / baseTotal) * safeTarget;
    const floor = Math.floor(exact);
    return {
      row,
      exact,
      count: floor,
      remainder: exact - floor,
    };
  });

  let remaining =
    safeTarget - drafted.reduce((sum, item) => sum + item.count, 0);

  drafted
    .sort((a, b) =>
      b.remainder - a.remainder ||
      Number(a.row.sort_order) - Number(b.row.sort_order),
    )
    .forEach((item) => {
      if (remaining > 0) {
        item.count += 1;
        remaining -= 1;
      }
    });

  return drafted
    .sort((a, b) => Number(a.row.sort_order) - Number(b.row.sort_order))
    .map((item) => ({
      ...item.row,
      question_count: item.count,
    }))
    .filter((item) => Number(item.question_count) > 0);
}

export async function createAdminLiveTest(
  env: LiveTestSchedulerEnv,
  input: {
    scheduleDate: string;
    programCode: string;
    localTime: string;
    durationMinutes: number;
    fractionPercent: number;
  },
): Promise<{
  code: string;
  frozenQuestions: number;
  expectedQuestions: number;
  durationMinutes: number;
}> {
  const programCode = input.programCode.trim().toUpperCase();
  const activePolicies = await policies(env);
  const policy = activePolicies.find(
    (item) => item.program_code === programCode,
  );

  if (!policy) {
    throw new Error(`No active Live Test policy exists for ${programCode}.`);
  }

  const existing =
    await env.gyan_registry
      .prepare(
        `
        SELECT public_code
        FROM education_live_tests
        WHERE source_schedule_date = ?
          AND program_code = ?
          AND COALESCE(event_kind, 'WEEKDAY') <> 'ADMIN_TEST'
        LIMIT 1
        `,
      )
      .bind(input.scheduleDate, programCode)
      .first<{ public_code: string }>();

  if (existing) {
    throw new Error(
      `${programCode} already has Live Test #${existing.public_code} on ${input.scheduleDate}.`,
    );
  }

  const schedule =
    await classRows(env, input.scheduleDate, programCode);
  if (schedule.length === 0) {
    throw new Error(
      `No ${programCode} class topics exist on ${input.scheduleDate}; add/copy the class schedule first so questions can be generated from it.`,
    );
  }

  const baseMix = await subjectPolicies(env, programCode);
  const baseFraction = Math.max(1, Number(policy.test_fraction_percent));
  const fractionPercent = Math.min(100, Math.max(5, Math.round(input.fractionPercent)));
  const expectedQuestions = Math.max(
    1,
    Math.round(Number(policy.question_count) * fractionPercent / baseFraction),
  );
  const durationMinutes = scaledValue(
    Number(policy.duration_minutes),
    baseFraction,
    fractionPercent,
  );

  /*
   * A manually-created admin smoke test may intentionally have only one
   * sample class/subject on the date, for example:
   *   JEE / Physics / topic "Test"
   *
   * For ADMIN_AD_HOC creation, scale the question mix only across subjects
   * represented by that day's class rows. The normal automatic/batch paths
   * still use the full configured exam subject mix.
   */
  const scheduledSubjects =
    new Set(
      schedule.map(
        (
          row,
        ) =>
          row.subject_code,
      ),
    );

  const adHocBaseMix =
    baseMix.filter(
      (
        row,
      ) =>
        scheduledSubjects.has(
          row.subject_code,
        ),
    );

  if (
    adHocBaseMix.length ===
      0
  ) {
    throw new Error(
      `The ${programCode} sample classes do not match a configured Live Test subject.`,
    );
  }

  const mix =
    scaledSubjectMix(
      adHocBaseMix,
      expectedQuestions,
    );

  if (mix.reduce((sum, row) => sum + Number(row.question_count), 0) !== expectedQuestions) {
    throw new Error('Unable to scale the subject mix for this Live Test.');
  }

  const seriesNumber =
    Number(policy.series_epoch_number) +
    dayDifference(policy.series_epoch_date, input.scheduleDate);
  const baseCode = `${seriesNumber}${policy.series_suffix}`;
  let publicCode = baseCode;
  for (let suffix = 0; suffix < 26; suffix += 1) {
    const found =
      await env.gyan_registry
        .prepare('SELECT id FROM education_live_tests WHERE public_code = ? LIMIT 1')
        .bind(publicCode)
        .first<{ id: number }>();
    if (!found) break;
    publicCode = `${baseCode}${String.fromCharCode(65 + suffix)}`;
  }

  const anchorId = await mockAnchorId(env, programCode);
  const startUtc = localDateTimeToUtc(
    input.scheduleDate,
    input.localTime,
    policy.schedule_timezone,
  );

  await env.gyan_registry
    .prepare(
      `
      INSERT INTO education_live_tests (
        series_number, series_suffix, public_code, program_code,
        mock_test_id, starts_at_utc, schedule_timezone, duration_minutes,
        entry_gem_cost, report_gem_cost, status, test_fraction_percent,
        event_kind, source_schedule_date, visible, visibility_mode
      )
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'SCHEDULED', ?, 'ADMIN_AD_HOC', ?, 0, 'AUTO')
      `,
    )
    .bind(
      seriesNumber,
      policy.series_suffix,
      publicCode,
      programCode,
      anchorId,
      utcSql(startUtc),
      policy.schedule_timezone,
      durationMinutes,
      liveTestParticipationCost(
        fractionPercent,
      ),
      liveTestResultCost(
        fractionPercent,
      ),
      fractionPercent,
      input.scheduleDate,
    )
    .run();

  const saved =
    await env.gyan_registry
      .prepare('SELECT id FROM education_live_tests WHERE public_code = ? LIMIT 1')
      .bind(publicCode)
      .first<{ id: number }>();
  if (!saved) {
    throw new Error('The Live Test row could not be created.');
  }

  const frozenQuestions = await freezeTest(
    env,
    Number(saved.id),
    programCode,
    schedule,
    mix,
    expectedQuestions,
  );

  if (frozenQuestions !== expectedQuestions) {
    await env.gyan_registry
      .prepare('DELETE FROM education_live_tests WHERE id = ?')
      .bind(saved.id)
      .run();
    throw new Error(
      `Only ${frozenQuestions} of ${expectedQuestions} questions could be generated. Nothing was saved.`,
    );
  }

  return {
    code: publicCode,
    frozenQuestions,
    expectedQuestions,
    durationMinutes,
  };
}

export async function maintainLiveTestInventory(
  env: LiveTestSchedulerEnv,
  horizonDays = 14,
  now = new Date(),
): Promise<void> {
  const activePolicies =
    await policies(env);

  for (const policy of activePolicies) {
    const localToday =
      datePartsInZone(
        now,
        policy.schedule_timezone,
      ).date;

    const baseMix =
      await subjectPolicies(
        env,
        policy.program_code,
      );

    const baseMixTotal =
      baseMix.reduce(
        (total, item) =>
          total +
          Number(item.question_count),
        0,
      );

    if (
      baseMixTotal !==
      Number(policy.question_count)
    ) {
      throw new Error(
        `${policy.program_code} subject mix totals ${baseMixTotal}; expected ${policy.question_count}.`,
      );
    }

    const baseFraction =
      Math.max(
        1,
        Number(policy.test_fraction_percent),
      );

    for (
      let offset = 0;
      offset < horizonDays;
      offset += 1
    ) {
      const date =
        addDays(
          localToday,
          offset,
        );

      const fractionPercent =
        automaticFractionForDate(
          date,
        );

      if (fractionPercent <= 0) {
        continue;
      }

      const schedule =
        await classRowsForAutomaticTest(
          env,
          date,
          policy.program_code,
        );

      if (schedule.length === 0) {
        continue;
      }

      const expectedQuestions =
        scaledValue(
          Number(policy.question_count),
          baseFraction,
          fractionPercent,
        );

      const durationMinutes =
        scaledValue(
          Number(policy.duration_minutes),
          baseFraction,
          fractionPercent,
        );

      const mix =
        scaledSubjectMix(
          baseMix,
          expectedQuestions,
        );

      let publicCode:
        string | null = null;

      try {
        const test =
          await findOrCreateTest(
            env,
            policy,
            date,
            {
              fractionPercent,
              durationMinutes,
              eventKind:
                weekdayUtc(date) === 0
                  ? 'SUNDAY'
                  : weekdayUtc(date) === 6
                    ? 'SATURDAY'
                    : 'WEEKDAY',
            },
          );

        publicCode = test.public_code;

        const frozen =
          await freezeTest(
            env,
            Number(test.id),
            policy.program_code,
            schedule,
            mix,
            expectedQuestions,
          );

        if (
          frozen !==
          expectedQuestions
        ) {
          await env.gyan_registry
            .prepare(
              `
              UPDATE education_live_tests
              SET
                visible = 0,
                updated_at = CURRENT_TIMESTAMP
              WHERE id = ?
              `,
            )
            .bind(test.id)
            .run();

          await logGeneration(
            env,
            date,
            policy.program_code,
            publicCode,
            'INCOMPLETE',
            frozen,
            `Expected ${expectedQuestions} questions for ${fractionPercent}% test.`,
          );

          continue;
        }

        await logGeneration(
          env,
          date,
          policy.program_code,
          publicCode,
          'READY',
          frozen,
          null,
        );
      } catch (error) {
        await logGeneration(
          env,
          date,
          policy.program_code,
          publicCode,
          'ERROR',
          0,
          error instanceof Error
            ? error.message
            : 'Unknown Live Test generation error.',
        );

        console.error(
          'Live Test generation failed:',
          {
            date,
            program:
              policy.program_code,
            error,
          },
        );
      }
    }
  }
}

export async function switchLiveTestVisibility(
  env: LiveTestSchedulerEnv,
  now = new Date(),
): Promise<void> {
  const activePolicies =
    await policies(env);

  for (const policy of activePolicies) {
    const localToday =
      datePartsInZone(
        now,
        policy.schedule_timezone,
      ).date;

    await env.gyan_registry
      .prepare(
        `
        UPDATE education_live_tests
        SET
          visible =
            CASE
              WHEN visibility_mode = 'SHOW'
                THEN 1

              WHEN visibility_mode = 'HIDE'
                THEN 0

              WHEN
                source_schedule_date = ?
                AND (
                  SELECT COUNT(*)
                  FROM education_live_test_questions q
                  WHERE
                    q.live_test_id =
                      education_live_tests.id
                ) = MAX(
                  1,
                  ROUND(
                    ? *
                    COALESCE(education_live_tests.test_fraction_percent, ?) /
                    ?
                  )
                )
              THEN 1

              ELSE 0
            END,
          updated_at =
            CURRENT_TIMESTAMP
        WHERE
          program_code = ?
          AND COALESCE(
            event_kind,
            'WEEKDAY'
          ) <> 'ADMIN_TEST'
        `,
      )
      .bind(
        localToday,
        Number(policy.question_count),
        Math.max(1, Number(policy.test_fraction_percent)),
        Math.max(1, Number(policy.test_fraction_percent)),
        policy.program_code,
      )
      .run();
  }
}
