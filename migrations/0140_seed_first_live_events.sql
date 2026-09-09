-- 0140_seed_first_live_events.sql
--
-- First local Live Test events.
-- Uses existing mock-test rows only as a legacy anchor because
-- education_live_tests.mock_test_id is still NOT NULL.
-- Actual Live questions will come from education_live_test_questions.
--
-- Sep 9, 2026 IST:
--   NEET #237N  8:30 PM IST  = 2026-09-09 15:00:00 UTC
--   JEE  #237J  9:15 PM IST  = 2026-09-09 15:45:00 UTC
--
-- Weekday = 10%
-- NEET duration = 18 min
-- JEE duration  = 18 min
--
-- Safe to rerun because public_code and (series_number, series_suffix)
-- are unique.

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
  source_schedule_date
)
SELECT
  237,
  'N',
  '237N',
  'NEET',
  mt.id,
  '2026-09-09 15:00:00',
  'Asia/Kolkata',
  18,
  5,
  15,
  'SCHEDULED',
  10,
  'WEEKDAY',
  '2026-09-09'
FROM education_mock_tests mt
WHERE
  mt.program_code = 'NEET'
  AND mt.test_kind = 'MINI'
ORDER BY
  CASE
    WHEN mt.test_code = 'MINI_A' THEN 0
    ELSE 1
  END,
  mt.id
LIMIT 1;


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
  source_schedule_date
)
SELECT
  237,
  'J',
  '237J',
  'JEE',
  mt.id,
  '2026-09-09 15:45:00',
  'Asia/Kolkata',
  18,
  5,
  15,
  'SCHEDULED',
  10,
  'WEEKDAY',
  '2026-09-09'
FROM education_mock_tests mt
WHERE
  mt.program_code = 'JEE'
  AND mt.test_kind = 'MINI'
  AND mt.exam_level = 'MAIN'
ORDER BY
  CASE
    WHEN mt.test_code = 'MINI_A' THEN 0
    ELSE 1
  END,
  mt.id
LIMIT 1;
