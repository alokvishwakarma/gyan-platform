-- verify_live_test_scheduler.sql

SELECT
  p.program_code,
  p.schedule_timezone,
  p.test_start_local,
  p.question_count,
  p.active,
  GROUP_CONCAT(ps.subject_code || ':' || ps.question_count, ', ') AS subject_mix
FROM education_live_test_policy p
LEFT JOIN education_live_test_policy_subjects ps
  ON ps.program_code = p.program_code
GROUP BY p.program_code
ORDER BY p.program_code;

SELECT
  schedule_date,
  program_code,
  COUNT(*) AS class_slots,
  GROUP_CONCAT(subject_code || ':' || topic_name, ' | ') AS topics
FROM education_live_class_schedule
WHERE
  active = 1
  AND schedule_date >= date('now')
  AND schedule_date < date('now', '+14 days')
GROUP BY schedule_date, program_code
ORDER BY schedule_date, program_code;

SELECT
  lt.public_code,
  lt.program_code,
  lt.source_schedule_date,
  lt.starts_at_utc,
  lt.schedule_timezone,
  lt.visible,
  COUNT(lq.question_id) AS frozen_questions
FROM education_live_tests lt
LEFT JOIN education_live_test_questions lq
  ON lq.live_test_id = lt.id
WHERE COALESCE(lt.event_kind,'WEEKDAY') <> 'ADMIN_TEST'
GROUP BY lt.id
ORDER BY lt.source_schedule_date, lt.program_code;

SELECT
  schedule_date,
  program_code,
  public_code,
  status,
  frozen_question_count,
  message,
  created_at
FROM education_live_generation_runs
ORDER BY id DESC
LIMIT 30;
