import {
  freezeTest,
  type ClassRow,
  type SubjectPolicyRow,
} from './liveTestScheduler';

export interface LiveTestBatchEnv {
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
  active: number;
};

type BatchRow = {
  batch_code: string;
  label: string;
  start_date: string;
  end_date: string;
  sort_order: number;
  active: number;
};


export type BatchExam = 'JEE' | 'NEET' | 'SAT' | 'GRE' | 'OLSAT';

const SUPPORTED_EXAMS: BatchExam[] = [
  'JEE',
  'NEET',
  'SAT',
  'GRE',
  'OLSAT',
];

function addDays(date: string, amount: number): string {
  const [year, month, day] = date.split('-').map(Number);
  return new Date(Date.UTC(year, month - 1, day + amount))
    .toISOString()
    .slice(0, 10);
}

function dayDifference(fromDate: string, toDate: string): number {
  const parse = (date: string): number => {
    const [year, month, day] = date.split('-').map(Number);
    return Date.UTC(year, month - 1, day);
  };
  return Math.round((parse(toDate) - parse(fromDate)) / 86400000);
}

function dayOfWeek(date: string): number {
  return new Date(`${date}T12:00:00Z`).getUTCDay();
}

function fractionForDate(date: string): number {
  const day = dayOfWeek(date);

  if (day === 0) {
    return 50;
  }

  return day === 6
    ? 20
    : 10;
}

function liveTestFormulaCost(percentage: number): number {
  const safePercent =
    Math.max(
      1,
      Number(percentage),
    );

  return (
    5 *
    Math.floor(
      (
        20 *
        Math.log10(safePercent)
      ) /
      5,
    )
  );
}


function liveTestParticipationCost(percentage: number): number {
  return Math.max(
    1,
    Math.floor(
      liveTestFormulaCost(percentage) *
      0.25,
    ),
  );
}


function liveTestResultCost(percentage: number): number {
  return liveTestFormulaCost(percentage);
}


function scaledValue(baseValue: number, baseFraction: number, targetFraction: number): number {
  return Math.max(1, Math.round(baseValue * targetFraction / Math.max(1, baseFraction)));
}

function utcSql(value: Date): string {
  return value.toISOString().replace('T', ' ').replace(/\.\d{3}Z$/, '');
}


function dateInTimeZone(
  value: Date,
  timeZone: string,
): string {
  const parts =
    new Intl.DateTimeFormat(
      'en-CA',
      {
        timeZone,
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
      },
    ).formatToParts(value);

  const read = (
    type: Intl.DateTimeFormatPartTypes,
  ): string =>
    parts.find(
      (part) => part.type === type,
    )?.value ?? '';

  return `${read('year')}-${read('month')}-${read('day')}`;
}

function localDateTimeToUtc(date: string, time: string, timeZone: string): Date {
  const [year, month, day] = date.split('-').map(Number);
  const [hour, minute] = time.split(':').map(Number);
  const desired = Date.UTC(year, month - 1, day, hour, minute, 0);
  let guess = desired;
  const formatter = new Intl.DateTimeFormat('en-CA', {
    timeZone,
    year: 'numeric', month: '2-digit', day: '2-digit',
    hour: '2-digit', minute: '2-digit', second: '2-digit',
    hourCycle: 'h23',
  });
  for (let pass = 0; pass < 3; pass += 1) {
    const parts = formatter.formatToParts(new Date(guess));
    const read = (type: Intl.DateTimeFormatPartTypes): number =>
      Number(parts.find((part) => part.type === type)?.value ?? 0);
    const represented = Date.UTC(
      read('year'), read('month') - 1, read('day'),
      read('hour'), read('minute'), read('second'),
    );
    const correction = desired - represented;
    if (Math.abs(correction) < 1000) break;
    guess += correction;
  }
  return new Date(guess);
}

function scaledSubjectMix(source: SubjectPolicyRow[], targetTotal: number): SubjectPolicyRow[] {
  const safeTarget = Math.max(1, Math.round(targetTotal));
  const baseTotal = source.reduce((sum, row) => sum + Number(row.question_count), 0);
  if (baseTotal <= 0 || source.length === 0) return [];
  const drafted = source.map((row) => {
    const exact = Number(row.question_count) / baseTotal * safeTarget;
    const floor = Math.floor(exact);
    return { row, count: floor, remainder: exact - floor };
  });
  let remaining = safeTarget - drafted.reduce((sum, item) => sum + item.count, 0);
  drafted
    .sort((a, b) => b.remainder - a.remainder || Number(a.row.sort_order) - Number(b.row.sort_order))
    .forEach((item) => {
      if (remaining > 0) {
        item.count += 1;
        remaining -= 1;
      }
    });
  return drafted
    .sort((a, b) => Number(a.row.sort_order) - Number(b.row.sort_order))
    .map((item) => ({ ...item.row, question_count: item.count }))
    .filter((item) => Number(item.question_count) > 0);
}

async function policyFor(env: LiveTestBatchEnv, program: string): Promise<PolicyRow | null> {
  return env.gyan_registry.prepare(`
    SELECT program_code, series_suffix, schedule_timezone, test_start_local,
           duration_minutes, question_count, entry_gem_cost, report_gem_cost,
           test_fraction_percent, series_epoch_date, series_epoch_number, active
    FROM education_live_test_policy
    WHERE program_code = ?
    LIMIT 1
  `).bind(program).first<PolicyRow>();
}

async function subjectMix(env: LiveTestBatchEnv, program: string): Promise<SubjectPolicyRow[]> {
  const result = await env.gyan_registry.prepare(`
    SELECT subject_code, question_count, sort_order
    FROM education_live_test_policy_subjects
    WHERE program_code = ?
    ORDER BY sort_order, subject_code
  `).bind(program).all<SubjectPolicyRow>();
  return result.results;
}

async function dailyClassRows(env: LiveTestBatchEnv, date: string, program: string): Promise<ClassRow[]> {
  const result = await env.gyan_registry.prepare(`
    SELECT id, subject_code, topic_code, topic_name, sequence_number
    FROM education_live_class_schedule
    WHERE schedule_date = ? AND program_code = ? AND active = 1
    ORDER BY sequence_number, id
  `).bind(date, program).all<ClassRow>();
  return result.results;
}

async function weekendWeekRows(
  env: LiveTestBatchEnv,
  weekendDate: string,
  program: string,
): Promise<ClassRow[]> {
  const day =
    dayOfWeek(weekendDate);

  const monday =
    addDays(
      weekendDate,
      day === 0
        ? -6
        : -5,
    );

  const friday =
    addDays(
      weekendDate,
      day === 0
        ? -2
        : -1,
    );

  const result =
    await env.gyan_registry.prepare(`
      SELECT id, subject_code, topic_code, topic_name, sequence_number
      FROM education_live_class_schedule
      WHERE schedule_date BETWEEN ? AND ? AND program_code = ? AND active = 1
      ORDER BY schedule_date, sequence_number, id
    `).bind(
      monday,
      friday,
      program,
    ).all<ClassRow>();

  return result.results;
}


async function rowsForDate(
  env: LiveTestBatchEnv,
  date: string,
  program: string,
): Promise<ClassRow[]> {
  const day =
    dayOfWeek(date);

  return (
    day === 6 ||
    day === 0
  )
    ? weekendWeekRows(
        env,
        date,
        program,
      )
    : dailyClassRows(
        env,
        date,
        program,
      );
}


const CLASS_SUBJECTS: Record<string, string[]> = {
  JEE: [
    'MATH',
    'PHYSICS',
    'CHEMISTRY',
  ],
  NEET: [
    'PHYSICS',
    'CHEMISTRY',
    'BIOLOGY',
  ],
  SAT: [
    'READING_WRITING',
    'MATH',
  ],
};

type ClassTemplateHeaderRow = {
  template_code: string;
  program_code: string;
  label: string;
  teaching_days: number;
  active: number;
};

type ClassTemplateRow = {
  teaching_day: number;
  subject_code: string;
  topic_code: string | null;
  topic_name: string;
  class_start_local: string;
  class_end_local: string;
  schedule_timezone: string;
  sequence_number: number;
};

export type ClassBatchPreview = {
  program: string;
  batchCode: string;
  label: string;
  startDate: string;
  endDate: string;
  configured: boolean;
  templateCode: string | null;
  templateLabel: string | null;
  teachingDays: number;
  eligibleDays: number;
  revisionDays: number;
  scheduledDays: number;
  completedTeachingDays: number;
  completedScheduleDays: number;
  normalizedRows: number;
  needsNormalization: boolean;
  subjectCount: number;
  expectedRows: number;
  existingRows: number;
  missingRows: number;
  blackoutDays: number;
};

function isWeekday(date: string): boolean {
  const day = dayOfWeek(date);
  return day >= 1 && day <= 5;
}

async function classTemplateHeader(
  env: LiveTestBatchEnv,
  program: string,
): Promise<ClassTemplateHeaderRow | null> {
  return env.gyan_registry.prepare(`
    SELECT
      template_code,
      program_code,
      label,
      teaching_days,
      active
    FROM education_live_class_templates
    WHERE
      program_code = ?
      AND active = 1
    ORDER BY id
    LIMIT 1
  `).bind(
    program,
  ).first<ClassTemplateHeaderRow>();
}

async function classTemplateRows(
  env: LiveTestBatchEnv,
  templateCode: string,
): Promise<ClassTemplateRow[]> {
  const result = await env.gyan_registry.prepare(`
    SELECT
      teaching_day,
      subject_code,
      topic_code,
      topic_name,
      class_start_local,
      class_end_local,
      schedule_timezone,
      sequence_number
    FROM education_live_class_template_rows
    WHERE template_code = ?
    ORDER BY
      teaching_day,
      sequence_number,
      subject_code
  `).bind(
    templateCode,
  ).all<ClassTemplateRow>();

  return result.results;
}

async function blackoutDates(
  env: LiveTestBatchEnv,
  batchCode: string,
  program: string,
): Promise<Set<string>> {
  const result = await env.gyan_registry.prepare(`
    SELECT blackout_date
    FROM education_live_class_blackout_dates
    WHERE
      batch_code = ?
      AND (
        program_code = ?
        OR program_code = 'ALL'
      )
  `).bind(
    batchCode,
    program,
  ).all<{ blackout_date: string }>();

  return new Set(
    result.results.map(
      (row) => row.blackout_date,
    ),
  );
}

async function teachingDatesForBatch(
  env: LiveTestBatchEnv,
  batch: BatchRow,
  program: string,
  teachingDays: number,
): Promise<{
  dates: string[];
  coreDates: string[];
  eligibleDays: number;
  revisionDays: number;
  blackoutDays: number;
}> {
  const blackouts = await blackoutDates(
    env,
    batch.batch_code,
    program,
  );

  const eligible: string[] = [];
  let blackoutDays = 0;

  for (
    let date = batch.start_date;
    date <= batch.end_date;
    date = addDays(date, 1)
  ) {
    if (!isWeekday(date)) {
      continue;
    }

    if (blackouts.has(date)) {
      blackoutDays += 1;
      continue;
    }

    eligible.push(date);
  }

  const safeTeachingDays = Math.max(
    0,
    teachingDays,
  );

  return {
    dates: eligible,
    coreDates: eligible.slice(
      0,
      safeTeachingDays,
    ),
    eligibleDays: eligible.length,
    revisionDays: Math.max(
      0,
      eligible.length - safeTeachingDays,
    ),
    blackoutDays,
  };
}

export async function previewClassBatch(
  env: LiveTestBatchEnv,
  programRaw: string,
  batchCode: string,
): Promise<ClassBatchPreview> {
  const program = programRaw.trim().toUpperCase();
  const batch = await batchRow(env, batchCode);

  if (!batch) {
    throw new Error('Live Test batch not found.');
  }

  const template = await classTemplateHeader(
    env,
    program,
  );

  if (!template || Number(template.active) !== 1) {
    return {
      program,
      batchCode: batch.batch_code,
      label: batch.label,
      startDate: batch.start_date,
      endDate: batch.end_date,
      configured: false,
      templateCode: null,
      templateLabel: null,
      teachingDays: 0,
      eligibleDays: 0,
      revisionDays: 0,
      scheduledDays: 0,
      completedTeachingDays: 0,
      completedScheduleDays: 0,
      normalizedRows: 0,
      needsNormalization: false,
      subjectCount: 0,
      expectedRows: 0,
      existingRows: 0,
      missingRows: 0,
      blackoutDays: 0,
    };
  }

  const rows = await classTemplateRows(
    env,
    template.template_code,
  );

  const teachingDays = Math.max(
    1,
    Number(template.teaching_days),
  );

  const teachingDates = await teachingDatesForBatch(
    env,
    batch,
    program,
    teachingDays,
  );

  if (teachingDates.coreDates.length < teachingDays) {
    throw new Error(
      `${batch.label} has only ${teachingDates.coreDates.length} eligible teaching dates for the ${teachingDays}-day ${program} template.`,
    );
  }

  const rowsByDay = new Map<
    number,
    ClassTemplateRow[]
  >();

  const subjectTemplate = new Map<
    string,
    ClassTemplateRow
  >();

  for (const row of rows) {
    const day = Number(row.teaching_day);
    const group = rowsByDay.get(day) ?? [];
    group.push(row);
    rowsByDay.set(day, group);

    if (!subjectTemplate.has(row.subject_code)) {
      subjectTemplate.set(
        row.subject_code,
        row,
      );
    }
  }

  const revisionRows = [
    ...subjectTemplate.values(),
  ].sort(
    (a, b) =>
      Number(a.sequence_number) -
      Number(b.sequence_number),
  );

  let expectedRows = 0;
  let existingRows = 0;
  let completedTeachingDays = 0;
  let completedScheduleDays = 0;
  let normalizedRows = 0;

  for (
    let index = 0;
    index < teachingDates.dates.length;
    index += 1
  ) {
    const scheduleDay = index + 1;
    const date = teachingDates.dates[index];
    const isCore = scheduleDay <= teachingDays;

    const desiredRows = isCore
      ? (
          rowsByDay.get(scheduleDay) ??
          []
        )
      : revisionRows;

    expectedRows += desiredRows.length;

    const existing = await env.gyan_registry.prepare(`
      SELECT
        subject_code,
        batch_code,
        template_code,
        teaching_day,
        class_kind
      FROM education_live_class_schedule
      WHERE
        schedule_date = ?
        AND program_code = ?
        AND active = 1
    `).bind(
      date,
      program,
    ).all<{
      subject_code: string;
      batch_code: string | null;
      template_code: string | null;
      teaching_day: number | null;
      class_kind: string | null;
    }>();

    const existingBySubject = new Map(
      existing.results.map(
        (row) => [
          row.subject_code
            .trim()
            .toUpperCase(),
          row,
        ],
      ),
    );

    let present = 0;

    for (const desiredRow of desiredRows) {
      const subject =
        desiredRow.subject_code
          .trim()
          .toUpperCase();

      const existingRow =
        existingBySubject.get(subject);

      if (!existingRow) {
        continue;
      }

      present += 1;

      const expectedKind =
        isCore
          ? 'CORE'
          : 'REVISION';

      if (
        existingRow.batch_code ===
          batch.batch_code &&
        existingRow.template_code ===
          template.template_code &&
        Number(
          existingRow.teaching_day,
        ) === scheduleDay &&
        existingRow.class_kind ===
          expectedKind
      ) {
        normalizedRows += 1;
      }
    }

    existingRows += present;

    if (
      desiredRows.length > 0 &&
      present === desiredRows.length
    ) {
      completedScheduleDays += 1;

      if (isCore) {
        completedTeachingDays += 1;
      }
    }
  }

  return {
    program,
    batchCode: batch.batch_code,
    label: batch.label,
    startDate: batch.start_date,
    endDate: batch.end_date,
    configured: rows.length > 0,
    templateCode: template.template_code,
    templateLabel: template.label,
    teachingDays,
    eligibleDays: teachingDates.eligibleDays,
    revisionDays: teachingDates.revisionDays,
    scheduledDays: teachingDates.dates.length,
    completedTeachingDays,
    completedScheduleDays,
    normalizedRows,
    needsNormalization:
      normalizedRows < expectedRows,
    subjectCount:
      CLASS_SUBJECTS[program]?.length ?? 0,
    expectedRows,
    existingRows,
    missingRows: Math.max(
      0,
      expectedRows - existingRows,
    ),
    blackoutDays: teachingDates.blackoutDays,
  };
}

export async function generateClassBatch(
  env: LiveTestBatchEnv,
  programRaw: string,
  batchCode: string,
  recreate = false,
): Promise<{
  program: string;
  batchCode: string;
  templateCode: string;
  teachingDays: number;
  revisionDays: number;
  scheduledDays: number;
  inserted: number;
  updatedRevisionRows: number;
  preserved: number;
  expectedRows: number;
  completedTeachingDays: number;
  completedScheduleDays: number;
}> {
  const program = programRaw.trim().toUpperCase();

  if (!CLASS_SUBJECTS[program]) {
    throw new Error(
      'Automatic class generation is currently available for JEE, NEET and SAT.',
    );
  }

  const batch = await batchRow(
    env,
    batchCode,
  );

  if (!batch) {
    throw new Error('Live Test batch not found.');
  }

  const template = await classTemplateHeader(
    env,
    program,
  );

  if (!template || Number(template.active) !== 1) {
    throw new Error(
      `${program} does not have an active class template.`,
    );
  }

  const teachingDays = Math.max(
    1,
    Number(template.teaching_days),
  );

  const templateRows = await classTemplateRows(
    env,
    template.template_code,
  );

  if (templateRows.length === 0) {
    throw new Error(
      `${template.template_code} has no class template rows.`,
    );
  }

  const classTimeZone =
    templateRows[0]?.schedule_timezone ??
    (program === 'SAT'
      ? 'America/New_York'
      : 'Asia/Kolkata');

  const today =
    dateInTimeZone(
      new Date(),
      classTimeZone,
    );

  if (recreate) {
    /*
     * Recreate only rows previously adopted/generated by this template.
     * Manual/ad-hoc rows have no matching template_code/class_kind and survive.
     */
    await env.gyan_registry.prepare(`
      DELETE FROM education_live_class_schedule
      WHERE
        program_code = ?
        AND batch_code = ?
        AND template_code = ?
        AND class_kind IN ('CORE', 'REVISION')
        AND schedule_date > ?
    `).bind(
      program,
      batch.batch_code,
      template.template_code,
      today,
    ).run();
  }

  const teachingDates = await teachingDatesForBatch(
    env,
    batch,
    program,
    teachingDays,
  );

  if (teachingDates.coreDates.length < teachingDays) {
    throw new Error(
      `${batch.label} does not have ${teachingDays} eligible weekdays after blackout dates.`,
    );
  }

  const rowsByDay = new Map<
    number,
    ClassTemplateRow[]
  >();

  const subjectTemplate = new Map<
    string,
    ClassTemplateRow
  >();

  for (const row of templateRows) {
    const day = Number(row.teaching_day);
    const group = rowsByDay.get(day) ?? [];
    group.push(row);
    rowsByDay.set(day, group);

    if (!subjectTemplate.has(row.subject_code)) {
      subjectTemplate.set(
        row.subject_code,
        row,
      );
    }
  }

  const revisionRows = [
    ...subjectTemplate.values(),
  ].sort(
    (a, b) =>
      Number(a.sequence_number) -
      Number(b.sequence_number),
  );

  let inserted = 0;
  let updatedRevisionRows = 0;
  let preserved = 0;

  for (
    let index = 0;
    index < teachingDates.dates.length;
    index += 1
  ) {
    const scheduleDay = index + 1;
    const scheduleDate = teachingDates.dates[index];

    if (
      recreate &&
      scheduleDate <= today
    ) {
      continue;
    }

    const isCore = scheduleDay <= teachingDays;
    const revisionNumber = Math.max(
      0,
      scheduleDay - teachingDays,
    );

    const desiredRows = isCore
      ? (
          rowsByDay.get(scheduleDay) ??
          []
        )
      : revisionRows;

    for (const row of desiredRows) {
      const existing = await env.gyan_registry.prepare(`
        SELECT id
        FROM education_live_class_schedule
        WHERE
          schedule_date = ?
          AND program_code = ?
          AND subject_code = ?
          AND active = 1
        ORDER BY
          sequence_number,
          id
        LIMIT 1
      `).bind(
        scheduleDate,
        program,
        row.subject_code,
      ).first<{ id: number }>();

      const classKind = isCore
        ? 'CORE'
        : 'REVISION';

      const topicCode = isCore
        ? row.topic_code
        : null;

      const topicName = isCore
        ? row.topic_name
        : `Revision ${revisionNumber}`;

      if (existing) {
        if (isCore) {
          await env.gyan_registry.prepare(`
            UPDATE education_live_class_schedule
            SET
              batch_code = ?,
              template_code = ?,
              teaching_day = ?,
              class_kind = 'CORE',
              generation_source =
                COALESCE(
                  generation_source,
                  'TEMPLATE'
                ),
              updated_at = CURRENT_TIMESTAMP
            WHERE id = ?
          `).bind(
            batch.batch_code,
            template.template_code,
            scheduleDay,
            existing.id,
          ).run();

          preserved += 1;
        } else {
          await env.gyan_registry.prepare(`
            UPDATE education_live_class_schedule
            SET
              topic_code = NULL,
              topic_name = ?,
              batch_code = ?,
              template_code = ?,
              teaching_day = ?,
              class_kind = 'REVISION',
              generation_source = 'TEMPLATE',
              updated_at = CURRENT_TIMESTAMP
            WHERE id = ?
          `).bind(
            topicName,
            batch.batch_code,
            template.template_code,
            scheduleDay,
            existing.id,
          ).run();

          updatedRevisionRows += 1;
        }

        continue;
      }

      await env.gyan_registry.prepare(`
        INSERT INTO education_live_class_schedule (
          schedule_date,
          program_code,
          subject_code,
          topic_code,
          topic_name,
          class_start_local,
          class_end_local,
          schedule_timezone,
          sequence_number,
          active,
          batch_code,
          template_code,
          teaching_day,
          class_kind,
          generation_source
        )
        VALUES (
          ?, ?, ?, ?, ?, ?, ?, ?, ?, 1,
          ?, ?, ?, ?, 'TEMPLATE'
        )
      `).bind(
        scheduleDate,
        program,
        row.subject_code,
        topicCode,
        topicName,
        row.class_start_local,
        row.class_end_local,
        row.schedule_timezone,
        Number(row.sequence_number),
        batch.batch_code,
        template.template_code,
        scheduleDay,
        classKind,
      ).run();

      inserted += 1;
    }
  }

  const preview = await previewClassBatch(
    env,
    program,
    batchCode,
  );

  return {
    program,
    batchCode: batch.batch_code,
    templateCode: template.template_code,
    teachingDays,
    revisionDays: preview.revisionDays,
    scheduledDays: preview.scheduledDays,
    inserted,
    updatedRevisionRows,
    preserved,
    expectedRows: preview.expectedRows,
    completedTeachingDays:
      preview.completedTeachingDays,
    completedScheduleDays:
      preview.completedScheduleDays,
  };
}


async function anchorId(env: LiveTestBatchEnv, program: string): Promise<number> {
  const row = await env.gyan_registry.prepare(`
    SELECT id
    FROM education_mock_tests
    WHERE program_code = ? AND test_kind = 'MINI'
    ORDER BY CASE WHEN test_code = 'MINI_A' THEN 0 ELSE 1 END, id
    LIMIT 1
  `).bind(program).first<{ id: number }>();
  if (!row) throw new Error(`No MINI mock-test anchor exists for ${program}.`);
  return Number(row.id);
}

async function batchRow(env: LiveTestBatchEnv, code: string): Promise<BatchRow | null> {
  return env.gyan_registry.prepare(`
    SELECT batch_code, label, start_date, end_date, sort_order, active
    FROM education_live_test_batches
    WHERE batch_code = ? AND active = 1
    LIMIT 1
  `).bind(code).first<BatchRow>();
}

export async function listBatchCatalog(env: LiveTestBatchEnv): Promise<{
  batches: BatchRow[];
  programs: { program: BatchExam; configured: boolean; active: boolean; note: string | null }[];
}> {
  const batches = await env.gyan_registry.prepare(`
    SELECT batch_code, label, start_date, end_date, sort_order, active
    FROM education_live_test_batches
    WHERE active = 1
    ORDER BY sort_order, start_date
  `).all<BatchRow>();

  const policyRows = await env.gyan_registry.prepare(`
    SELECT program_code, active
    FROM education_live_test_policy
  `).all<{ program_code: string; active: number }>();
  const policyMap = new Map(policyRows.results.map((row) => [row.program_code, Number(row.active) === 1]));

  return {
    batches: batches.results,
    programs: SUPPORTED_EXAMS.map((program) => {
      const exists = policyMap.has(program);
      const active = policyMap.get(program) === true;
      return {
        program,
        configured: exists && active,
        active,
        note: exists && active ? null : 'Live Test policy/setup required',
      };
    }),
  };
}

export async function previewBatch(
  env: LiveTestBatchEnv,
  programRaw: string,
  batchCode: string,
): Promise<{
  program: string;
  batchCode: string;
  label: string;
  startDate: string;
  endDate: string;
  configured: boolean;
  weekdayTests: number;
  saturdayTests: number;
  sundayTests: number;
  plannedTests: number;
  missingScheduleDays: number;
  existingAutoTests: number;
  adminTests: number;
}> {
  const program = programRaw.trim().toUpperCase();
  if (!SUPPORTED_EXAMS.includes(program as BatchExam)) throw new Error('Unsupported exam.');
  const batch = await batchRow(env, batchCode);
  if (!batch) throw new Error('Live Test batch not found.');
  const policy = await policyFor(env, program);
  const configured = Boolean(policy && Number(policy.active) === 1);

  let weekdayTests = 0;
  let saturdayTests = 0;
  let sundayTests = 0;
  let missingScheduleDays = 0;

  if (configured) {
    for (let date = batch.start_date; date <= batch.end_date; date = addDays(date, 1)) {
      const fraction = fractionForDate(date);
      if (fraction <= 0) continue;
      const rows = await rowsForDate(env, date, program);
      if (rows.length === 0) {
        missingScheduleDays += 1;
        continue;
      }
      const day =
        dayOfWeek(date);

      if (day === 6) {
        saturdayTests += 1;
      } else if (day === 0) {
        sundayTests += 1;
      } else {
        weekdayTests += 1;
      }
    }
  }

  const autoCount = await env.gyan_registry.prepare(`
    SELECT COUNT(*) AS count
    FROM education_live_tests
    WHERE
      program_code = ?
      AND batch_code = ?
      AND event_kind = 'BATCH_AUTO'
  `).bind(
    program,
    batch.batch_code,
  ).first<{ count: number }>();

  const adminCount = await env.gyan_registry.prepare(`
    SELECT COUNT(*) AS count
    FROM education_live_tests
    WHERE
      program_code = ?
      AND source_schedule_date BETWEEN ? AND ?
      AND COALESCE(event_kind,'WEEKDAY') IN ('ADMIN_TEST','ADMIN_AD_HOC')
  `).bind(
    program,
    batch.start_date,
    batch.end_date,
  ).first<{ count: number }>();

  return {
    program,
    batchCode: batch.batch_code,
    label: batch.label,
    startDate: batch.start_date,
    endDate: batch.end_date,
    configured,
    weekdayTests,
    saturdayTests,
    sundayTests,
    plannedTests:
      weekdayTests +
      saturdayTests +
      sundayTests,
    missingScheduleDays,
    existingAutoTests: Number(autoCount?.count ?? 0),
    adminTests: Number(adminCount?.count ?? 0),
  };
}

async function clearBatchAutoTests(
  env: LiveTestBatchEnv,
  program: string,
  batchCode: string,
  startDate: string,
  endDate: string,
  cutoffDate: string,
): Promise<void> {
  /*
   * Automatic batch identity is exact:
   * program_code + batch_code + event_kind='BATCH_AUTO'.
   * This is timezone-independent and identical for JEE/NEET/SAT/GRE.
   */
  await env.gyan_registry.prepare(`
    DELETE FROM gem_transactions
    WHERE reason IN (
      SELECT 'LIVE_TEST_ENTRY:' || public_code
      FROM education_live_tests
      WHERE
        program_code = ?
        AND batch_code = ?
        AND event_kind = 'BATCH_AUTO'
        AND source_schedule_date > ?
      UNION
      SELECT 'LIVE_TEST_REPORT:' || public_code
      FROM education_live_tests
      WHERE
        program_code = ?
        AND batch_code = ?
        AND event_kind = 'BATCH_AUTO'
        AND source_schedule_date > ?
    )
  `).bind(
    program,
    batchCode,
    cutoffDate,
    program,
    batchCode,
    cutoffDate,
  ).run();

  await env.gyan_registry.prepare(`
    DELETE FROM education_live_generation_runs
    WHERE
      program_code = ?
      AND schedule_date BETWEEN ? AND ?
      AND schedule_date >= ?
  `).bind(
    program,
    startDate,
    endDate,
    cutoffDate,
  ).run();

  await env.gyan_registry.prepare(`
    DELETE FROM education_live_tests
    WHERE
      program_code = ?
      AND batch_code = ?
      AND event_kind = 'BATCH_AUTO'
      AND source_schedule_date > ?
  `).bind(
    program,
    batchCode,
    cutoffDate,
  ).run();
}

async function logRun(
  env: LiveTestBatchEnv,
  date: string,
  program: string,
  code: string | null,
  status: 'READY' | 'INCOMPLETE' | 'ERROR' | 'SKIPPED',
  count: number,
  message: string | null,
): Promise<void> {
  await env.gyan_registry.prepare(`
    INSERT INTO education_live_generation_runs
      (schedule_date, program_code, public_code, status, frozen_question_count, message)
    VALUES (?, ?, ?, ?, ?, ?)
  `).bind(date, program, code, status, count, message).run();
}

export async function generateBatch(
  env: LiveTestBatchEnv,
  programRaw: string,
  batchCode: string,
  recreate: boolean,
): Promise<{
  program: string;
  batchCode: string;
  ready: number;
  incomplete: number;
  skipped: number;
  errors: number;
  generated: number;
}> {
  const program = programRaw.trim().toUpperCase();
  if (!SUPPORTED_EXAMS.includes(program as BatchExam)) throw new Error('Unsupported exam.');
  const batch = await batchRow(env, batchCode);
  if (!batch) throw new Error('Live Test batch not found.');
  const policy = await policyFor(env, program);
  if (!policy || Number(policy.active) !== 1) {
    throw new Error(`${program} Live Test policy/setup is not ready yet.`);
  }

  const today =
    dateInTimeZone(
      new Date(),
      policy.schedule_timezone,
    );

  const existing = await previewBatch(env, program, batchCode);
  if (existing.existingAutoTests > 0 && !recreate) {
    throw new Error(`${program} ${batch.label} already has ${existing.existingAutoTests} automatic tests. Use Recreate Batch.`);
  }
  if (recreate || existing.existingAutoTests > 0) {
    await clearBatchAutoTests(
      env,
      program,
      batch.batch_code,
      batch.start_date,
      batch.end_date,
      today,
    );
  }

  const baseMix = await subjectMix(env, program);
  const baseFraction = Math.max(1, Number(policy.test_fraction_percent));
  const mixTotal = baseMix.reduce((sum, row) => sum + Number(row.question_count), 0);
  if (mixTotal !== Number(policy.question_count)) {
    throw new Error(`${program} subject policy totals ${mixTotal}; expected ${policy.question_count}.`);
  }

  let ready = 0, incomplete = 0, skipped = 0, errors = 0;

  for (let date = batch.start_date; date <= batch.end_date; date = addDays(date, 1)) {
    if (
      recreate &&
      date <= today
    ) {
      continue;
    }

    const fractionPercent = fractionForDate(date);
    if (fractionPercent <= 0) continue;

    const schedule = await rowsForDate(env, date, program);
    if (schedule.length === 0) {
      skipped += 1;
      const day =
        dayOfWeek(date);

      await logRun(
        env,
        date,
        program,
        null,
        'SKIPPED',
        0,
        day === 6
          ? 'No Monday-Friday class topics available for Saturday weekly test.'
          : day === 0
            ? 'No Monday-Friday class topics available for Sunday weekly test.'
            : 'No class schedule exists for this date.',
      );
      continue;
    }

    const expectedQuestions = scaledValue(Number(policy.question_count), baseFraction, fractionPercent);
    const durationMinutes = scaledValue(Number(policy.duration_minutes), baseFraction, fractionPercent);
    const mix = scaledSubjectMix(baseMix, expectedQuestions);
    const seriesNumber = Number(policy.series_epoch_number) + dayDifference(policy.series_epoch_date, date);
    const publicCode = `${seriesNumber}${policy.series_suffix}`;

    try {
      const existingCode = await env.gyan_registry.prepare(
        'SELECT id FROM education_live_tests WHERE public_code = ? LIMIT 1'
      ).bind(publicCode).first<{ id: number }>();
      if (existingCode) throw new Error(`Public code #${publicCode} already exists.`);

      const mockTestId = await anchorId(env, program);
      const startUtc = localDateTimeToUtc(date, policy.test_start_local, policy.schedule_timezone);

      await env.gyan_registry.prepare(`
        INSERT INTO education_live_tests (
          series_number, series_suffix, public_code, program_code, mock_test_id,
          starts_at_utc, schedule_timezone, duration_minutes, entry_gem_cost,
          report_gem_cost, status, test_fraction_percent, event_kind,
          source_schedule_date, visible, visibility_mode, batch_code
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'SCHEDULED', ?, 'BATCH_AUTO', ?, 0, 'AUTO', ?)
      `).bind(
        seriesNumber, policy.series_suffix, publicCode, program, mockTestId,
        utcSql(startUtc), policy.schedule_timezone, durationMinutes,
        liveTestParticipationCost(fractionPercent),
        liveTestResultCost(fractionPercent),
        fractionPercent,
        date,
        batch.batch_code,
      ).run();

      const saved = await env.gyan_registry.prepare(
        'SELECT id FROM education_live_tests WHERE public_code = ? LIMIT 1'
      ).bind(publicCode).first<{ id: number }>();
      if (!saved) throw new Error(`Unable to create #${publicCode}.`);

      const frozen = await freezeTest(env, Number(saved.id), program, schedule, mix, expectedQuestions);
      if (frozen !== expectedQuestions) {
        incomplete += 1;
        await env.gyan_registry.prepare('UPDATE education_live_tests SET visible=0 WHERE id=?').bind(saved.id).run();
        await logRun(env, date, program, publicCode, 'INCOMPLETE', frozen,
          `Expected ${expectedQuestions} questions (${fractionPercent}%), froze ${frozen}.`);
      } else {
        ready += 1;
        await logRun(env, date, program, publicCode, 'READY', frozen,
          `${fractionPercent}% paper · ${durationMinutes} min.`);
      }
    } catch (error) {
      errors += 1;
      await logRun(env, date, program, publicCode, 'ERROR', 0,
        error instanceof Error ? error.message : 'Unknown batch generation error.');
    }
  }

  return {
    program,
    batchCode: batch.batch_code,
    ready,
    incomplete,
    skipped,
    errors,
    generated: ready + incomplete,
  };
}
