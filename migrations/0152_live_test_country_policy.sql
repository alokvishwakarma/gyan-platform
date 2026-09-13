-- 0152_live_test_country_policy.sql
--
-- Country mapping for Live Test policies.
-- IN -> JEE / NEET
-- US -> SAT
--
-- SAT remains inactive for generation for now, but its default
-- schedule is stored in D1 so Admin can display a disabled placeholder.

PRAGMA foreign_keys = ON;

ALTER TABLE education_live_test_policy
ADD COLUMN country_code TEXT NOT NULL DEFAULT 'IN'
CHECK (country_code IN ('IN','US'));

UPDATE education_live_test_policy
SET country_code = 'IN'
WHERE program_code IN ('JEE','NEET');

INSERT INTO education_live_test_policy (
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
  series_epoch_number,
  active,
  country_code
)
VALUES (
  'SAT',
  'S',
  'America/New_York',
  '19:30',
  60,
  0,
  5,
  15,
  10,
  '2026-09-09',
  237,
  0,
  'US'
)
ON CONFLICT(program_code) DO UPDATE SET
  series_suffix = excluded.series_suffix,
  schedule_timezone = excluded.schedule_timezone,
  test_start_local = excluded.test_start_local,
  duration_minutes = excluded.duration_minutes,
  country_code = excluded.country_code,
  updated_at = CURRENT_TIMESTAMP;

UPDATE education_live_test_policy
SET
  test_start_local = '21:15',
  schedule_timezone = 'Asia/Kolkata',
  country_code = 'IN',
  updated_at = CURRENT_TIMESTAMP
WHERE program_code = 'JEE';

UPDATE education_live_test_policy
SET
  test_start_local = '20:30',
  schedule_timezone = 'Asia/Kolkata',
  country_code = 'IN',
  updated_at = CURRENT_TIMESTAMP
WHERE program_code = 'NEET';

SELECT
  country_code,
  program_code,
  test_start_local,
  schedule_timezone,
  duration_minutes,
  question_count,
  active
FROM education_live_test_policy
ORDER BY country_code, program_code;
