-- GYAN IIT-JEE Mini A Advanced v1
-- 0086_jee_mini_a_advanced_fixed.sql
-- 15 fixed original questions: 5 each Math/Physics/Chemistry.
-- Per subject: 2 single-choice + 2 multi-select + 1 numerical.
-- Uses education_mock_question_answers created by Advanced Test 1 migration.

PRAGMA foreign_keys = ON;

UPDATE education_mock_tests
SET access_mode='OPEN', published=0, updated_at=CURRENT_TIMESTAMP
WHERE program_code='JEE' AND test_kind='MINI' AND test_code='MINI_A'
  AND exam_level='ADVANCED' AND version=1;

DELETE FROM education_mock_test_questions
WHERE mock_test_id=(
 SELECT id FROM education_mock_tests
 WHERE program_code='JEE' AND test_kind='MINI' AND test_code='MINI_A'
   AND exam_level='ADVANCED' AND version=1 LIMIT 1
);

-- 01 SINGLE_CHOICE IN_PROGRAM_JEE_MATH_MINIA_ADV_M_SC1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MINIA_ADV_M_SC1', 'challenge', 'If the roots of x²-6x+k=0 differ by 2, then k is:',
'5', '8', '9', '10',
'B', 'If roots are 3±1, their product is 2×4=8.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','MINIA_ADV_01','GYAN JEE Mini A Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MINIA_ADV_M_SC1';

-- 02 SINGLE_CHOICE IN_PROGRAM_JEE_MATH_MINIA_ADV_M_SC2
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MINIA_ADV_M_SC2', 'challenge', 'For A=[[1,2],[2,4]], the rank of A is:',
'0', '1', '2', '4',
'B', 'The second row is twice the first and the matrix is nonzero, so rank(A)=1.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','MINIA_ADV_02','GYAN JEE Mini A Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MINIA_ADV_M_SC2';

-- 03 MULTI_SELECT IN_PROGRAM_JEE_MATH_MINIA_ADV_M_MS1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MINIA_ADV_M_MS1', 'challenge', 'For f(x)=|x|, which statements are correct?',
'f is continuous at x=0', 'f is differentiable at x=0', 'Left derivative at 0 is -1', 'Right derivative at 0 is 1',
'A', 'The function is continuous at 0, but the one-sided derivatives are -1 and +1, so it is not differentiable there.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','MINIA_ADV_03','GYAN JEE Mini A Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MINIA_ADV_M_MS1';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id,'ACD' FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_MINIA_ADV_M_MS1';

-- 04 MULTI_SELECT IN_PROGRAM_JEE_MATH_MINIA_ADV_M_MS2
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MINIA_ADV_M_MS2', 'challenge', 'Which expressions equal 10?',
'C(5,2)', 'C(5,3)', 'P(5,2)/2', 'C(10,1)',
'A', 'C(5,2)=C(5,3)=10, P(5,2)/2=20/2=10, and C(10,1)=10.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','MINIA_ADV_04','GYAN JEE Mini A Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MINIA_ADV_M_MS2';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id,'ABCD' FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_MINIA_ADV_M_MS2';

-- 05 NUMERICAL IN_PROGRAM_JEE_MATH_MINIA_ADV_M_N1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MINIA_ADV_M_N1', 'challenge', 'The first three terms of a GP are 2, 6, 18. Enter the sum of its first five terms.',
'242', '', '', '',
'A', 'The common ratio is 3, so S5=2(3^5-1)/(3-1)=242.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','MINIA_ADV_05','GYAN JEE Mini A Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MINIA_ADV_M_N1';

-- 06 SINGLE_CHOICE IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_SC1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_SC1', 'challenge', 'A particle has velocity v=4t-2 (SI units). Its displacement from t=1 s to t=3 s is:',
'8 m', '12 m', '16 m', '20 m',
'B', 'Integrating v from 1 to 3 gives [2t²-2t] from 1 to 3 = 12 m.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','MINIA_ADV_06','GYAN JEE Mini A Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_SC1';

-- 07 SINGLE_CHOICE IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_SC2
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_SC2', 'challenge', 'A 4 Ω and a 12 Ω resistor are connected in parallel. Their equivalent resistance is:',
'2 Ω', '3 Ω', '4 Ω', '8 Ω',
'B', '1/R=1/4+1/12=1/3, hence R=3 Ω.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','MINIA_ADV_07','GYAN JEE Mini A Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_SC2';

-- 08 MULTI_SELECT IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_MS1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_MS1', 'challenge', 'A body moves with constant velocity in an inertial frame. Which statements must be true?',
'Its acceleration is zero', 'The net external force is zero', 'Its momentum is constant', 'No forces at all act on it',
'A', 'Constant velocity means zero acceleration, hence zero net force and constant momentum; individual forces may still cancel.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','MINIA_ADV_08','GYAN JEE Mini A Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_MS1';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id,'ABC' FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_MS1';

-- 09 MULTI_SELECT IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_MS2
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_MS2', 'challenge', 'For a conservative force, which statements are correct?',
'Work over a closed path is zero', 'Potential energy can be defined', 'Work depends only on endpoints', 'Work must always be positive',
'A', 'Conservative-force work is path independent, permits a potential energy, and vanishes over a closed path.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','MINIA_ADV_09','GYAN JEE Mini A Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_MS2';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id,'ABC' FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_MS2';

-- 10 NUMERICAL IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_N1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_N1', 'challenge', 'A convex lens of focal length 15 cm forms a real image of an object placed 30 cm from it. Enter the image distance in cm.',
'30', '', '', '',
'A', 'The object is at 2f, so the real image forms at 2f=30 cm.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','MINIA_ADV_10','GYAN JEE Mini A Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_N1';

-- 11 SINGLE_CHOICE IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_SC1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_SC1', 'challenge', 'For N2(g)+3H2(g) ⇌ 2NH3(g), increasing pressure at constant temperature shifts equilibrium:',
'toward reactants', 'toward products', 'nowhere because K changes', 'randomly',
'B', 'The product side has fewer gaseous moles, so higher pressure favors products.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','MINIA_ADV_11','GYAN JEE Mini A Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_SC1';

-- 12 SINGLE_CHOICE IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_SC2
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_SC2', 'challenge', 'The oxidation state of Fe in [Fe(CN)6]3- is:',
'+2', '+3', '+4', '+6',
'B', 'Let Fe=x. Then x+6(-1)=-3, so x=+3.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','MINIA_ADV_12','GYAN JEE Mini A Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_SC2';

-- 13 MULTI_SELECT IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_MS1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_MS1', 'challenge', 'Which samples contain exactly 1 mol of the stated particles?',
'18 g H2O molecules', '44 g CO2 molecules', '23 g Na atoms (molar mass 23 g/mol)', '16 g O2 molecules (molar mass 32 g/mol)',
'A', 'The first three masses equal one molar mass; 16 g O2 is only 0.5 mol.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','MINIA_ADV_13','GYAN JEE Mini A Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_MS1';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id,'ABC' FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_MS1';

-- 14 MULTI_SELECT IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_MS2
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_MS2', 'challenge', 'Which statements are commonly true for transition elements or their ions?',
'They may show variable oxidation states', 'They often form complexes', 'Many compounds are colored', 'All their ions are diamagnetic',
'A', 'Variable oxidation states, complex formation, and color are common; many ions are paramagnetic.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','MINIA_ADV_14','GYAN JEE Mini A Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_MS2';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id,'ABC' FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_MS2';

-- 15 NUMERICAL IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_N1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_N1', 'challenge', 'Enter the number of atoms effectively present in a body-centered cubic unit cell.',
'2', '', '', '',
'A', 'Eight corner atoms contribute 1 atom in total and the body-center contributes 1, giving 2.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','MINIA_ADV_15','GYAN JEE Mini A Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_N1';

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,1,'MATH',3,-1,0
FROM education_mock_tests mt
JOIN education_questions q
 ON q.question_key='IN_PROGRAM_JEE_MATH_MINIA_ADV_M_SC1'
WHERE mt.program_code='JEE' AND mt.test_kind='MINI' AND mt.test_code='MINI_A'
  AND mt.exam_level='ADVANCED' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,2,'MATH',3,-1,0
FROM education_mock_tests mt
JOIN education_questions q
 ON q.question_key='IN_PROGRAM_JEE_MATH_MINIA_ADV_M_SC2'
WHERE mt.program_code='JEE' AND mt.test_kind='MINI' AND mt.test_code='MINI_A'
  AND mt.exam_level='ADVANCED' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,3,'MATH',4,-2,0
FROM education_mock_tests mt
JOIN education_questions q
 ON q.question_key='IN_PROGRAM_JEE_MATH_MINIA_ADV_M_MS1'
WHERE mt.program_code='JEE' AND mt.test_kind='MINI' AND mt.test_code='MINI_A'
  AND mt.exam_level='ADVANCED' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,4,'MATH',4,-2,0
FROM education_mock_tests mt
JOIN education_questions q
 ON q.question_key='IN_PROGRAM_JEE_MATH_MINIA_ADV_M_MS2'
WHERE mt.program_code='JEE' AND mt.test_kind='MINI' AND mt.test_code='MINI_A'
  AND mt.exam_level='ADVANCED' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,5,'MATH',4,0,0
FROM education_mock_tests mt
JOIN education_questions q
 ON q.question_key='IN_PROGRAM_JEE_MATH_MINIA_ADV_M_N1'
WHERE mt.program_code='JEE' AND mt.test_kind='MINI' AND mt.test_code='MINI_A'
  AND mt.exam_level='ADVANCED' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,6,'PHYSICS',3,-1,0
FROM education_mock_tests mt
JOIN education_questions q
 ON q.question_key='IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_SC1'
WHERE mt.program_code='JEE' AND mt.test_kind='MINI' AND mt.test_code='MINI_A'
  AND mt.exam_level='ADVANCED' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,7,'PHYSICS',3,-1,0
FROM education_mock_tests mt
JOIN education_questions q
 ON q.question_key='IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_SC2'
WHERE mt.program_code='JEE' AND mt.test_kind='MINI' AND mt.test_code='MINI_A'
  AND mt.exam_level='ADVANCED' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,8,'PHYSICS',4,-2,0
FROM education_mock_tests mt
JOIN education_questions q
 ON q.question_key='IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_MS1'
WHERE mt.program_code='JEE' AND mt.test_kind='MINI' AND mt.test_code='MINI_A'
  AND mt.exam_level='ADVANCED' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,9,'PHYSICS',4,-2,0
FROM education_mock_tests mt
JOIN education_questions q
 ON q.question_key='IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_MS2'
WHERE mt.program_code='JEE' AND mt.test_kind='MINI' AND mt.test_code='MINI_A'
  AND mt.exam_level='ADVANCED' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,10,'PHYSICS',4,0,0
FROM education_mock_tests mt
JOIN education_questions q
 ON q.question_key='IN_PROGRAM_JEE_PHYSICS_MINIA_ADV_P_N1'
WHERE mt.program_code='JEE' AND mt.test_kind='MINI' AND mt.test_code='MINI_A'
  AND mt.exam_level='ADVANCED' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,11,'CHEMISTRY',3,-1,0
FROM education_mock_tests mt
JOIN education_questions q
 ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_SC1'
WHERE mt.program_code='JEE' AND mt.test_kind='MINI' AND mt.test_code='MINI_A'
  AND mt.exam_level='ADVANCED' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,12,'CHEMISTRY',3,-1,0
FROM education_mock_tests mt
JOIN education_questions q
 ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_SC2'
WHERE mt.program_code='JEE' AND mt.test_kind='MINI' AND mt.test_code='MINI_A'
  AND mt.exam_level='ADVANCED' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,13,'CHEMISTRY',4,-2,0
FROM education_mock_tests mt
JOIN education_questions q
 ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_MS1'
WHERE mt.program_code='JEE' AND mt.test_kind='MINI' AND mt.test_code='MINI_A'
  AND mt.exam_level='ADVANCED' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,14,'CHEMISTRY',4,-2,0
FROM education_mock_tests mt
JOIN education_questions q
 ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_MS2'
WHERE mt.program_code='JEE' AND mt.test_kind='MINI' AND mt.test_code='MINI_A'
  AND mt.exam_level='ADVANCED' AND mt.version=1 AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id,q.id,15,'CHEMISTRY',4,0,0
FROM education_mock_tests mt
JOIN education_questions q
 ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_MINIA_ADV_C_N1'
WHERE mt.program_code='JEE' AND mt.test_kind='MINI' AND mt.test_code='MINI_A'
  AND mt.exam_level='ADVANCED' AND mt.version=1 AND q.active=1;

-- Keep unpublished until 0087 validates the complete fixed set.
UPDATE education_mock_tests
SET access_mode='OPEN', published=0, updated_at=CURRENT_TIMESTAMP
WHERE program_code='JEE' AND test_kind='MINI' AND test_code='MINI_A'
  AND exam_level='ADVANCED' AND version=1;
