-- 0129_neet_mini_a_quality_rebuild.sql
-- Rebuilds NEET Mini A as a deterministic 15-question assessment:
--   Physics 5 | Chemistry 5 | Biology 5
-- Only reviewed NEET_2026 questions from named curriculum topics are accepted.
-- Safe to rerun locally.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO education_mock_tests
(program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published)
VALUES ('NEET','MINI','MINI_A','Mini A','NEET',1,'OPEN',0);

UPDATE education_mock_tests
SET test_name='Mini A',
    access_mode='OPEN',
    published=0,
    updated_at=CURRENT_TIMESTAMP
WHERE program_code='NEET'
  AND test_kind='MINI'
  AND test_code='MINI_A'
  AND exam_level='NEET'
  AND version=1;

DELETE FROM education_mock_test_questions
WHERE mock_test_id=(
  SELECT id
  FROM education_mock_tests
  WHERE program_code='NEET'
    AND test_kind='MINI'
    AND test_code='MINI_A'
    AND exam_level='NEET'
    AND version=1
  LIMIT 1
);

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  1,
  'PHYSICS',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
  AND qm.syllabus_version='NEET_2026'
  AND qm.quality_status IN ('REVIEWED','PUBLISHED');

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  2,
  'PHYSICS',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
  AND qm.syllabus_version='NEET_2026'
  AND qm.quality_status IN ('REVIEWED','PUBLISHED');

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  3,
  'PHYSICS',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
  AND qm.syllabus_version='NEET_2026'
  AND qm.quality_status IN ('REVIEWED','PUBLISHED');

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  4,
  'PHYSICS',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
  AND qm.syllabus_version='NEET_2026'
  AND qm.quality_status IN ('REVIEWED','PUBLISHED');

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  5,
  'PHYSICS',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
  AND qm.syllabus_version='NEET_2026'
  AND qm.quality_status IN ('REVIEWED','PUBLISHED');

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  6,
  'CHEMISTRY',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_SOME_BASIC_CONCEPTS_CHEMISTRY_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
  AND qm.syllabus_version='NEET_2026'
  AND qm.quality_status IN ('REVIEWED','PUBLISHED');

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  7,
  'CHEMISTRY',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_ATOMIC_STRUCTURE_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
  AND qm.syllabus_version='NEET_2026'
  AND qm.quality_status IN ('REVIEWED','PUBLISHED');

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  8,
  'CHEMISTRY',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_CHEMICAL_BONDING_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
  AND qm.syllabus_version='NEET_2026'
  AND qm.quality_status IN ('REVIEWED','PUBLISHED');

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  9,
  'CHEMISTRY',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_CHEMICAL_THERMODYNAMICS_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
  AND qm.syllabus_version='NEET_2026'
  AND qm.quality_status IN ('REVIEWED','PUBLISHED');

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  10,
  'CHEMISTRY',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_CHEMISTRY_EQUILIBRIUM_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
  AND qm.syllabus_version='NEET_2026'
  AND qm.quality_status IN ('REVIEWED','PUBLISHED');

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  11,
  'BIOLOGY',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_CELL_STRUCTURE_FUNCTION_004'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
  AND qm.syllabus_version='NEET_2026'
  AND qm.quality_status IN ('REVIEWED','PUBLISHED');

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  12,
  'BIOLOGY',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_HUMAN_PHYSIOLOGY_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
  AND qm.syllabus_version='NEET_2026'
  AND qm.quality_status IN ('REVIEWED','PUBLISHED');

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  13,
  'BIOLOGY',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_REPRODUCTION_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
  AND qm.syllabus_version='NEET_2026'
  AND qm.quality_status IN ('REVIEWED','PUBLISHED');

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  14,
  'BIOLOGY',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_BIOTECHNOLOGY_004'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
  AND qm.syllabus_version='NEET_2026'
  AND qm.quality_status IN ('REVIEWED','PUBLISHED');

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  15,
  'BIOLOGY',
  4,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_NEET_BIOLOGY_ECOLOGY_ENVIRONMENT_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1
  AND q.active=1
  AND qm.syllabus_version='NEET_2026'
  AND qm.quality_status IN ('REVIEWED','PUBLISHED');

UPDATE education_mock_tests
SET published = CASE
      WHEN (
        SELECT COUNT(*)
        FROM education_mock_test_questions mtq
        WHERE mtq.mock_test_id=education_mock_tests.id
      ) = 15
      THEN 1 ELSE 0 END,
    updated_at=CURRENT_TIMESTAMP
WHERE program_code='NEET'
  AND test_kind='MINI'
  AND test_code='MINI_A'
  AND exam_level='NEET'
  AND version=1;

SELECT
  mt.test_code,
  mt.published,
  COUNT(mtq.question_id) AS question_count,
  SUM(CASE WHEN mtq.section_code='PHYSICS' THEN 1 ELSE 0 END) AS physics,
  SUM(CASE WHEN mtq.section_code='CHEMISTRY' THEN 1 ELSE 0 END) AS chemistry,
  SUM(CASE WHEN mtq.section_code='BIOLOGY' THEN 1 ELSE 0 END) AS biology
FROM education_mock_tests mt
LEFT JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id=mt.id
WHERE mt.program_code='NEET'
  AND mt.test_kind='MINI'
  AND mt.test_code='MINI_A'
  AND mt.exam_level='NEET'
  AND mt.version=1
GROUP BY mt.id,mt.test_code,mt.published;
