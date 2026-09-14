-- 0164_sat_live_test_5pm_pacific.sql
--
-- Correct table: education_live_test_policy
--
-- SAT Live Tests should start at 5:00 PM Pacific local time.
-- America/Los_Angeles automatically handles PDT/PST.
--
-- The batch generator reads test_start_local + schedule_timezone
-- from education_live_test_policy.

UPDATE education_live_test_policy
SET
  test_start_local = '18:00',
  schedule_timezone = 'America/Los_Angeles'
WHERE program_code = 'SAT';

SELECT
  program_code,
  country_code,
  series_suffix,
  test_start_local,
  schedule_timezone,
  duration_minutes,
  question_count,
  test_fraction_percent,
  active
FROM education_live_test_policy
WHERE program_code = 'SAT';
