-- verify_sat_sep_oct_2026.sql
SELECT
  schedule_date,
  subject_code,
  topic_code,
  topic_name,
  class_start_local,
  class_end_local,
  schedule_timezone
FROM education_live_class_schedule
WHERE program_code = 'SAT'
  AND schedule_date >= '2026-09-01'
  AND schedule_date <= '2026-10-31'
  AND active = 1
ORDER BY schedule_date, sequence_number;

SELECT
  subject_code,
  topic_code,
  COUNT(*) AS sessions
FROM education_live_class_schedule
WHERE program_code = 'SAT'
  AND schedule_date >= '2026-09-01'
  AND schedule_date <= '2026-10-31'
  AND active = 1
GROUP BY subject_code, topic_code
ORDER BY subject_code, topic_code;
