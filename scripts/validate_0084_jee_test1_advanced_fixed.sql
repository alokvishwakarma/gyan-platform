-- Validate JEE Test 1 Advanced v1 after 0084 (and optionally 0085).
-- scripts/validate_0084_jee_test1_advanced_fixed.sql

SELECT
  id,
  program_code,
  test_kind,
  test_code,
  test_name,
  exam_level,
  version,
  access_mode,
  published
FROM education_mock_tests
WHERE program_code='JEE'
  AND test_kind='FULL'
  AND test_code='TEST_1'
  AND exam_level='ADVANCED'
  AND version=1;

SELECT
  COUNT(*) AS question_count,
  COUNT(DISTINCT mtq.question_id) AS distinct_question_count,
  MIN(mtq.question_order) AS min_order,
  MAX(mtq.question_order) AS max_order,
  SUM(COALESCE(mtq.marks_correct,0)) AS maximum_marks
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt ON mt.id=mtq.mock_test_id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1;

SELECT
  mtq.section_code,
  qm.question_format,
  COUNT(*) AS question_count,
  SUM(COALESCE(mtq.marks_correct,0)) AS maximum_marks
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt ON mt.id=mtq.mock_test_id
JOIN education_question_metadata qm ON qm.question_id=mtq.question_id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
GROUP BY mtq.section_code, qm.question_format
ORDER BY
  CASE mtq.section_code
    WHEN 'MATH' THEN 1
    WHEN 'PHYSICS' THEN 2
    WHEN 'CHEMISTRY' THEN 3
    ELSE 9
  END,
  qm.question_format;

-- Every expected order 1..54 should be present exactly once.
WITH RECURSIVE expected(n) AS (
  SELECT 1
  UNION ALL
  SELECT n+1 FROM expected WHERE n<54
)
SELECT expected.n AS missing_question_order
FROM expected
LEFT JOIN education_mock_test_questions mtq
  ON mtq.question_order=expected.n
 AND mtq.mock_test_id=(
   SELECT id
   FROM education_mock_tests
   WHERE program_code='JEE'
     AND test_kind='FULL'
     AND test_code='TEST_1'
     AND exam_level='ADVANCED'
     AND version=1
   LIMIT 1
 )
WHERE mtq.question_id IS NULL;

-- Must return zero rows: Advanced Test 1 must not reuse Main Test 1 questions.
SELECT
  adv.question_order AS advanced_order,
  main.question_order AS main_order,
  q.question_key
FROM education_mock_test_questions adv
JOIN education_mock_tests advt ON advt.id=adv.mock_test_id
JOIN education_mock_test_questions main ON main.question_id=adv.question_id
JOIN education_mock_tests maint ON maint.id=main.mock_test_id
JOIN education_questions q ON q.id=adv.question_id
WHERE advt.program_code='JEE'
  AND advt.test_kind='FULL'
  AND advt.test_code='TEST_1'
  AND advt.exam_level='ADVANCED'
  AND advt.version=1
  AND maint.program_code='JEE'
  AND maint.test_kind='FULL'
  AND maint.test_code='TEST_1'
  AND maint.exam_level='MAIN'
  AND maint.version=1;

-- Spot-check all fixed questions in order.
SELECT
  mtq.question_order,
  mtq.section_code,
  qm.question_format,
  q.question_key,
  q.difficulty,
  q.correct_choice,
  mtq.marks_correct,
  mtq.marks_incorrect
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt ON mt.id=mtq.mock_test_id
JOIN education_questions q ON q.id=mtq.question_id
JOIN education_question_metadata qm ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
ORDER BY mtq.question_order;
