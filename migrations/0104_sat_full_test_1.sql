-- 0104_sat_full_test_1.sql
-- GYAN SAT Full Test 1
--
-- Current digital SAT structure:
--   Reading & Writing Module 1 : 27 questions
--   Reading & Writing Module 2 : 27 questions
--   Math Module 1              : 22 questions
--   Math Module 2              : 22 questions
--   Total                      : 98 questions
--
-- Pilot scoring in GYAN: +1 correct, 0 incorrect, 0 unanswered.
-- Module 2 remains fixed for now; adaptive routing can be added later.
--
-- Internal compatibility:
-- education_mock_tests.exam_level currently accepts MAIN/ADVANCED/NEET only.
-- program_code='SAT' is authoritative; exam_level='MAIN' is compatibility only.

PRAGMA foreign_keys = ON;

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
  'FULL',
  'TEST_1',
  'Test 1',
  'MAIN',
  1,
  'OPEN',
  1
);

-- Rebuild Test 1 mappings deterministically if this migration is rerun.
DELETE FROM education_mock_test_questions
WHERE mock_test_id IN (
  SELECT id
  FROM education_mock_tests
  WHERE program_code='SAT'
    AND test_kind='FULL'
    AND test_code='TEST_1'
    AND exam_level='MAIN'
    AND version=1
);

-- ------------------------------------------------------------
-- Reading & Writing: 54 questions.
--
-- The starter bank has 11 skills x 5 questions = 55 questions.
-- Order by question suffix first, then domain/skill order, to spread
-- questions broadly across the complete R&W skill catalog.
-- ------------------------------------------------------------

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
  JOIN education_subtopics st
    ON st.id=q.subtopic_id
  JOIN education_topics t
    ON t.id=st.topic_id
  JOIN education_subjects s
    ON s.id=t.subject_id
  WHERE
    s.country_code='US'
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
  CASE
    WHEN rw.rn <= 27 THEN 'RW_M1'
    ELSE 'RW_M2'
  END,
  1,
  0
FROM ranked_rw rw
JOIN education_mock_tests mt
  ON mt.program_code='SAT'
 AND mt.test_kind='FULL'
 AND mt.test_code='TEST_1'
 AND mt.exam_level='MAIN'
 AND mt.version=1
WHERE rw.rn BETWEEN 1 AND 54;

-- ------------------------------------------------------------
-- Math: 44 questions.
--
-- The starter bank has 19 skills x 5 questions = 95 questions.
-- Again order by question suffix first to maximize breadth.
-- ------------------------------------------------------------

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
  JOIN education_subtopics st
    ON st.id=q.subtopic_id
  JOIN education_topics t
    ON t.id=st.topic_id
  JOIN education_subjects s
    ON s.id=t.subject_id
  WHERE
    s.country_code='US'
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
  54 + math.rn,
  CASE
    WHEN math.rn <= 22 THEN 'MATH_M1'
    ELSE 'MATH_M2'
  END,
  1,
  0
FROM ranked_math math
JOIN education_mock_tests mt
  ON mt.program_code='SAT'
 AND mt.test_kind='FULL'
 AND mt.test_code='TEST_1'
 AND mt.exam_level='MAIN'
 AND mt.version=1
WHERE math.rn BETWEEN 1 AND 44;

-- Fixed answer keys.
INSERT OR REPLACE INTO education_mock_question_answers (
  question_id,
  answer_key
)
SELECT
  mtq.question_id,
  q.correct_choice
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt
  ON mt.id=mtq.mock_test_id
JOIN education_questions q
  ON q.id=mtq.question_id
WHERE
  mt.program_code='SAT'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1;
