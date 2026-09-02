-- READ ONLY: JEE 25-per-topic checkpoint
SELECT s.subject_code,
       COUNT(DISTINCT t.id) AS topics,
       COUNT(q.id) AS questions,
       COUNT(DISTINCT q.question_key) AS unique_keys
FROM education_subjects s
JOIN education_topics t ON t.subject_id=s.id AND t.enabled=1
JOIN education_subtopics st ON st.topic_id=t.id AND st.enabled=1
JOIN education_questions q ON q.subtopic_id=st.id AND q.active=1
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code IN ('MATH','PHYSICS','CHEMISTRY')
  AND q.source_type IN ('jee-rebuild-v1','jee-bank-v1')
GROUP BY s.subject_code
ORDER BY s.subject_code;

-- Expected:
-- CHEMISTRY 26 650 650
-- MATH      14 350 350
-- PHYSICS   20 500 500

SELECT COUNT(DISTINCT t.id) AS topics,
       COUNT(q.id) AS questions,
       COUNT(DISTINCT q.question_key) AS unique_keys
FROM education_subjects s
JOIN education_topics t ON t.subject_id=s.id AND t.enabled=1
JOIN education_subtopics st ON st.topic_id=t.id AND st.enabled=1
JOIN education_questions q ON q.subtopic_id=st.id AND q.active=1
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code IN ('MATH','PHYSICS','CHEMISTRY')
  AND q.source_type IN ('jee-rebuild-v1','jee-bank-v1');

-- Expected: 60 topics, 1500 questions, 1500 unique keys.
