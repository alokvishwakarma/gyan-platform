-- verify_live_test_batch.sql
-- Change program/batch literals as needed.

SELECT batch_code, label, start_date, end_date
FROM education_live_test_batches
ORDER BY sort_order;

SELECT program_code, test_start_local, schedule_timezone,
       duration_minutes, question_count, test_fraction_percent, active
FROM education_live_test_policy
WHERE program_code IN ('JEE','NEET','SAT','GRE')
ORDER BY program_code;

SELECT batch_code, program_code, test_fraction_percent, duration_minutes,
       COUNT(*) AS tests,
       SUM(CASE WHEN event_kind='BATCH_AUTO' THEN 1 ELSE 0 END) AS batch_auto
FROM education_live_tests
GROUP BY batch_code, program_code, test_fraction_percent, duration_minutes
ORDER BY batch_code, program_code, test_fraction_percent;

SELECT lt.public_code, lt.program_code, lt.source_schedule_date,
       lt.test_fraction_percent, lt.duration_minutes,
       COUNT(q.question_id) AS frozen_questions,
       lt.batch_code, lt.event_kind
FROM education_live_tests lt
LEFT JOIN education_live_test_questions q ON q.live_test_id=lt.id
GROUP BY lt.id
ORDER BY lt.source_schedule_date, lt.program_code;

PRAGMA foreign_key_check;
