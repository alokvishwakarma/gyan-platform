-- 0147_admin_live_test_101.sql
--
-- Permanent admin-only rolling smoke test.
--
-- Display label: Admin Test #101
-- Public code:   ADMIN101
-- Event window:  computed in Worker as now-15 min .. now+15 min
-- Test timer:    18 minutes from admin entry (handled in Worker)
-- Gems:          0 / 0
--
-- Uses the already-frozen #237J 8-question set by reference only.
-- No question text is copied.

PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

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
  9101,
  'J',
  'ADMIN101',
  'JEE',
  mt.id,
  '2000-01-01 00:00:00',
  'UTC',
  18,
  0,
  0,
  'SCHEDULED',
  10,
  'ADMIN_TEST',
  NULL
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


INSERT OR IGNORE INTO education_live_test_questions (
  live_test_id,
  question_id,
  question_order,
  section_code,
  source_subject_code,
  source_topic_code,
  selection_reason
)
SELECT
  admin_test.id,
  source.question_id,
  source.question_order,
  source.section_code,
  source.source_subject_code,
  source.source_topic_code,
  'MANUAL'
FROM education_live_test_questions source
JOIN education_live_tests source_test
  ON source_test.id = source.live_test_id
JOIN education_live_tests admin_test
  ON admin_test.public_code = 'ADMIN101'
WHERE
  source_test.public_code = '237J';


COMMIT;


SELECT
  lt.id,
  lt.public_code,
  lt.program_code,
  lt.duration_minutes,
  lt.entry_gem_cost,
  lt.report_gem_cost,
  lt.event_kind,
  COUNT(lq.question_id) AS questions
FROM education_live_tests lt
LEFT JOIN education_live_test_questions lq
  ON lq.live_test_id = lt.id
WHERE
  lt.public_code = 'ADMIN101'
GROUP BY
  lt.id;
