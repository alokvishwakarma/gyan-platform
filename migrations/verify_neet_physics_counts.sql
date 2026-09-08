-- Verify clean NEET Physics counts after 0127 + 0128 Part 1.
SELECT
  t.topic_code,
  st.subtopic_code,
  COUNT(q.id) AS active_questions
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
JOIN education_subtopics st ON st.topic_id=t.id AND st.enabled=1
LEFT JOIN education_questions q ON q.subtopic_id=st.id AND q.active=1
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.enabled=1
GROUP BY t.topic_code, st.subtopic_code
ORDER BY t.sort_order, st.sort_order;
