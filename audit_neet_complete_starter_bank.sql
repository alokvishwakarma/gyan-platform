-- audit_neet_complete_starter_bank.sql

-- 1) Subject totals.
SELECT
  s.subject_code,
  COUNT(DISTINCT t.id) AS topics,
  COUNT(DISTINCT st.id) AS subtopics,
  COUNT(DISTINCT q.id) AS active_questions
FROM education_subjects s
LEFT JOIN education_topics t
  ON t.subject_id=s.id AND t.enabled=1
LEFT JOIN education_subtopics st
  ON st.topic_id=t.id AND st.enabled=1
LEFT JOIN education_questions q
  ON q.subtopic_id=st.id AND q.active=1
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
GROUP BY s.subject_code
ORDER BY s.sort_order;

-- 2) Any enabled topic below 5 active questions?
-- Expected: ZERO rows.
SELECT
  s.subject_code,
  t.topic_code,
  t.topic_name,
  COUNT(q.id) AS active_questions
FROM education_subjects s
JOIN education_topics t
  ON t.subject_id=s.id
LEFT JOIN education_subtopics st
  ON st.topic_id=t.id AND st.enabled=1
LEFT JOIN education_questions q
  ON q.subtopic_id=st.id AND q.active=1
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND t.enabled=1
GROUP BY s.subject_code,t.id,t.topic_code,t.topic_name
HAVING COUNT(q.id) < 5
ORDER BY s.sort_order,t.sort_order;

-- 3) Duplicate NEET starter keys?
-- Expected: ZERO rows.
SELECT
  question_key,
  COUNT(*) AS copies
FROM education_questions
WHERE substr(question_key,1,length('IN_PROGRAM_NEET_'))='IN_PROGRAM_NEET_'
GROUP BY question_key
HAVING COUNT(*) > 1
ORDER BY copies DESC, question_key;

-- 4) NEET questions without metadata?
-- Expected: ZERO rows.
SELECT
  q.id,
  q.question_key
FROM education_questions q
LEFT JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE substr(q.question_key,1,length('IN_PROGRAM_NEET_'))='IN_PROGRAM_NEET_'
  AND qm.question_id IS NULL
ORDER BY q.question_key;

-- 5) Count by source.
SELECT
  q.source_type,
  COUNT(*) AS questions
FROM education_questions q
WHERE substr(q.question_key,1,length('IN_PROGRAM_NEET_'))='IN_PROGRAM_NEET_'
GROUP BY q.source_type
ORDER BY q.source_type;
