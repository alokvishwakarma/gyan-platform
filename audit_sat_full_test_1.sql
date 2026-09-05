-- audit_sat_full_test_1.sql

-- Test row.
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
WHERE
  program_code='SAT'
  AND test_kind='FULL'
  AND test_code='TEST_1'
  AND exam_level='MAIN'
  AND version=1;

-- Expected: 98.
SELECT
  COUNT(*) AS total_questions,
  COUNT(DISTINCT mtq.question_id) AS unique_questions
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt
  ON mt.id=mtq.mock_test_id
WHERE
  mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1;

-- Expected:
-- RW_M1    27  1..27
-- RW_M2    27  28..54
-- MATH_M1  22  55..76
-- MATH_M2  22  77..98
SELECT
  mtq.section_code,
  COUNT(*) AS questions,
  MIN(mtq.question_order) AS first_question,
  MAX(mtq.question_order) AS last_question
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt
  ON mt.id=mtq.mock_test_id
WHERE
  mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY mtq.section_code
ORDER BY MIN(mtq.question_order);

-- Subject totals: expected RW 54, MATH 44.
SELECT
  s.subject_code,
  COUNT(*) AS questions
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt
  ON mt.id=mtq.mock_test_id
JOIN education_questions q
  ON q.id=mtq.question_id
JOIN education_subtopics st
  ON st.id=q.subtopic_id
JOIN education_topics t
  ON t.id=st.topic_id
JOIN education_subjects s
  ON s.id=t.subject_id
WHERE
  mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY s.subject_code
ORDER BY s.subject_code;

-- Skill coverage.
SELECT
  s.subject_code,
  t.topic_code,
  st.subtopic_code,
  COUNT(*) AS questions
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt
  ON mt.id=mtq.mock_test_id
JOIN education_questions q
  ON q.id=mtq.question_id
JOIN education_subtopics st
  ON st.id=q.subtopic_id
JOIN education_topics t
  ON t.id=st.topic_id
JOIN education_subjects s
  ON s.id=t.subject_id
WHERE
  mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY
  s.subject_code,
  t.topic_code,
  st.subtopic_code
ORDER BY
  s.subject_code,
  t.sort_order,
  st.sort_order;

-- Expected: zero rows.
SELECT
  mtq.question_id
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt
  ON mt.id=mtq.mock_test_id
LEFT JOIN education_mock_question_answers mqa
  ON mqa.question_id=mtq.question_id
WHERE
  mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND (
    mqa.answer_key IS NULL
    OR TRIM(mqa.answer_key)=''
  );

-- Inspect first/last question of every module.
SELECT
  mtq.question_order,
  mtq.section_code,
  s.subject_code,
  t.topic_code,
  st.subtopic_code,
  q.question_key
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt
  ON mt.id=mtq.mock_test_id
JOIN education_questions q
  ON q.id=mtq.question_id
JOIN education_subtopics st
  ON st.id=q.subtopic_id
JOIN education_topics t
  ON t.id=st.topic_id
JOIN education_subjects s
  ON s.id=t.subject_id
WHERE
  mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND mtq.question_order IN (
    1,27,28,54,55,76,77,98
  )
ORDER BY mtq.question_order;
