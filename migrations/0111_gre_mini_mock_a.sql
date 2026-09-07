-- 0111_gre_mini_mock_a.sql
-- GRE Mini A: first live GRE fixed mock.
-- 20 questions total: 10 Verbal + 10 Quant.
--
-- Compatibility-first mini:
--   Verbal uses Reading Comprehension and single-blank Text Completion only.
--   Quant uses standard single-choice items.
-- This intentionally avoids 6-choice Sentence Equivalence and multi-blank
-- Text Completion until the fixed-test runner is extended for those formats.
--
-- No negative marking.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO education_mock_tests
(program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published)
VALUES ('GRE','MINI','MINI_A','GRE Mini A','MAIN',1,'OPEN',1);

DELETE FROM education_mock_test_questions
WHERE mock_test_id IN (
  SELECT id
  FROM education_mock_tests
  WHERE program_code='GRE'
    AND test_kind='MINI'
    AND test_code='MINI_A'
    AND exam_level='MAIN'
    AND version=1
);

-- ------------------------------------------------------------
-- Verbal: 10 questions.
-- Use only runner-compatible GRE verbal formats for Mini A v1:
-- Reading Comprehension + single-blank Text Completion.
-- ------------------------------------------------------------
WITH verbal_ranked AS (
  SELECT
    q.id AS question_id,
    ROW_NUMBER() OVER (
      ORDER BY
        CASE t.topic_code
          WHEN 'READING_COMPREHENSION' THEN 10
          WHEN 'TEXT_COMPLETION' THEN 20
          ELSE 90
        END,
        t.sort_order,
        st.sort_order,
        q.question_key,
        q.id
    ) AS rn
  FROM education_questions q
  JOIN education_subtopics st ON st.id=q.subtopic_id
  JOIN education_topics t ON t.id=st.topic_id
  JOIN education_subjects s ON s.id=t.subject_id
  JOIN education_gre_question_details gd ON gd.question_id=q.id
  WHERE s.country_code='US'
    AND s.grade_code='PROGRAM_GRE'
    AND s.subject_code='VERBAL'
    AND q.active=1
    AND (
      gd.response_type='READING_COMPREHENSION'
      OR (
        gd.response_type='TEXT_COMPLETION'
        AND gd.blank_count=1
      )
    )
)
INSERT OR IGNORE INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  vr.question_id,
  vr.rn,
  'VERBAL',
  1,
  0,
  0
FROM verbal_ranked vr
JOIN education_mock_tests mt
  ON mt.program_code='GRE'
 AND mt.test_kind='MINI'
 AND mt.test_code='MINI_A'
 AND mt.exam_level='MAIN'
 AND mt.version=1
WHERE vr.rn<=10;

-- ------------------------------------------------------------
-- Quant: 10 standard single-choice questions.
-- ------------------------------------------------------------
WITH quant_ranked AS (
  SELECT
    q.id AS question_id,
    ROW_NUMBER() OVER (
      ORDER BY
        t.sort_order,
        st.sort_order,
        q.question_key,
        q.id
    ) AS rn
  FROM education_questions q
  JOIN education_subtopics st ON st.id=q.subtopic_id
  JOIN education_topics t ON t.id=st.topic_id
  JOIN education_subjects s ON s.id=t.subject_id
  JOIN education_gre_question_details gd ON gd.question_id=q.id
  WHERE s.country_code='US'
    AND s.grade_code='PROGRAM_GRE'
    AND s.subject_code='QUANT'
    AND q.active=1
    AND gd.response_type='SINGLE_CHOICE'
)
INSERT OR IGNORE INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  qr.question_id,
  10 + qr.rn,
  'QUANT',
  1,
  0,
  0
FROM quant_ranked qr
JOIN education_mock_tests mt
  ON mt.program_code='GRE'
 AND mt.test_kind='MINI'
 AND mt.test_code='MINI_A'
 AND mt.exam_level='MAIN'
 AND mt.version=1
WHERE qr.rn<=10;

-- Audit: expected one row, question_count = 20.
SELECT
  mt.program_code,
  mt.test_kind,
  mt.test_code,
  mt.exam_level,
  mt.access_mode,
  mt.published,
  COUNT(mtq.question_id) AS question_count
FROM education_mock_tests mt
LEFT JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id=mt.id
WHERE mt.program_code='GRE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY mt.id;
