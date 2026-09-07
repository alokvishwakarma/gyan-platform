-- 0117_jee_main_quality_test_1.sql
-- GYAN JEE Main Quality Test 1
--
-- Paper 1 structure used by GYAN:
--   Mathematics : 20 MCQ + 5 Numerical = 25
--   Physics     : 20 MCQ + 5 Numerical = 25
--   Chemistry   : 20 MCQ + 5 Numerical = 25
--   Total       : 75 questions / 300 marks
--
-- Marking used by current GYAN JEE Main runner:
--   +4 correct, -1 incorrect, 0 unanswered
--
-- Quality strategy:
--   * MCQs reuse selected REVIEWED questions from the broad JEE_2026 bank.
--   * All 15 numerical questions are dedicated to Quality Test 1.
--   * Difficulty balance: 18 easy / 39 medium / 18 challenge.
--   * Existing practice-bank questions remain untouched.
--
-- Test order preserves the existing GYAN JEE layout:
--   1-25 Mathematics, 26-50 Physics, 51-75 Chemistry.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO education_mock_tests
(program_code,test_kind,test_code,test_name,exam_level,version,access_mode,published)
VALUES ('JEE','FULL','TEST_1','Test 1','MAIN',1,'OPEN',1);

UPDATE education_mock_tests
SET test_name='Test 1',
    access_mode='OPEN',
    published=0,
    updated_at=CURRENT_TIMESTAMP
WHERE program_code='JEE'
  AND test_kind='FULL'
  AND test_code='TEST_1'
  AND exam_level='MAIN'
  AND version=1;

DELETE FROM education_mock_test_questions
WHERE mock_test_id IN (
  SELECT id
  FROM education_mock_tests
  WHERE program_code='JEE'
    AND test_kind='FULL'
    AND test_code='TEST_1'
    AND exam_level='MAIN'
    AND version=1
);


-- 01. MATHEMATICS MCQ | challenge | SETS_RELATIONS_FUNCTIONS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  1,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_005'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 02. MATHEMATICS MCQ | challenge | COMPLEX_QUADRATIC
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  2,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_005'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 03. MATHEMATICS MCQ | challenge | MATRICES_DETERMINANTS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  3,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_005'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 04. MATHEMATICS MCQ | challenge | PERMUTATIONS_COMBINATIONS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  4,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_005'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 05. MATHEMATICS MCQ | challenge | BINOMIAL_THEOREM
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  5,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_005'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 06. MATHEMATICS MCQ | easy | SEQUENCES_SERIES
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  6,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 07. MATHEMATICS MCQ | easy | LIMITS_CONTINUITY_DIFFERENTIABILITY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  7,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 08. MATHEMATICS MCQ | easy | INTEGRAL_CALCULUS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  8,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 09. MATHEMATICS MCQ | easy | DIFFERENTIAL_EQUATIONS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  9,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 10. MATHEMATICS MCQ | easy | COORDINATE_GEOMETRY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  10,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 11. MATHEMATICS MCQ | medium | THREE_D_GEOMETRY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  11,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 12. MATHEMATICS MCQ | medium | VECTOR_ALGEBRA
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  12,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 13. MATHEMATICS MCQ | medium | STATISTICS_PROBABILITY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  13,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 14. MATHEMATICS MCQ | medium | TRIGONOMETRY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  14,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 15. MATHEMATICS MCQ | medium | SETS_RELATIONS_FUNCTIONS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  15,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 16. MATHEMATICS MCQ | medium | SETS_RELATIONS_FUNCTIONS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  16,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_003'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 17. MATHEMATICS MCQ | medium | SETS_RELATIONS_FUNCTIONS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  17,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_004'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 18. MATHEMATICS MCQ | medium | COMPLEX_QUADRATIC
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  18,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 19. MATHEMATICS MCQ | medium | COMPLEX_QUADRATIC
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  19,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_003'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 20. MATHEMATICS MCQ | medium | COMPLEX_QUADRATIC
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  20,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_004'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 21. MATHEMATICS NUMERICAL | easy | SETS_RELATIONS_FUNCTIONS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_NUM_01',
  'easy',
  'If f(x)=3x+2 and f(a)=17, enter a.',
  '5',
  '',
  '',
  '',
  'A',
  '3a+2=17 gives a=5.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='SETS_RELATIONS_FUNCTIONS'
  AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_TEST1_NUM_MATHEMATICS_1',
  'GYAN JEE Main Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  'Enter the numerical value.',
  NULL,
  '["5"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  21,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_01'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 22. MATHEMATICS NUMERICAL | medium | COMPLEX_NUMBERS_QUADRATIC
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_NUM_02',
  'medium',
  'The roots of x²-7x+10=0 are α and β. Enter αβ.',
  '10',
  '',
  '',
  '',
  'A',
  'For ax²+bx+c=0, product of roots is c/a=10.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='COMPLEX_NUMBERS_QUADRATIC'
  AND st.subtopic_code='COMPLEX_NUMBERS_QUADRATIC_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_TEST1_NUM_MATHEMATICS_2',
  'GYAN JEE Main Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  'Enter the numerical value.',
  NULL,
  '["10"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  22,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_02'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 23. MATHEMATICS NUMERICAL | medium | SEQUENCES_SERIES
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_NUM_03',
  'medium',
  'An arithmetic progression has first term 3 and common difference 4. Enter its 10th term.',
  '39',
  '',
  '',
  '',
  'A',
  'a₁₀=a+(10-1)d=3+36=39.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='SEQUENCES_SERIES'
  AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_TEST1_NUM_MATHEMATICS_3',
  'GYAN JEE Main Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  'Enter the numerical value.',
  NULL,
  '["39"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  23,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_03'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 24. MATHEMATICS NUMERICAL | challenge | MATRICES_DETERMINANTS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_NUM_04',
  'challenge',
  'For matrix [[2,3],[1,4]], enter the value of its determinant.',
  '5',
  '',
  '',
  '',
  'A',
  'Determinant=2×4-3×1=5.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATRICES_DETERMINANTS'
  AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_TEST1_NUM_MATHEMATICS_4',
  'GYAN JEE Main Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  'Enter the numerical value.',
  NULL,
  '["5"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  24,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_04'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 25. MATHEMATICS NUMERICAL | medium | PROBABILITY_STATISTICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_NUM_05',
  'medium',
  'A fair die is rolled 60 times. If exactly 12 outcomes are sixes, enter the experimental probability of getting a six as a percentage.',
  '20',
  '',
  '',
  '',
  'A',
  '12/60=0.2=20%.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='PROBABILITY_STATISTICS'
  AND st.subtopic_code='PROBABILITY_STATISTICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_TEST1_NUM_MATHEMATICS_5',
  'GYAN JEE Main Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  'Enter the numerical value.',
  NULL,
  '["20"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_05';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  25,
  'MATHEMATICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_05'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 26. PHYSICS MCQ | challenge | UNITS_MEASUREMENTS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  26,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_005'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 27. PHYSICS MCQ | challenge | KINEMATICS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  27,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_005'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 28. PHYSICS MCQ | challenge | LAWS_OF_MOTION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  28,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_005'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 29. PHYSICS MCQ | challenge | WORK_ENERGY_POWER
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  29,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_005'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 30. PHYSICS MCQ | challenge | ROTATIONAL_MOTION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  30,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_005'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 31. PHYSICS MCQ | easy | GRAVITATION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  31,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 32. PHYSICS MCQ | easy | PROPERTIES_SOLIDS_LIQUIDS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  32,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 33. PHYSICS MCQ | easy | THERMODYNAMICS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  33,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 34. PHYSICS MCQ | easy | KINETIC_THEORY_GASES
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  34,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 35. PHYSICS MCQ | easy | OSCILLATIONS_WAVES
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  35,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 36. PHYSICS MCQ | medium | ELECTROSTATICS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  36,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 37. PHYSICS MCQ | medium | CURRENT_ELECTRICITY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  37,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 38. PHYSICS MCQ | medium | MAGNETIC_EFFECTS_MAGNETISM
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  38,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 39. PHYSICS MCQ | medium | EMI_AC
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  39,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 40. PHYSICS MCQ | medium | ELECTROMAGNETIC_WAVES
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  40,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 41. PHYSICS MCQ | medium | OPTICS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  41,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 42. PHYSICS MCQ | medium | DUAL_NATURE
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  42,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 43. PHYSICS MCQ | medium | ATOMS_NUCLEI
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  43,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 44. PHYSICS MCQ | medium | ELECTRONIC_DEVICES
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  44,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 45. PHYSICS MCQ | medium | EXPERIMENTAL_SKILLS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  45,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 46. PHYSICS NUMERICAL | easy | KINEMATICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_NUM_01',
  'easy',
  'A body starts from rest and accelerates uniformly at 4 m/s² for 5 s. Enter its final speed in m/s.',
  '20',
  '',
  '',
  '',
  'A',
  'v=u+at=0+4×5=20 m/s.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_TEST1_NUM_PHYSICS_1',
  'GYAN JEE Main Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  'Enter the numerical value.',
  NULL,
  '["20"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  46,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_01'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 47. PHYSICS NUMERICAL | medium | LAWS_OF_MOTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_NUM_02',
  'medium',
  'A 5 kg block is acted on by a net horizontal force of 30 N. Enter its acceleration in m/s².',
  '6',
  '',
  '',
  '',
  'A',
  'a=F/m=30/5=6 m/s².',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_TEST1_NUM_PHYSICS_2',
  'GYAN JEE Main Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  'Enter the numerical value.',
  NULL,
  '["6"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  47,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_02'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 48. PHYSICS NUMERICAL | medium | WORK_ENERGY_POWER
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_NUM_03',
  'medium',
  'A 2 kg body moving at 10 m/s is brought to rest. Enter the magnitude of the work done by the retarding force in joules.',
  '100',
  '',
  '',
  '',
  'A',
  'Initial kinetic energy is ½mv²=100 J; the magnitude of work required to stop it is 100 J.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_TEST1_NUM_PHYSICS_3',
  'GYAN JEE Main Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  'Enter the numerical value.',
  NULL,
  '["100"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  48,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_03'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 49. PHYSICS NUMERICAL | challenge | CURRENT_ELECTRICITY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_NUM_04',
  'challenge',
  'Two resistors of 6 Ω and 3 Ω are connected in parallel across a 12 V source. Enter the total current drawn in amperes.',
  '6',
  '',
  '',
  '',
  'A',
  'Equivalent resistance is 2 Ω, so I=V/R=12/2=6 A.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY'
  AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_TEST1_NUM_PHYSICS_4',
  'GYAN JEE Main Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  'Enter the numerical value.',
  NULL,
  '["6"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  49,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_04'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 50. PHYSICS NUMERICAL | medium | GRAVITATION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_NUM_05',
  'medium',
  'At a point where gravitational acceleration is 9.8 m/s², a 2 kg mass has weight W newtons. Enter W.',
  '19.6',
  '',
  '',
  '',
  'A',
  'W=mg=2×9.8=19.6 N.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='GRAVITATION'
  AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_TEST1_NUM_PHYSICS_5',
  'GYAN JEE Main Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  'Enter the numerical value.',
  NULL,
  '["19.6"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_05';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  50,
  'PHYSICS',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_05'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 51. CHEMISTRY MCQ | challenge | BASIC_CONCEPTS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  51,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_005'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 52. CHEMISTRY MCQ | challenge | STATES_OF_MATTER
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  52,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_005'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 53. CHEMISTRY MCQ | challenge | ATOMIC_STRUCTURE
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  53,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_005'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 54. CHEMISTRY MCQ | challenge | CHEMICAL_BONDING
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  54,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_005'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 55. CHEMISTRY MCQ | challenge | CHEMICAL_THERMODYNAMICS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  55,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_005'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 56. CHEMISTRY MCQ | easy | EQUILIBRIUM
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  56,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 57. CHEMISTRY MCQ | easy | REDOX_ELECTROCHEMISTRY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  57,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 58. CHEMISTRY MCQ | easy | CHEMICAL_KINETICS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  58,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 59. CHEMISTRY MCQ | easy | SOLID_STATE
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  59,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 60. CHEMISTRY MCQ | easy | SOLUTIONS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  60,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_001'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 61. CHEMISTRY MCQ | medium | SURFACE_CHEMISTRY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  61,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 62. CHEMISTRY MCQ | medium | PERIODICITY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  62,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 63. CHEMISTRY MCQ | medium | HYDROGEN_S_BLOCK
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  63,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 64. CHEMISTRY MCQ | medium | P_BLOCK
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  64,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 65. CHEMISTRY MCQ | medium | D_F_BLOCK
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  65,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 66. CHEMISTRY MCQ | medium | COORDINATION
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  66,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 67. CHEMISTRY MCQ | medium | METALLURGY_QUALITATIVE
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  67,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 68. CHEMISTRY MCQ | medium | ENVIRONMENTAL_CHEMISTRY
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  68,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 69. CHEMISTRY MCQ | medium | ORGANIC_PRINCIPLES
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  69,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 70. CHEMISTRY MCQ | medium | HYDROCARBONS
INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  70,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_002'
JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1
  AND qm.quality_status='REVIEWED';


-- 71. CHEMISTRY NUMERICAL | easy | BASIC_CONCEPTS_CHEMISTRY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_01',
  'easy',
  'Enter the number of moles present in 18 g of water. Use molar mass of H₂O = 18 g/mol.',
  '1',
  '',
  '',
  '',
  'A',
  'n=m/M=18/18=1 mol.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BASIC_CONCEPTS_CHEMISTRY'
  AND st.subtopic_code='BASIC_CONCEPTS_CHEMISTRY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_TEST1_NUM_CHEMISTRY_1',
  'GYAN JEE Main Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  'Enter the numerical value.',
  NULL,
  '["1"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  71,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_01'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 72. CHEMISTRY NUMERICAL | medium | ATOMIC_STRUCTURE
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_02',
  'medium',
  'Enter the maximum number of electrons that can occupy the n=3 shell.',
  '18',
  '',
  '',
  '',
  'A',
  'Maximum electrons in shell n is 2n²=18.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ATOMIC_STRUCTURE'
  AND st.subtopic_code='ATOMIC_STRUCTURE_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_TEST1_NUM_CHEMISTRY_2',
  'GYAN JEE Main Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  'Enter the numerical value.',
  NULL,
  '["18"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  72,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_02'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 73. CHEMISTRY NUMERICAL | medium | EQUILIBRIUM
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_03',
  'medium',
  'At 25°C, enter the pOH of a solution with pH 8.5.',
  '5.5',
  '',
  '',
  '',
  'A',
  'At 25°C, pH+pOH=14, so pOH=5.5.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='EQUILIBRIUM'
  AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_TEST1_NUM_CHEMISTRY_3',
  'GYAN JEE Main Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  'Enter the numerical value.',
  NULL,
  '["5.5"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  73,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_03'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 74. CHEMISTRY NUMERICAL | challenge | COORDINATION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_04',
  'challenge',
  'Enter the oxidation state of Fe in [Fe(CN)₆]⁴⁻.',
  '2',
  '',
  '',
  '',
  'A',
  'Let oxidation state be x. x+6(-1)=-4, so x=+2.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='COORDINATION'
  AND st.subtopic_code='COORDINATION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_TEST1_NUM_CHEMISTRY_4',
  'GYAN JEE Main Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  'Enter the numerical value.',
  NULL,
  '["2"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  74,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_04'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 75. CHEMISTRY NUMERICAL | medium | CHEMICAL_KINETICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_05',
  'medium',
  'For a first-order reaction with half-life 10 minutes, enter the percentage of reactant remaining after 20 minutes.',
  '25',
  '',
  '',
  '',
  'A',
  '20 min is two half-lives, so remaining fraction=(1/2)²=1/4=25%.',
  1,
  'gyan-quality-test1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_KINETICS'
  AND st.subtopic_code='CHEMICAL_KINETICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'MAIN',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_TEST1_NUM_CHEMISTRY_5',
  'GYAN JEE Main Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  'Enter the numerical value.',
  NULL,
  '["25"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_05';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  75,
  'CHEMISTRY',
  4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_05'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- Publish only when the complete fixed structure exists.
UPDATE education_mock_tests
SET access_mode='OPEN',
    published=CASE
      WHEN (
        SELECT COUNT(*)
        FROM education_mock_test_questions mtq
        WHERE mtq.mock_test_id=education_mock_tests.id
      )=75
      AND (
        SELECT COUNT(*)
        FROM education_mock_test_questions mtq
        JOIN education_question_metadata qm
          ON qm.question_id=mtq.question_id
        WHERE mtq.mock_test_id=education_mock_tests.id
          AND qm.question_format='NUMERICAL'
      )=15
      THEN 1
      ELSE 0
    END,
    updated_at=CURRENT_TIMESTAMP
WHERE program_code='JEE'
  AND test_kind='FULL'
  AND test_code='TEST_1'
  AND exam_level='MAIN'
  AND version=1;

-- ------------------------------------------------------------
-- Audits
-- ------------------------------------------------------------

SELECT
  mt.id,
  mt.program_code,
  mt.test_code,
  mt.version,
  mt.published,
  COUNT(mtq.question_id) AS question_count,
  SUM(
    CASE WHEN qm.question_format='NUMERICAL'
      THEN 1 ELSE 0 END
  ) AS numerical_count
FROM education_mock_tests mt
LEFT JOIN education_mock_test_questions mtq
  ON mtq.mock_test_id=mt.id
LEFT JOIN education_question_metadata qm
  ON qm.question_id=mtq.question_id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY mt.id,mt.program_code,mt.test_code,mt.version,mt.published;

SELECT
  mtq.section_code,
  COUNT(*) AS questions,
  SUM(CASE WHEN qm.question_format='NUMERICAL' THEN 1 ELSE 0 END)
    AS numerical_questions
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt ON mt.id=mtq.mock_test_id
JOIN education_question_metadata qm ON qm.question_id=mtq.question_id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY mtq.section_code
ORDER BY MIN(mtq.question_order);

SELECT
  q.difficulty,
  COUNT(*) AS questions
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt ON mt.id=mtq.mock_test_id
JOIN education_questions q ON q.id=mtq.question_id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY q.difficulty
ORDER BY CASE q.difficulty
  WHEN 'easy' THEN 1
  WHEN 'medium' THEN 2
  WHEN 'challenge' THEN 3
  ELSE 4
END;

SELECT
  s.subject_code,
  COUNT(*) AS questions,
  COUNT(DISTINCT t.id) AS topics_covered
FROM education_mock_test_questions mtq
JOIN education_mock_tests mt ON mt.id=mtq.mock_test_id
JOIN education_questions q ON q.id=mtq.question_id
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY s.subject_code
ORDER BY MIN(mtq.question_order);
