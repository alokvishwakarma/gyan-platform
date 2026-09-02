-- READ ONLY: validate JEE Test 1 Main v1.
SELECT
  mt.test_code,
  mt.exam_level,
  mt.access_mode,
  mt.published,
  COUNT(mtq.question_id) AS questions,
  SUM(mtq.marks_correct) AS maximum_marks
FROM education_mock_tests mt
LEFT JOIN education_mock_test_questions mtq ON mtq.mock_test_id=mt.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY mt.id;

-- Expected before 0083: TEST_1 MAIN OPEN 0 75 300
-- Expected after 0083:  TEST_1 MAIN OPEN 1 75 300

SELECT
  mtq.section_code,
  COUNT(*) AS questions,
  SUM(CASE WHEN qm.question_format='SINGLE_CHOICE' THEN 1 ELSE 0 END) AS mcq,
  SUM(CASE WHEN qm.question_format='NUMERICAL' THEN 1 ELSE 0 END) AS numerical,
  SUM(mtq.marks_correct) AS max_marks
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq ON mtq.mock_test_id=mt.id
JOIN education_questions q ON q.id=mtq.question_id
LEFT JOIN education_question_metadata qm ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY mtq.section_code
ORDER BY CASE mtq.section_code WHEN 'MATH' THEN 1 WHEN 'PHYSICS' THEN 2 ELSE 3 END;

-- Expected per subject: 25 questions = 20 MCQ + 5 NUMERICAL, 100 marks.

SELECT
  COUNT(DISTINCT mtq.question_id) AS unique_questions,
  COUNT(DISTINCT mtq.question_order) AS unique_orders,
  MIN(mtq.question_order) AS first_order,
  MAX(mtq.question_order) AS last_order
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq ON mtq.mock_test_id=mt.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1;

-- Expected: 75 / 75 / 1 / 75.
