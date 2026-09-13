-- verify_sat_live_tests.sql

SELECT
  program_code,
  series_suffix,
  schedule_timezone,
  test_start_local,
  duration_minutes,
  question_count,
  test_fraction_percent,
  active,
  country_code
FROM education_live_test_policy
WHERE program_code = 'SAT';

SELECT
  subject_code,
  question_count,
  sort_order
FROM education_live_test_policy_subjects
WHERE program_code = 'SAT'
ORDER BY sort_order;

SELECT
  public_code,
  program_code,
  source_schedule_date,
  starts_at_utc,
  schedule_timezone,
  duration_minutes,
  test_fraction_percent,
  visible,
  visibility_mode
FROM education_live_tests
WHERE program_code = 'SAT'
ORDER BY source_schedule_date, starts_at_utc;

SELECT
  lt.public_code,
  lt.source_schedule_date,
  COUNT(lq.question_id) AS frozen_questions
FROM education_live_tests lt
LEFT JOIN education_live_test_questions lq
  ON lq.live_test_id = lt.id
WHERE lt.program_code = 'SAT'
GROUP BY lt.id
ORDER BY lt.source_schedule_date, lt.starts_at_utc;

PRAGMA foreign_key_check;
