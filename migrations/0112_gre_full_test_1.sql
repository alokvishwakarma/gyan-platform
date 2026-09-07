-- 0112_gre_full_test_1.sql
-- GRE Full Test 1: 54 scored questions
--   Verbal: 27
--   Quant:  27
--
-- Compatibility-first full test:
-- Uses runner-compatible GRE item types only for v1.
-- Verbal is drawn from Reading Comprehension and single-blank Text Completion.
-- Quant is standard single-choice.
--
-- This matches the current scored GRE Verbal/Quant count (27 + 27).
-- Analytical Writing remains separate and is not part of this fixed-test runner yet.
-- No negative marking.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO education_mock_tests
(program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published)
VALUES ('GRE','FULL','TEST_1','Test 1','MAIN',1,'OPEN',1);

DELETE FROM education_mock_test_questions
WHERE mock_test_id IN (
  SELECT id
  FROM education_mock_tests
  WHERE program_code='GRE'
    AND test_kind='FULL'
    AND test_code='TEST_1'
    AND exam_level='MAIN'
    AND version=1
);

-- ------------------------------------------------------------
-- Verbal: 27 compatible questions.
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
  CASE
    WHEN vr.rn <= 12 THEN 'VERBAL_1'
    ELSE 'VERBAL_2'
  END,
  1,
  0,
  0
FROM verbal_ranked vr
JOIN education_mock_tests mt
  ON mt.program_code='GRE'
 AND mt.test_kind='FULL'
 AND mt.test_code='TEST_1'
 AND mt.exam_level='MAIN'
 AND mt.version=1
WHERE vr.rn<=27;

-- ------------------------------------------------------------
-- Quant: 27 questions.
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
  27 + qr.rn,
  CASE
    WHEN qr.rn <= 12 THEN 'QUANT_1'
    ELSE 'QUANT_2'
  END,
  1,
  0,
  0
FROM quant_ranked qr
JOIN education_mock_tests mt
  ON mt.program_code='GRE'
 AND mt.test_kind='FULL'
 AND mt.test_code='TEST_1'
 AND mt.exam_level='MAIN'
 AND mt.version=1
WHERE qr.rn<=27;

-- Audit: expected question_count = 54.
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
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY mt.id;

-- Section audit: expected 12, 15, 12, 15.
SELECT
  mtq.section_code,
  COUNT(*) AS question_count
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt
  ON mt.id=mtq.mock_test_id
WHERE mt.program_code='GRE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY mtq.section_code
ORDER BY MIN(mtq.question_order);
