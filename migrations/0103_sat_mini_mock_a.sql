-- 0103_sat_mini_mock_a_corrected.sql
-- SAT Mini A pilot: 40 fixed MCQs.
-- Internal compatibility: exam_level='MAIN'; program_code='SAT' is authoritative.
-- Existing education_mock_test_questions schema has no marks_incorrect column.

INSERT OR IGNORE INTO education_mock_tests (
  program_code,
  test_kind,
  test_code,
  test_name,
  exam_level,
  version,
  access_mode,
  published
)
VALUES (
  'SAT',
  'MINI',
  'MINI_A',
  'SAT Mini A',
  'MAIN',
  1,
  'OPEN',
  1
);

-- Clean any partial/manual mappings from earlier failed attempts.
DELETE FROM education_mock_test_questions
WHERE mock_test_id IN (
  SELECT id
  FROM education_mock_tests
  WHERE program_code='SAT'
    AND test_kind='MINI'
    AND test_code='MINI_A'
    AND exam_level='MAIN'
    AND version=1
);

-- Reading & Writing: first 20 questions spread across skills.
WITH ranked_rw AS (
  SELECT
    q.id AS question_id,
    ROW_NUMBER() OVER (
      ORDER BY
        CAST(SUBSTR(q.question_key, -3) AS INTEGER),
        t.sort_order,
        st.sort_order,
        q.question_key
    ) AS rn
  FROM education_questions q
  JOIN education_subtopics st ON st.id=q.subtopic_id
  JOIN education_topics t ON t.id=st.topic_id
  JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US'
    AND s.grade_code='PROGRAM_SAT'
    AND s.subject_code='RW'
    AND q.active=1
)
INSERT INTO education_mock_test_questions (
  mock_test_id,
  question_id,
  question_order,
  section_code,
  marks_correct,
  marks_unanswered
)
SELECT
  mt.id,
  rw.question_id,
  rw.rn,
  CASE WHEN rw.rn<=10 THEN 'RW_M1' ELSE 'RW_M2' END,
  1,
  0
FROM ranked_rw rw
JOIN education_mock_tests mt
  ON mt.program_code='SAT'
 AND mt.test_kind='MINI'
 AND mt.test_code='MINI_A'
 AND mt.exam_level='MAIN'
 AND mt.version=1
WHERE rw.rn BETWEEN 1 AND 20;

-- Math: first 20 questions spread across skills.
WITH ranked_math AS (
  SELECT
    q.id AS question_id,
    ROW_NUMBER() OVER (
      ORDER BY
        CAST(SUBSTR(q.question_key, -3) AS INTEGER),
        t.sort_order,
        st.sort_order,
        q.question_key
    ) AS rn
  FROM education_questions q
  JOIN education_subtopics st ON st.id=q.subtopic_id
  JOIN education_topics t ON t.id=st.topic_id
  JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US'
    AND s.grade_code='PROGRAM_SAT'
    AND s.subject_code='MATH'
    AND q.active=1
)
INSERT INTO education_mock_test_questions (
  mock_test_id,
  question_id,
  question_order,
  section_code,
  marks_correct,
  marks_unanswered
)
SELECT
  mt.id,
  math.question_id,
  20+math.rn,
  CASE WHEN math.rn<=10 THEN 'MATH_M1' ELSE 'MATH_M2' END,
  1,
  0
FROM ranked_math math
JOIN education_mock_tests mt
  ON mt.program_code='SAT'
 AND mt.test_kind='MINI'
 AND mt.test_code='MINI_A'
 AND mt.exam_level='MAIN'
 AND mt.version=1
WHERE math.rn BETWEEN 1 AND 20;

INSERT OR REPLACE INTO education_mock_question_answers (
  question_id,
  answer_key
)
SELECT
  mtq.question_id,
  q.correct_choice
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt ON mt.id=mtq.mock_test_id
JOIN education_questions q ON q.id=mtq.question_id
WHERE mt.program_code='SAT'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1;
