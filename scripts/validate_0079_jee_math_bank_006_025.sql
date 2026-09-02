-- READ ONLY: validate 0079 JEE Mathematics bank expansion

SELECT
  t.topic_code,
  t.topic_name,
  COUNT(q.id) AS active_questions,
  COUNT(DISTINCT q.question_key) AS unique_keys,
  COUNT(DISTINCT q.question_text) AS unique_texts
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
LEFT JOIN education_subtopics st
  ON st.topic_id=t.id AND st.enabled=1
LEFT JOIN education_questions q
  ON q.subtopic_id=st.id AND q.active=1
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.enabled=1
GROUP BY t.id,t.topic_code,t.topic_name
ORDER BY t.sort_order,t.topic_name;

-- Expected after 0074 + 0079: 14 rows, 25 questions each.
SELECT
  COUNT(q.id) AS total_math_questions,
  COUNT(DISTINCT q.question_key) AS unique_keys,
  COUNT(DISTINCT q.question_text) AS unique_texts
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND q.active=1
  AND q.source_type IN ('jee-rebuild-v1','jee-bank-v1');

-- Expected: 280 / 280 / 280 for this batch.
SELECT
  COUNT(*) AS batch_questions,
  COUNT(DISTINCT question_key) AS batch_unique_keys,
  COUNT(DISTINCT question_text) AS batch_unique_texts
FROM education_questions
WHERE source_type='jee-bank-v1'
  AND question_key LIKE 'IN_PROGRAM_JEE_MATH_%';

-- Expected: zero rows.
SELECT question_key, COUNT(*) AS copies
FROM education_questions
WHERE question_key LIKE 'IN_PROGRAM_JEE_MATH_%'
GROUP BY question_key
HAVING COUNT(*) > 1;

-- Expected: zero rows.
SELECT question_text, COUNT(*) AS copies
FROM education_questions
WHERE source_type IN ('jee-rebuild-v1','jee-bank-v1')
  AND question_key LIKE 'IN_PROGRAM_JEE_MATH_%'
GROUP BY question_text
HAVING COUNT(*) > 1;
