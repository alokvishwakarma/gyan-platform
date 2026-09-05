-- audit_sat_rebuild_catalog.sql

-- Expected: 0 legacy SAT questions after 0099, before new starter bank.
SELECT COUNT(*) AS sat_questions
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT';

-- Expected:
-- RW   4 domains, 11 skills
-- MATH 4 domains, 19 skills
SELECT
  s.subject_code,
  COUNT(DISTINCT t.id) AS domains,
  COUNT(DISTINCT st.id) AS skills
FROM education_subjects s
LEFT JOIN education_topics t
  ON t.subject_id=s.id AND t.enabled=1
LEFT JOIN education_subtopics st
  ON st.topic_id=t.id AND st.enabled=1
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
GROUP BY s.subject_code
ORDER BY s.sort_order;

-- Detailed catalog.
SELECT
  s.subject_code,
  t.topic_code,
  t.topic_name,
  st.subtopic_code,
  st.subtopic_name
FROM education_subjects s
JOIN education_topics t ON t.subject_id=s.id
JOIN education_subtopics st ON st.topic_id=t.id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
ORDER BY s.sort_order,t.sort_order,st.sort_order;

-- Expected: 0 SAT mock tests until the new SAT runner/test bank is built.
SELECT COUNT(*) AS sat_mock_tests
FROM education_mock_tests
WHERE program_code='SAT';
