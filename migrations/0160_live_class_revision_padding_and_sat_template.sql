-- 0160_live_class_revision_padding_and_sat_template.sql
--
-- CANONICAL migration for a clean DB after 0159.
-- Adds the five provenance columns to education_live_class_schedule,
-- then creates the index, seeds SAT_STANDARD_38, and tags pre-existing
-- schedule rows as LEGACY.
--
-- IMPORTANT:
-- Do not rerun this migration on a database where these five columns
-- already exist. It is intended to run exactly once after 0159.
--
ALTER TABLE education_live_class_schedule
  ADD COLUMN batch_code TEXT;

ALTER TABLE education_live_class_schedule
  ADD COLUMN template_code TEXT;

ALTER TABLE education_live_class_schedule
  ADD COLUMN teaching_day INTEGER;

ALTER TABLE education_live_class_schedule
  ADD COLUMN class_kind TEXT
    CHECK (
      class_kind IS NULL
      OR class_kind IN ('CORE','REVISION','MANUAL')
    );

ALTER TABLE education_live_class_schedule
  ADD COLUMN generation_source TEXT
    CHECK (
      generation_source IS NULL
      OR generation_source IN ('TEMPLATE','MANUAL','LEGACY')
    );

CREATE INDEX IF NOT EXISTS idx_live_class_schedule_batch_template
ON education_live_class_schedule (
  batch_code,
  program_code,
  template_code,
  teaching_day
);

INSERT INTO education_live_class_templates (
  template_code,
  program_code,
  label,
  teaching_days,
  active
)
VALUES (
  'SAT_STANDARD_38',
  'SAT',
  'SAT Standard 38-Day Batch',
  38,
  1
)
ON CONFLICT(template_code)
DO UPDATE SET
  label = excluded.label,
  teaching_days = excluded.teaching_days,
  active = excluded.active,
  updated_at = CURRENT_TIMESTAMP;

DELETE FROM education_live_class_template_rows
WHERE template_code = 'SAT_STANDARD_38';

-- Preserve the existing SAT curriculum/times as the master template.
-- The first 38 distinct SAT class dates become core teaching days 1..38.
WITH sat_dates AS (
  SELECT
    schedule_date,
    DENSE_RANK() OVER (
      ORDER BY schedule_date
    ) AS teaching_day
  FROM (
    SELECT DISTINCT schedule_date
    FROM education_live_class_schedule
    WHERE
      program_code = 'SAT'
      AND active = 1
    ORDER BY schedule_date
    LIMIT 38
  )
)
INSERT INTO education_live_class_template_rows (
  template_code,
  teaching_day,
  subject_code,
  topic_code,
  topic_name,
  class_start_local,
  class_end_local,
  schedule_timezone,
  sequence_number
)
SELECT
  'SAT_STANDARD_38',
  d.teaching_day,
  s.subject_code,
  s.topic_code,
  s.topic_name,
  s.class_start_local,
  s.class_end_local,
  s.schedule_timezone,
  s.sequence_number
FROM sat_dates d
JOIN education_live_class_schedule s
  ON s.schedule_date = d.schedule_date
WHERE
  s.program_code = 'SAT'
  AND s.active = 1
ORDER BY
  d.teaching_day,
  s.sequence_number,
  s.subject_code;

-- Existing rows predate provenance columns. Keep them distinguishable until
-- the template generator touches/normalizes them.
UPDATE education_live_class_schedule
SET generation_source = 'LEGACY'
WHERE generation_source IS NULL;

-- Verification: SAT should seed 38 distinct core days.
SELECT
  t.program_code,
  t.template_code,
  t.teaching_days,
  COUNT(r.id) AS template_rows,
  COUNT(DISTINCT r.teaching_day) AS teaching_days_seeded
FROM education_live_class_templates t
LEFT JOIN education_live_class_template_rows r
  ON r.template_code = t.template_code
WHERE t.template_code IN (
  'JEE_STANDARD_38',
  'NEET_STANDARD_38',
  'SAT_STANDARD_38'
)
GROUP BY
  t.program_code,
  t.template_code,
  t.teaching_days
ORDER BY
  t.program_code;
