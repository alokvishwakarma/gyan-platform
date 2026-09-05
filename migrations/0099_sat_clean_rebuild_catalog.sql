-- 0099_sat_clean_rebuild_catalog.sql
-- D1-safe SAT clean rebuild: no TEMP tables, DROP TABLE, or PRAGMA.
-- Destructive only to legacy PROGRAM_SAT academic content and related attempts.
-- Keep sat_before_rebuild.sql before running this migration.

-- ================================================================
-- 1. Remove attempts that reference legacy SAT questions.
--    Deleting parent attempts cascades their answer rows.
-- ================================================================
DELETE FROM education_attempts
WHERE id IN (
  SELECT DISTINCT aa.attempt_id
  FROM education_attempt_answers aa
  WHERE aa.question_id IN (
    SELECT q.id
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  )
);

DELETE FROM education_mock_attempts
WHERE mock_test_id IN (
    SELECT id
    FROM education_mock_tests
    WHERE program_code='SAT'
  )
  OR id IN (
    SELECT DISTINCT maa.attempt_id
    FROM education_mock_attempt_answers maa
    WHERE maa.question_id IN (
      SELECT q.id
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
    )
  );

-- ================================================================
-- 2. Remove legacy SAT mock tests/mappings.
-- ================================================================
DELETE FROM education_mock_tests WHERE program_code='SAT';

DELETE FROM education_mock_test_questions
WHERE question_id IN (
  SELECT q.id
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
);

-- ================================================================
-- 3. Remove any remaining RESTRICT references to SAT questions.
-- ================================================================
DELETE FROM education_attempt_answers
WHERE question_id IN (
  SELECT q.id
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
);

DELETE FROM education_mock_attempt_answers
WHERE question_id IN (
  SELECT q.id
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
);

-- The following child tables use CASCADE, but explicit deletion makes
-- the rebuild boundary clear and makes reruns easier to audit.
DELETE FROM education_mock_question_answers
WHERE question_id IN (
  SELECT q.id
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
);

DELETE FROM education_student_question_history
WHERE question_id IN (
  SELECT q.id
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
);

DELETE FROM education_question_metadata
WHERE question_id IN (
  SELECT q.id
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
);

-- ================================================================
-- 4. Remove legacy SAT questions and old topic/subtopic catalog.
-- ================================================================
DELETE FROM education_questions
WHERE id IN (
  SELECT q.id
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
);

DELETE FROM education_subtopics
WHERE topic_id IN (
  SELECT t.id
  FROM education_topics t
  JOIN education_subjects s ON s.id=t.subject_id
  WHERE s.country_code='US'
    AND s.grade_code='PROGRAM_SAT'
);

DELETE FROM education_topics
WHERE subject_id IN (
  SELECT id
  FROM education_subjects
  WHERE country_code='US'
    AND grade_code='PROGRAM_SAT'
);

-- Keep SAT subjects; normalize their labels/order.
UPDATE education_subjects
SET subject_name='SAT Reading & Writing',
    enabled=1,
    sort_order=10,
    updated_at=CURRENT_TIMESTAMP
WHERE country_code='US'
  AND grade_code='PROGRAM_SAT'
  AND subject_code='RW';

UPDATE education_subjects
SET subject_name='SAT Math',
    enabled=1,
    sort_order=20,
    updated_at=CURRENT_TIMESTAMP
WHERE country_code='US'
  AND grade_code='PROGRAM_SAT'
  AND subject_code='MATH';

-- ================================================================
-- 5. Rebuild SAT domains (topics) and skills (subtopics).
-- ================================================================
INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT
  s.id,
  'INFO_IDEAS',
  'Information and Ideas',
  1,
  10
FROM education_subjects s
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND NOT EXISTS (
    SELECT 1
    FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='INFO_IDEAS'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'CENTRAL_IDEAS_DETAILS',
  'Central Ideas and Details',
  1,
  10
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='CENTRAL_IDEAS_DETAILS'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'INFERENCES',
  'Inferences',
  1,
  20
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='INFERENCES'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'COMMAND_EVIDENCE_TEXT',
  'Command of Evidence — Textual',
  1,
  30
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='COMMAND_EVIDENCE_TEXT'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'COMMAND_EVIDENCE_QUANT',
  'Command of Evidence — Quantitative',
  1,
  40
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='INFO_IDEAS'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='COMMAND_EVIDENCE_QUANT'
  );

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT
  s.id,
  'CRAFT_STRUCTURE',
  'Craft and Structure',
  1,
  20
FROM education_subjects s
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND NOT EXISTS (
    SELECT 1
    FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='CRAFT_STRUCTURE'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'WORDS_IN_CONTEXT',
  'Words in Context',
  1,
  10
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='WORDS_IN_CONTEXT'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'TEXT_STRUCTURE_PURPOSE',
  'Text Structure and Purpose',
  1,
  20
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='TEXT_STRUCTURE_PURPOSE'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'CROSS_TEXT_CONNECTIONS',
  'Cross-Text Connections',
  1,
  30
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='CRAFT_STRUCTURE'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='CROSS_TEXT_CONNECTIONS'
  );

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT
  s.id,
  'EXPRESSION_IDEAS',
  'Expression of Ideas',
  1,
  30
FROM education_subjects s
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND NOT EXISTS (
    SELECT 1
    FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='EXPRESSION_IDEAS'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'RHETORICAL_SYNTHESIS',
  'Rhetorical Synthesis',
  1,
  10
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='EXPRESSION_IDEAS'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='RHETORICAL_SYNTHESIS'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'TRANSITIONS',
  'Transitions',
  1,
  20
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='EXPRESSION_IDEAS'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='TRANSITIONS'
  );

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT
  s.id,
  'STANDARD_ENGLISH',
  'Standard English Conventions',
  1,
  40
FROM education_subjects s
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND NOT EXISTS (
    SELECT 1
    FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='STANDARD_ENGLISH'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'BOUNDARIES',
  'Boundaries',
  1,
  10
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='STANDARD_ENGLISH'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='BOUNDARIES'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'FORM_STRUCTURE_SENSE',
  'Form, Structure, and Sense',
  1,
  20
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='RW'
  AND t.topic_code='STANDARD_ENGLISH'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='FORM_STRUCTURE_SENSE'
  );

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT
  s.id,
  'ALGEBRA',
  'Algebra',
  1,
  10
FROM education_subjects s
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND NOT EXISTS (
    SELECT 1
    FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='ALGEBRA'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'LINEAR_EQ_1VAR',
  'Linear Equations in One Variable',
  1,
  10
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='LINEAR_EQ_1VAR'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'LINEAR_EQ_2VAR',
  'Linear Equations in Two Variables',
  1,
  20
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='LINEAR_EQ_2VAR'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'LINEAR_FUNCTIONS',
  'Linear Functions',
  1,
  30
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='LINEAR_FUNCTIONS'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'SYSTEMS_LINEAR',
  'Systems of Two Linear Equations in Two Variables',
  1,
  40
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='SYSTEMS_LINEAR'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'LINEAR_INEQUALITIES',
  'Linear Inequalities in One or Two Variables',
  1,
  50
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ALGEBRA'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='LINEAR_INEQUALITIES'
  );

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT
  s.id,
  'ADVANCED_MATH',
  'Advanced Math',
  1,
  20
FROM education_subjects s
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND NOT EXISTS (
    SELECT 1
    FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='ADVANCED_MATH'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'EQUIVALENT_EXPRESSIONS',
  'Equivalent Expressions',
  1,
  10
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='EQUIVALENT_EXPRESSIONS'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'NONLINEAR_EQUATIONS',
  'Nonlinear Equations in One Variable and Systems in Two Variables',
  1,
  20
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='NONLINEAR_EQUATIONS'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'NONLINEAR_FUNCTIONS',
  'Nonlinear Functions',
  1,
  30
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='ADVANCED_MATH'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='NONLINEAR_FUNCTIONS'
  );

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT
  s.id,
  'PROBLEM_SOLVING_DATA',
  'Problem-Solving and Data Analysis',
  1,
  30
FROM education_subjects s
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND NOT EXISTS (
    SELECT 1
    FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='PROBLEM_SOLVING_DATA'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'RATIOS_RATES_UNITS',
  'Ratios, Rates, Proportional Relationships, and Units',
  1,
  10
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='RATIOS_RATES_UNITS'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'PERCENTAGES',
  'Percentages',
  1,
  20
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='PERCENTAGES'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'ONE_VARIABLE_DATA',
  'One-Variable Data: Distributions and Measures of Center and Spread',
  1,
  30
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='ONE_VARIABLE_DATA'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'TWO_VARIABLE_DATA',
  'Two-Variable Data: Models and Scatterplots',
  1,
  40
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='TWO_VARIABLE_DATA'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'PROBABILITY',
  'Probability and Conditional Probability',
  1,
  50
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='PROBABILITY'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'INFERENCE_MARGIN_ERROR',
  'Inference from Sample Statistics and Margin of Error',
  1,
  60
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='INFERENCE_MARGIN_ERROR'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'STATISTICAL_CLAIMS',
  'Evaluating Statistical Claims: Observational Studies and Experiments',
  1,
  70
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBLEM_SOLVING_DATA'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='STATISTICAL_CLAIMS'
  );

INSERT INTO education_topics
(subject_id,topic_code,topic_name,enabled,sort_order)
SELECT
  s.id,
  'GEOMETRY_TRIG',
  'Geometry and Trigonometry',
  1,
  40
FROM education_subjects s
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND NOT EXISTS (
    SELECT 1
    FROM education_topics t
    WHERE t.subject_id=s.id
      AND t.topic_code='GEOMETRY_TRIG'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'AREA_VOLUME',
  'Area and Volume',
  1,
  10
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='AREA_VOLUME'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'LINES_ANGLES_TRIANGLES',
  'Lines, Angles, and Triangles',
  1,
  20
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='LINES_ANGLES_TRIANGLES'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'RIGHT_TRIANGLES_TRIG',
  'Right Triangles and Trigonometry',
  1,
  30
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='RIGHT_TRIANGLES_TRIG'
  );

INSERT INTO education_subtopics
(topic_id,subtopic_code,subtopic_name,enabled,sort_order)
SELECT
  t.id,
  'CIRCLES',
  'Circles',
  1,
  40
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='GEOMETRY_TRIG'
  AND NOT EXISTS (
    SELECT 1
    FROM education_subtopics st
    WHERE st.topic_id=t.id
      AND st.subtopic_code='CIRCLES'
  );
