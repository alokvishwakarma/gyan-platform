-- GYAN IIT-JEE Test 1 Main v1
-- 0082_jee_test1_main_fixed.sql
-- 2026 Paper 1 structure: 75 questions, 25 each Math/Physics/Chemistry.
-- Per subject: 20 MCQ + 5 numerical; +4 correct, -1 incorrect, 0 unanswered.
-- Fixed membership/order: never randomize a named mock test.

PRAGMA foreign_keys = ON;

UPDATE education_mock_tests
SET access_mode='OPEN', published=0, updated_at=CURRENT_TIMESTAMP
WHERE program_code='JEE' AND test_kind='FULL' AND test_code='TEST_1'
  AND exam_level='MAIN' AND version=1;

DELETE FROM education_mock_test_questions
WHERE mock_test_id=(
  SELECT id FROM education_mock_tests
  WHERE program_code='JEE' AND test_kind='FULL' AND test_code='TEST_1'
    AND exam_level='MAIN' AND version=1 LIMIT 1
);

-- Numerical IN_PROGRAM_JEE_MATH_TEST1_NUM_M1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_NUM_M1', 'medium', 'For x² - 7x + 10 = 0, enter the sum of the two roots.',
'7', '', '', '', 'A', 'For ax²+bx+c=0, sum of roots=-b/a=7.', 1, 'jee-mock-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED','TEST1_MAIN_M1','GYAN JEE Test 1 Main numerical'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_NUM_M1';

-- Numerical IN_PROGRAM_JEE_MATH_TEST1_NUM_M2
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_NUM_M2', 'medium', 'Enter det([[3,2],[1,4]]).',
'10', '', '', '', 'A', 'det=3×4-2×1=10.', 1, 'jee-mock-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED','TEST1_MAIN_M2','GYAN JEE Test 1 Main numerical'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_NUM_M2';

-- Numerical IN_PROGRAM_JEE_MATH_TEST1_NUM_M3
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_NUM_M3', 'medium', 'An AP has first term 2 and common difference 3. Enter its 10th term.',
'29', '', '', '', 'A', 'a10=2+9×3=29.', 1, 'jee-mock-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED','TEST1_MAIN_M3','GYAN JEE Test 1 Main numerical'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_NUM_M3';

-- Numerical IN_PROGRAM_JEE_MATH_TEST1_NUM_M4
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_NUM_M4', 'medium', 'For f(x)=x²+3x, enter f''(2).',
'7', '', '', '', 'A', 'f''(x)=2x+3, so f''(2)=7.', 1, 'jee-mock-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED','TEST1_MAIN_M4','GYAN JEE Test 1 Main numerical'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_NUM_M4';

-- Numerical IN_PROGRAM_JEE_MATH_TEST1_NUM_M5
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_NUM_M5', 'medium', 'Enter the number of ways to choose 2 objects from 6 distinct objects.',
'15', '', '', '', 'A', 'C(6,2)=15.', 1, 'jee-mock-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED','TEST1_MAIN_M5','GYAN JEE Test 1 Main numerical'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_NUM_M5';

-- Numerical IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P1', 'medium', 'A particle has u=5 m/s, a=2 m/s² for 4 s. Enter its final speed in m/s.',
'13', '', '', '', 'A', 'v=u+at=5+2×4=13.', 1, 'jee-mock-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED','TEST1_MAIN_P1','GYAN JEE Test 1 Main numerical'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P1';

-- Numerical IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P2
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P2', 'medium', 'A 6 kg body accelerates at 3 m/s². Enter the net force in newtons.',
'18', '', '', '', 'A', 'F=ma=6×3=18 N.', 1, 'jee-mock-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED','TEST1_MAIN_P2','GYAN JEE Test 1 Main numerical'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P2';

-- Numerical IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P3
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P3', 'medium', 'A 2 kg body moves at 4 m/s. Enter its kinetic energy in joules.',
'16', '', '', '', 'A', 'K=½mv²=½×2×16=16 J.', 1, 'jee-mock-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED','TEST1_MAIN_P3','GYAN JEE Test 1 Main numerical'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P3';

-- Numerical IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P4
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P4', 'medium', 'A 4 Ω resistor has 12 V across it. Enter the current in amperes.',
'3', '', '', '', 'A', 'I=V/R=12/4=3 A.', 1, 'jee-mock-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED','TEST1_MAIN_P4','GYAN JEE Test 1 Main numerical'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P4';

-- Numerical IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P5
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P5', 'medium', 'A convex lens has focal length 15 cm. An object is placed at 2f. Enter the image distance in cm.',
'30', '', '', '', 'A', 'An object at 2f forms its image at 2f=30 cm.', 1, 'jee-mock-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED','TEST1_MAIN_P5','GYAN JEE Test 1 Main numerical'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P5';

-- Numerical IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C1', 'medium', 'Enter the number of moles in 36 g of H2O. Take molar mass H2O=18 g/mol.',
'2', '', '', '', 'A', 'n=m/M=36/18=2 mol.', 1, 'jee-mock-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED','TEST1_MAIN_C1','GYAN JEE Test 1 Main numerical'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C1';

-- Numerical IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C2
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C2', 'medium', 'A solution has [H+]=1×10^-4 M. Enter its pH.',
'4', '', '', '', 'A', 'pH=-log10[H+]=4.', 1, 'jee-mock-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED','TEST1_MAIN_C2','GYAN JEE Test 1 Main numerical'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C2';

-- Numerical IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C3
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C3', 'medium', 'Enter the oxidation state of Mn in KMnO4.',
'7', '', '', '', 'A', 'K is +1 and four O total -8, hence Mn=+7.', 1, 'jee-mock-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED','TEST1_MAIN_C3','GYAN JEE Test 1 Main numerical'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C3';

-- Numerical IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C4
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C4', 'medium', 'Enter the number of atoms per body-centered cubic unit cell.',
'2', '', '', '', 'A', 'Corners contribute 1 atom total and body center contributes 1, giving 2.', 1, 'jee-mock-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED','TEST1_MAIN_C4','GYAN JEE Test 1 Main numerical'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C4';

-- Numerical IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C5
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C5', 'medium', 'Enter the coordination number of Co in [Co(NH3)6]3+.',
'6', '', '', '', 'A', 'Six monodentate NH3 ligands are directly attached to Co.', 1, 'jee-mock-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED','TEST1_MAIN_C5','GYAN JEE Test 1 Main numerical'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C5';

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  1, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_006'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  2, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_007'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  3, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_008'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  4, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_009'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  5, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  6, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_011'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  7, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_012'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  8, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_013'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  9, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_014'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  10, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_015'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  11, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_006'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  12, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_007'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  13, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_008'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  14, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_009'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  15, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_020'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  16, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_021'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  17, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_022'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  18, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_023'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  19, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_024'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  20, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_025'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  21, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_NUM_M1'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  22, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_NUM_M2'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  23, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_NUM_M3'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  24, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_NUM_M4'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  25, 'MATH', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_NUM_M5'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  26, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  27, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  28, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  29, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  30, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  31, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  32, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  33, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  34, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  35, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  36, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  37, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  38, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  39, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  40, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  41, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  42, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  43, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  44, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  45, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  46, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P1'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  47, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P2'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  48, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P3'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  49, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P4'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  50, 'PHYSICS', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_NUM_P5'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  51, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  52, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  53, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  54, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  55, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  56, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  57, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  58, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  59, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  60, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  61, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  62, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  63, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  64, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  65, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  66, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  67, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  68, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  69, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  70, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_010'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  71, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C1'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  72, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C2'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  73, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C3'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  74, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C4'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,
  75, 'CHEMISTRY', 4, -1, 0
FROM education_mock_tests mt
JOIN education_questions q ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_NUM_C5'
WHERE mt.program_code='JEE' AND mt.test_kind='FULL' AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN' AND mt.version=1 AND q.active=1;
