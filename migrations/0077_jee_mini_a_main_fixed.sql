-- GYAN IIT-JEE fixed assessment pilot
-- 0077_jee_mini_a_main_fixed.sql
-- Assigns a deterministic 15-question Mini A Main v1.
-- IMPORTANT: question order and membership are fixed; there is no random selection.
-- The test remains unpublished until the API/UI route is wired and validated.

PRAGMA foreign_keys = ON;

-- Ensure the intended shell exists and remains open but unpublished.
UPDATE education_mock_tests
SET access_mode='OPEN', published=0, updated_at=CURRENT_TIMESTAMP
WHERE program_code='JEE'
  AND test_kind='MINI'
  AND test_code='MINI_A'
  AND exam_level='MAIN'
  AND version=1;

-- Make this migration re-runnable in a scratch/local database.
DELETE FROM education_mock_test_questions
WHERE mock_test_id = (
  SELECT id FROM education_mock_tests
  WHERE program_code='JEE'
    AND test_kind='MINI'
    AND test_code='MINI_A'
    AND exam_level='MAIN'
    AND version=1
  LIMIT 1
);

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT
  mt.id,
  q.id,
  1,
  'MATH',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_003'
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND q.source_type='jee-rebuild-v1';

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT
  mt.id,
  q.id,
  2,
  'MATH',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_003'
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND q.source_type='jee-rebuild-v1';

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT
  mt.id,
  q.id,
  3,
  'MATH',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_004'
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND q.source_type='jee-rebuild-v1';

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT
  mt.id,
  q.id,
  4,
  'MATH',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_005'
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND q.source_type='jee-rebuild-v1';

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT
  mt.id,
  q.id,
  5,
  'MATH',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_005'
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND q.source_type='jee-rebuild-v1';

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT
  mt.id,
  q.id,
  6,
  'PHYSICS',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_005'
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND q.source_type='jee-rebuild-v1';

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT
  mt.id,
  q.id,
  7,
  'PHYSICS',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_005'
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND q.source_type='jee-rebuild-v1';

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT
  mt.id,
  q.id,
  8,
  'PHYSICS',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_005'
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND q.source_type='jee-rebuild-v1';

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT
  mt.id,
  q.id,
  9,
  'PHYSICS',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_005'
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND q.source_type='jee-rebuild-v1';

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT
  mt.id,
  q.id,
  10,
  'PHYSICS',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_005'
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND q.source_type='jee-rebuild-v1';

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT
  mt.id,
  q.id,
  11,
  'CHEMISTRY',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_005'
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND q.source_type='jee-rebuild-v1';

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT
  mt.id,
  q.id,
  12,
  'CHEMISTRY',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_005'
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND q.source_type='jee-rebuild-v1';

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT
  mt.id,
  q.id,
  13,
  'CHEMISTRY',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_005'
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND q.source_type='jee-rebuild-v1';

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT
  mt.id,
  q.id,
  14,
  'CHEMISTRY',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_005'
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND q.source_type='jee-rebuild-v1';

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT
  mt.id,
  q.id,
  15,
  'CHEMISTRY',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_005'
WHERE mt.program_code='JEE'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND q.source_type='jee-rebuild-v1';
