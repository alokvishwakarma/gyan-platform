-- 0144_freeze_first_live_question_sets.sql
--
-- Freeze the first Live Test question sets.
--
-- #237J — JEE weekday 10% — 8 questions / 18 min
--   Math       3  Straight Lines
--   Physics    3  Center of Mass
--   Chemistry  2  Chemical & Ionic Equilibrium
--
-- #237N — NEET weekday 10% — 18 questions / 18 min
--   Physics    4  Center of Mass
--   Chemistry  5  Equilibrium
--   Biology    9  Cell Structure and Function
--
-- Existing question rows are referenced only; no question text is copied.
-- Safe to rerun because education_live_test_questions has
-- PRIMARY KEY(live_test_id, question_order) and UNIQUE(live_test_id, question_id).

PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;


-- ============================================================
-- JEE #237J
-- ============================================================

-- Math 1-3: Straight Lines
WITH chosen AS (
  SELECT
    q.id AS question_id,
    ROW_NUMBER() OVER (
      ORDER BY
        CASE lower(q.difficulty)
          WHEN 'medium' THEN 1
          WHEN 'easy' THEN 2
          WHEN 'hard' THEN 3
          WHEN 'challenge' THEN 4
          ELSE 5
        END,
        q.id
    ) AS rn
  FROM education_questions q
  JOIN education_subtopics st
    ON st.id = q.subtopic_id
  JOIN education_topics t
    ON t.id = st.topic_id
  JOIN education_subjects s
    ON s.id = t.subject_id
  WHERE
    q.active = 1
    AND s.country_code = 'IN'
    AND s.grade_code = 'PROGRAM_JEE'
    AND s.subject_code = 'MATH'
    AND t.topic_code = 'STRAIGHT_LINES'
)
INSERT OR IGNORE INTO education_live_test_questions (
  live_test_id,
  question_id,
  question_order,
  section_code,
  source_subject_code,
  source_topic_code,
  selection_reason
)
SELECT
  lt.id,
  c.question_id,
  c.rn,
  'MATH',
  'MATH',
  'STRAIGHT_LINES',
  'TOPIC'
FROM chosen c
JOIN education_live_tests lt
  ON lt.public_code = '237J'
WHERE c.rn <= 3;


-- Physics 4-6: Center of Mass
WITH chosen AS (
  SELECT
    q.id AS question_id,
    ROW_NUMBER() OVER (
      ORDER BY
        CASE lower(q.difficulty)
          WHEN 'medium' THEN 1
          WHEN 'easy' THEN 2
          WHEN 'hard' THEN 3
          WHEN 'challenge' THEN 4
          ELSE 5
        END,
        q.id
    ) AS rn
  FROM education_questions q
  JOIN education_subtopics st
    ON st.id = q.subtopic_id
  JOIN education_topics t
    ON t.id = st.topic_id
  JOIN education_subjects s
    ON s.id = t.subject_id
  WHERE
    q.active = 1
    AND s.country_code = 'IN'
    AND s.grade_code = 'PROGRAM_JEE'
    AND s.subject_code = 'PHYSICS'
    AND t.topic_code = 'CENTER_OF_MASS'
)
INSERT OR IGNORE INTO education_live_test_questions (
  live_test_id,
  question_id,
  question_order,
  section_code,
  source_subject_code,
  source_topic_code,
  selection_reason
)
SELECT
  lt.id,
  c.question_id,
  3 + c.rn,
  'PHYSICS',
  'PHYSICS',
  'CENTER_OF_MASS',
  'TOPIC'
FROM chosen c
JOIN education_live_tests lt
  ON lt.public_code = '237J'
WHERE c.rn <= 3;


-- Chemistry 7-8: Equilibrium
WITH chosen AS (
  SELECT
    q.id AS question_id,
    ROW_NUMBER() OVER (
      ORDER BY
        CASE lower(q.difficulty)
          WHEN 'medium' THEN 1
          WHEN 'easy' THEN 2
          WHEN 'hard' THEN 3
          WHEN 'challenge' THEN 4
          ELSE 5
        END,
        q.id
    ) AS rn
  FROM education_questions q
  JOIN education_subtopics st
    ON st.id = q.subtopic_id
  JOIN education_topics t
    ON t.id = st.topic_id
  JOIN education_subjects s
    ON s.id = t.subject_id
  WHERE
    q.active = 1
    AND s.country_code = 'IN'
    AND s.grade_code = 'PROGRAM_JEE'
    AND s.subject_code = 'CHEMISTRY'
    AND t.topic_code = 'EQUILIBRIUM'
)
INSERT OR IGNORE INTO education_live_test_questions (
  live_test_id,
  question_id,
  question_order,
  section_code,
  source_subject_code,
  source_topic_code,
  selection_reason
)
SELECT
  lt.id,
  c.question_id,
  6 + c.rn,
  'CHEMISTRY',
  'CHEMISTRY',
  'EQUILIBRIUM',
  'TOPIC'
FROM chosen c
JOIN education_live_tests lt
  ON lt.public_code = '237J'
WHERE c.rn <= 2;


-- ============================================================
-- NEET #237N
-- ============================================================

-- Physics 1-4: Center of Mass
WITH chosen AS (
  SELECT
    q.id AS question_id,
    ROW_NUMBER() OVER (
      ORDER BY
        CASE lower(q.difficulty)
          WHEN 'medium' THEN 1
          WHEN 'easy' THEN 2
          WHEN 'hard' THEN 3
          WHEN 'challenge' THEN 4
          ELSE 5
        END,
        q.id
    ) AS rn
  FROM education_questions q
  JOIN education_subtopics st
    ON st.id = q.subtopic_id
  JOIN education_topics t
    ON t.id = st.topic_id
  JOIN education_subjects s
    ON s.id = t.subject_id
  WHERE
    q.active = 1
    AND s.country_code = 'IN'
    AND s.grade_code = 'PROGRAM_NEET'
    AND s.subject_code = 'PHYSICS'
    AND t.topic_code = 'CENTER_OF_MASS'
)
INSERT OR IGNORE INTO education_live_test_questions (
  live_test_id,
  question_id,
  question_order,
  section_code,
  source_subject_code,
  source_topic_code,
  selection_reason
)
SELECT
  lt.id,
  c.question_id,
  c.rn,
  'PHYSICS',
  'PHYSICS',
  'CENTER_OF_MASS',
  'TOPIC'
FROM chosen c
JOIN education_live_tests lt
  ON lt.public_code = '237N'
WHERE c.rn <= 4;


-- Chemistry 5-9: Equilibrium
WITH chosen AS (
  SELECT
    q.id AS question_id,
    ROW_NUMBER() OVER (
      ORDER BY
        CASE lower(q.difficulty)
          WHEN 'medium' THEN 1
          WHEN 'easy' THEN 2
          WHEN 'hard' THEN 3
          WHEN 'challenge' THEN 4
          ELSE 5
        END,
        q.id
    ) AS rn
  FROM education_questions q
  JOIN education_subtopics st
    ON st.id = q.subtopic_id
  JOIN education_topics t
    ON t.id = st.topic_id
  JOIN education_subjects s
    ON s.id = t.subject_id
  WHERE
    q.active = 1
    AND s.country_code = 'IN'
    AND s.grade_code = 'PROGRAM_NEET'
    AND s.subject_code = 'CHEMISTRY'
    AND t.topic_code = 'EQUILIBRIUM'
)
INSERT OR IGNORE INTO education_live_test_questions (
  live_test_id,
  question_id,
  question_order,
  section_code,
  source_subject_code,
  source_topic_code,
  selection_reason
)
SELECT
  lt.id,
  c.question_id,
  4 + c.rn,
  'CHEMISTRY',
  'CHEMISTRY',
  'EQUILIBRIUM',
  'TOPIC'
FROM chosen c
JOIN education_live_tests lt
  ON lt.public_code = '237N'
WHERE c.rn <= 5;


-- Biology 10-18: Cell Structure and Function
WITH chosen AS (
  SELECT
    q.id AS question_id,
    ROW_NUMBER() OVER (
      ORDER BY
        CASE lower(q.difficulty)
          WHEN 'medium' THEN 1
          WHEN 'easy' THEN 2
          WHEN 'hard' THEN 3
          WHEN 'challenge' THEN 4
          ELSE 5
        END,
        q.id
    ) AS rn
  FROM education_questions q
  JOIN education_subtopics st
    ON st.id = q.subtopic_id
  JOIN education_topics t
    ON t.id = st.topic_id
  JOIN education_subjects s
    ON s.id = t.subject_id
  WHERE
    q.active = 1
    AND s.country_code = 'IN'
    AND s.grade_code = 'PROGRAM_NEET'
    AND s.subject_code = 'BIOLOGY'
    AND t.topic_code = 'CELL_STRUCTURE_FUNCTION'
)
INSERT OR IGNORE INTO education_live_test_questions (
  live_test_id,
  question_id,
  question_order,
  section_code,
  source_subject_code,
  source_topic_code,
  selection_reason
)
SELECT
  lt.id,
  c.question_id,
  9 + c.rn,
  'BIOLOGY',
  'BIOLOGY',
  'CELL_STRUCTURE_FUNCTION',
  'TOPIC'
FROM chosen c
JOIN education_live_tests lt
  ON lt.public_code = '237N'
WHERE c.rn <= 9;


COMMIT;


-- ============================================================
-- Verification 1: count by event / section
-- ============================================================

SELECT
  lt.public_code,
  lt.program_code,
  lq.section_code,
  COUNT(*) AS questions
FROM education_live_test_questions lq
JOIN education_live_tests lt
  ON lt.id = lq.live_test_id
WHERE
  lt.public_code IN (
    '237J',
    '237N'
  )
GROUP BY
  lt.public_code,
  lt.program_code,
  lq.section_code
ORDER BY
  lt.public_code,
  CASE lq.section_code
    WHEN 'MATH' THEN 1
    WHEN 'PHYSICS' THEN 2
    WHEN 'CHEMISTRY' THEN 3
    WHEN 'BIOLOGY' THEN 4
    ELSE 9
  END;


-- ============================================================
-- Verification 2: frozen order + difficulty + source
-- ============================================================

SELECT
  lt.public_code,
  lq.question_order,
  lq.section_code,
  lq.source_topic_code,
  q.id AS question_id,
  q.difficulty,
  q.question_text
FROM education_live_test_questions lq
JOIN education_live_tests lt
  ON lt.id = lq.live_test_id
JOIN education_questions q
  ON q.id = lq.question_id
WHERE
  lt.public_code IN (
    '237J',
    '237N'
  )
ORDER BY
  lt.public_code,
  lq.question_order;
