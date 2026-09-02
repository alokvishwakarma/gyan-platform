-- READ ONLY: validate fixed JEE Mini A Main v1

-- 1) Test shell and assignment count.
SELECT
  mt.id,
  mt.test_name,
  mt.exam_level,
  mt.version,
  mt.access_mode,
  mt.published,
  COUNT(mtq.question_id) AS assigned_questions,
  SUM(CASE WHEN mtq.section_code='MATH' THEN 1 ELSE 0 END) AS math_questions,
  SUM(CASE WHEN mtq.section_code='PHYSICS' THEN 1 ELSE 0 END) AS physics_questions,
  SUM(CASE WHEN mtq.section_code='CHEMISTRY' THEN 1 ELSE 0 END) AS chemistry_questions,
  SUM(mtq.marks_correct) AS maximum_marks
FROM education_mock_tests mt
LEFT JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id=mt.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY mt.id;

-- Expected:
-- assigned_questions = 15
-- math_questions = 5
-- physics_questions = 5
-- chemistry_questions = 5
-- maximum_marks = 60
-- published = 0

-- 2) Exact fixed order.
SELECT
  mtq.question_order,
  mtq.section_code,
  q.question_key,
  q.difficulty,
  q.question_text,
  mtq.marks_correct,
  mtq.marks_incorrect
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt
  ON mt.id=mtq.mock_test_id
JOIN education_questions q
  ON q.id=mtq.question_id
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1
ORDER BY mtq.question_order;

-- 3) No duplicate question within Mini A.
-- Expected: ZERO rows.
SELECT
  mtq.question_id,
  COUNT(*) AS copies
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt
  ON mt.id=mtq.mock_test_id
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY mtq.question_id
HAVING COUNT(*) > 1;

-- 4) Orders must be contiguous 1..15.
SELECT
  MIN(mtq.question_order) AS first_order,
  MAX(mtq.question_order) AS last_order,
  COUNT(DISTINCT mtq.question_order) AS distinct_orders
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt
  ON mt.id=mtq.mock_test_id
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1;
