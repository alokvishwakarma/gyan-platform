-- audit_neet_mock1.sql

SELECT
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.access_mode,
  mt.published,
  COUNT(mtq.question_id) AS questions,
  SUM(CASE WHEN mtq.section_code='PHYSICS' THEN 1 ELSE 0 END) AS physics,
  SUM(CASE WHEN mtq.section_code='CHEMISTRY' THEN 1 ELSE 0 END) AS chemistry,
  SUM(CASE WHEN mtq.section_code='BIOLOGY' THEN 1 ELSE 0 END) AS biology,
  SUM(COALESCE(mtq.marks_correct,0)) AS maximum_marks
FROM education_mock_tests mt
LEFT JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id=mt.id
WHERE mt.program_code='NEET'
  AND mt.version=1
  AND mt.test_code IN ('TEST_1','MINI_A')
GROUP BY mt.id
ORDER BY mt.test_kind DESC,mt.test_code;

-- Expected Test 1: 180 = 45 Physics + 45 Chemistry + 90 Biology, max 720.
-- Expected Mini A: 15 = 5 + 5 + 5, max 60.

SELECT
  s.subject_code,
  COUNT(q.id) AS active_questions
FROM education_subjects s
JOIN education_topics t ON t.subject_id=s.id
JOIN education_subtopics st ON st.topic_id=t.id
JOIN education_questions q ON q.subtopic_id=st.id AND q.active=1
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
GROUP BY s.subject_code
ORDER BY s.sort_order;
