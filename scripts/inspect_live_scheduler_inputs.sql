-- inspect_live_scheduler_inputs.sql
--
-- Run before deploying the scheduler.

-- A. What future master-class rows exist?
SELECT
  schedule_date,
  program_code,
  subject_code,
  topic_code,
  topic_name,
  class_start_local,
  class_end_local,
  schedule_timezone,
  sequence_number
FROM education_live_class_schedule
WHERE
  active = 1
  AND schedule_date >= '2026-09-10'
  AND schedule_date < '2026-09-24'
ORDER BY
  schedule_date,
  program_code,
  sequence_number,
  subject_code;

-- B. What subject codes actually exist for JEE/NEET?
SELECT DISTINCT
  grade_code,
  subject_code,
  subject_name
FROM education_subjects
WHERE grade_code IN (
  'PROGRAM_JEE',
  'PROGRAM_NEET'
)
ORDER BY
  grade_code,
  subject_code;

-- C. Confirm the question-bank schema fields used by the scheduler.
PRAGMA table_info(education_subjects);
PRAGMA table_info(education_topics);
PRAGMA table_info(education_questions);

-- D. How many questions are available for upcoming named topics?
SELECT
  s.grade_code,
  s.subject_code,
  t.topic_code,
  t.topic_name,
  COUNT(q.id) AS active_questions
FROM education_questions q
JOIN education_subtopics st
  ON st.id = q.subtopic_id
JOIN education_topics t
  ON t.id = st.topic_id
JOIN education_subjects s
  ON s.id = t.subject_id
WHERE
  q.active = 1
  AND s.grade_code IN (
    'PROGRAM_JEE',
    'PROGRAM_NEET'
  )
GROUP BY
  s.grade_code,
  s.subject_code,
  t.id
ORDER BY
  s.grade_code,
  s.subject_code,
  t.topic_name;
