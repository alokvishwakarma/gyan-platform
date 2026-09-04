-- audit_neet_phase2.sql

SELECT
  s.subject_code,
  COUNT(DISTINCT t.id) AS topics,
  COUNT(DISTINCT st.id) AS core_subtopics,
  COUNT(DISTINCT q.id) AS questions
FROM education_subjects s
LEFT JOIN education_topics t
  ON t.subject_id = s.id
 AND t.enabled = 1
LEFT JOIN education_subtopics st
  ON st.topic_id = t.id
 AND st.enabled = 1
LEFT JOIN education_questions q
  ON q.subtopic_id = st.id
 AND q.active = 1
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
GROUP BY s.subject_code
ORDER BY s.sort_order;

SELECT
  s.subject_code,
  t.topic_code,
  t.topic_name,
  COUNT(q.id) AS questions
FROM education_subjects s
JOIN education_topics t
  ON t.subject_id = s.id
LEFT JOIN education_subtopics st
  ON st.topic_id = t.id
 AND st.enabled = 1
LEFT JOIN education_questions q
  ON q.subtopic_id = st.id
 AND q.active = 1
WHERE s.country_code = 'IN'
  AND s.grade_code = 'PROGRAM_NEET'
GROUP BY s.subject_code, t.id, t.topic_code, t.topic_name
HAVING COUNT(q.id) > 0
ORDER BY s.sort_order, t.sort_order;
