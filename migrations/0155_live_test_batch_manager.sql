-- 0155_live_test_batch_manager.sql
-- GYAN BIG Test Management: batch metadata + proportional rules.

CREATE TABLE IF NOT EXISTS education_live_test_batches (
  batch_code TEXT PRIMARY KEY,
  label TEXT NOT NULL,
  start_date TEXT NOT NULL,
  end_date TEXT NOT NULL,
  sort_order INTEGER NOT NULL DEFAULT 0,
  active INTEGER NOT NULL DEFAULT 1 CHECK (active IN (0,1)),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CHECK (start_date <= end_date)
);

INSERT INTO education_live_test_batches
  (batch_code, label, start_date, end_date, sort_order, active)
VALUES
  ('2026_SEP_OCT', 'Sep–Oct 2026', '2026-09-01', '2026-10-31', 202609, 1),
  ('2026_NOV_DEC', 'Nov–Dec 2026', '2026-11-01', '2026-12-31', 202611, 1),
  ('2027_JAN_FEB', 'Jan–Feb 2027', '2027-01-01', '2027-02-28', 202701, 1),
  ('2027_MAR_APR', 'Mar–Apr 2027', '2027-03-01', '2027-04-30', 202703, 1),
  ('2027_MAY_JUN', 'May–Jun 2027', '2027-05-01', '2027-06-30', 202705, 1),
  ('2027_JUL_AUG', 'Jul–Aug 2027', '2027-07-01', '2027-08-31', 202707, 1)
ON CONFLICT(batch_code) DO UPDATE SET
  label = excluded.label,
  start_date = excluded.start_date,
  end_date = excluded.end_date,
  sort_order = excluded.sort_order,
  active = excluded.active,
  updated_at = CURRENT_TIMESTAMP;

ALTER TABLE education_live_tests
ADD COLUMN batch_code TEXT;

CREATE INDEX IF NOT EXISTS idx_live_tests_batch_program_date
ON education_live_tests (batch_code, program_code, source_schedule_date);

-- Final baseline philosophy:
-- policy row = 10% of full paper questions + 10% of full duration.
-- Saturday generator scales both to 20%.

UPDATE education_live_test_policy
SET
  test_fraction_percent = 10,
  question_count = 8,
  duration_minutes = 18,
  updated_at = CURRENT_TIMESTAMP
WHERE program_code = 'JEE';

UPDATE education_live_test_policy
SET
  test_fraction_percent = 10,
  question_count = 18,
  duration_minutes = 18,
  updated_at = CURRENT_TIMESTAMP
WHERE program_code = 'NEET';

UPDATE education_live_test_policy
SET
  test_fraction_percent = 10,
  question_count = 10,
  duration_minutes = 14,
  test_start_local = '21:30',
  schedule_timezone = 'America/New_York',
  country_code = 'US',
  active = 1,
  updated_at = CURRENT_TIMESTAMP
WHERE program_code = 'SAT';

INSERT INTO education_live_test_policy_subjects
  (program_code, subject_code, question_count, sort_order)
VALUES
  ('SAT','RW',5,1),
  ('SAT','MATH',5,2)
ON CONFLICT(program_code, subject_code) DO UPDATE SET
  question_count = excluded.question_count,
  sort_order = excluded.sort_order;

SELECT program_code, test_start_local, schedule_timezone,
       duration_minutes, question_count, test_fraction_percent, active
FROM education_live_test_policy
WHERE program_code IN ('JEE','NEET','SAT','GRE')
ORDER BY program_code;

SELECT batch_code, label, start_date, end_date
FROM education_live_test_batches
ORDER BY sort_order;
