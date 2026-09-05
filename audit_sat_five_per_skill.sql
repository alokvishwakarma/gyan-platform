-- audit_sat_five_per_skill.sql

-- Expected: zero rows.
SELECT
  s.subject_code,
  t.topic_code,
  st.subtopic_code,
  st.subtopic_name,
  COUNT(q.id) AS active_questions
FROM education_subjects s
JOIN education_topics t ON t.subject_id=s.id
JOIN education_subtopics st ON st.topic_id=t.id
LEFT JOIN education_questions q
  ON q.subtopic_id=st.id
 AND q.active=1
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
GROUP BY s.subject_code,t.id,st.id
HAVING COUNT(q.id) <> 5
ORDER BY s.sort_order,t.sort_order,st.sort_order;

-- Expected totals: RW 55, MATH 95, total 150.
SELECT
  s.subject_code,
  COUNT(q.id) AS active_questions
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND q.active=1
GROUP BY s.subject_code
ORDER BY s.sort_order;

SELECT COUNT(q.id) AS total_sat_questions
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND q.active=1;
