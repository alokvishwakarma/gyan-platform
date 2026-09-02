-- READ ONLY: validate 0076 JEE Chemistry starter bank
SELECT
  t.topic_code,
  t.topic_name,
  COUNT(q.id) AS starter_questions,
  COUNT(DISTINCT q.question_text) AS unique_question_texts
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
LEFT JOIN education_subtopics st
  ON st.topic_id=t.id AND st.enabled=1
LEFT JOIN education_questions q
  ON q.subtopic_id=st.id
 AND q.active=1
 AND q.source_type='jee-rebuild-v1'
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.enabled=1
GROUP BY t.id,t.topic_code,t.topic_name
ORDER BY t.sort_order,t.topic_name;

SELECT
  COUNT(*) AS total_starter_questions,
  COUNT(DISTINCT question_text) AS unique_question_texts
FROM education_questions
WHERE source_type='jee-rebuild-v1'
  AND question_key LIKE 'IN_PROGRAM_JEE_CHEMISTRY_%';

SELECT question_key, COUNT(*) AS copies
FROM education_questions
WHERE source_type='jee-rebuild-v1'
  AND question_key LIKE 'IN_PROGRAM_JEE_CHEMISTRY_%'
GROUP BY question_key
HAVING COUNT(*) > 1;
