-- 0120_jee_advanced_quality_test_1.sql
-- GYAN JEE Advanced Quality Test 1
--
-- IMPORTANT:
-- JEE Advanced 2026 officially has two compulsory 3-hour papers, but the
-- exact question count and marking scheme are paper-specific. This migration
-- preserves GYAN's existing fixed Advanced practice architecture:
--
--   54 questions total
--   18 Mathematics / 18 Physics / 18 Chemistry
--   18 Single Choice / 18 Multi Select / 18 Numerical
--   Difficulty: 9 easy / 27 medium / 18 challenge
--
-- This replaces ONLY JEE FULL TEST_1 ADVANCED v1 mappings/content.
-- JEE Main Test 1 is untouched.

PRAGMA foreign_keys = ON;

UPDATE education_mock_tests
SET published=0,
    access_mode='OPEN',
    updated_at=CURRENT_TIMESTAMP
WHERE program_code='JEE'
  AND test_kind='FULL'
  AND test_code='TEST_1'
  AND exam_level='ADVANCED'
  AND version=1;

DELETE FROM education_mock_test_questions
WHERE mock_test_id IN (
  SELECT id
  FROM education_mock_tests
  WHERE program_code='JEE'
    AND test_kind='FULL'
    AND test_code='TEST_1'
    AND exam_level='ADVANCED'
    AND version=1
);


-- 01. MATH | SINGLE_CHOICE | easy | SETS_RELATIONS_FUNCTIONS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_ADV_01',
  'easy',
  'If f(x)=x²+1, then f(2)+f(-2) equals:',
  '6',
  '8',
  '10',
  '12',
  'C',
  'Each value is 5.',
  1,
  'gyan-quality-test1-advanced'
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
  'ADVANCED',
  'SINGLE_CHOICE',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_MATH_1',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["6","8","10","12"]',
  '["C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  1,
  'MATH',
  3,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_01'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 02. MATH | MULTI_SELECT | medium | COMPLEX_QUADRATIC
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_ADV_02',
  'medium',
  'For z=1+i, which statements are true?',
  '|z|=√2',
  'z²=2i',
  '1/z=(1-i)/2',
  'z is purely imaginary',
  'ABC',
  'Direct calculation gives A, B, and C.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='COMPLEX_QUADRATIC'
  AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'MULTI_SELECT',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_MATH_2',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  NULL,
  '["|z|=√2","z²=2i","1/z=(1-i)/2","z is purely imaginary"]',
  '["A","B","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  2,
  'MATH',
  4,
  -2,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_02'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 03. MATH | NUMERICAL | medium | SEQUENCES_SERIES
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_ADV_03',
  'medium',
  'An AP has first term 5 and common difference 3. Enter its 12th term.',
  '38',
  '',
  '',
  '',
  'A',
  'a12=5+11×3=38.',
  1,
  'gyan-quality-test1-advanced'
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
  'ADVANCED',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_MATH_3',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["38"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  3,
  'MATH',
  4,
  0,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_03'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 04. MATH | SINGLE_CHOICE | medium | BINOMIAL_THEOREM
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_ADV_04',
  'medium',
  'The coefficient of x² in (1+x)^5 is:',
  '5',
  '10',
  '15',
  '20',
  'B',
  'C(5,2)=10.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='BINOMIAL_THEOREM'
  AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'SINGLE_CHOICE',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_MATH_4',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["5","10","15","20"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  4,
  'MATH',
  3,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_04'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 05. MATH | MULTI_SELECT | challenge | MATRICES_DETERMINANTS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_ADV_05',
  'challenge',
  'For a 2×2 matrix A with det(A)=3, which statements are true?',
  'det(2A)=12',
  'det(A⁻¹)=1/3',
  'det(Aᵀ)=3',
  'det(A²)=6',
  'ABC',
  'For order 2, det(2A)=4detA; inverse and transpose rules apply; det(A²)=9.',
  1,
  'gyan-quality-test1-advanced'
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
  'ADVANCED',
  'MULTI_SELECT',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_MATH_5',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  NULL,
  '["det(2A)=12","det(A⁻¹)=1/3","det(Aᵀ)=3","det(A²)=6"]',
  '["A","B","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_05';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  5,
  'MATH',
  4,
  -2,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_05'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 06. MATH | NUMERICAL | challenge | PERMUTATIONS_COMBINATIONS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_ADV_06',
  'challenge',
  'Enter the number of 4-letter arrangements using distinct letters chosen from A,B,C,D,E.',
  '120',
  '',
  '',
  '',
  'A',
  '5P4=120.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='PERMUTATIONS_COMBINATIONS'
  AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_MATH_6',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_06';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["120"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_06';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  6,
  'MATH',
  4,
  0,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_06'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 07. MATH | SINGLE_CHOICE | easy | TRIGONOMETRY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_ADV_07',
  'easy',
  'If sin θ=3/5 for an acute θ, cos θ is:',
  '3/5',
  '4/5',
  '5/4',
  '2/5',
  'B',
  'Use a 3-4-5 triangle.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='TRIGONOMETRY'
  AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'SINGLE_CHOICE',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_MATH_7',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_07';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["3/5","4/5","5/4","2/5"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_07';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  7,
  'MATH',
  3,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_07'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 08. MATH | MULTI_SELECT | medium | COORDINATE_GEOMETRY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_ADV_08',
  'medium',
  'For the circle x²+y²=25, which points lie on it?',
  '(3,4)',
  '(5,0)',
  '(0,-5)',
  '(4,4)',
  'ABC',
  'The first three satisfy x²+y²=25.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='COORDINATE_GEOMETRY'
  AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'MULTI_SELECT',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_MATH_8',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_08';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  NULL,
  '["(3,4)","(5,0)","(0,-5)","(4,4)"]',
  '["A","B","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_08';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  8,
  'MATH',
  4,
  -2,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_08'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 09. MATH | NUMERICAL | medium | LIMITS_CONTINUITY_DIFFERENTIABILITY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_ADV_09',
  'medium',
  'Enter lim(x→2) (x²-4)/(x-2).',
  '4',
  '',
  '',
  '',
  'A',
  'Factor as x+2.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY'
  AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_MATH_9',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_09';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["4"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_09';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  9,
  'MATH',
  4,
  0,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_09'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 10. MATH | SINGLE_CHOICE | medium | INTEGRAL_CALCULUS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_ADV_10',
  'medium',
  '∫₀¹ 2x dx equals:',
  '0',
  '1',
  '2',
  '4',
  'B',
  'The antiderivative is x².',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='INTEGRAL_CALCULUS'
  AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'SINGLE_CHOICE',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_MATH_10',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_10';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["0","1","2","4"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_10';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  10,
  'MATH',
  3,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_10'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 11. MATH | MULTI_SELECT | challenge | DIFFERENTIAL_EQUATIONS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_ADV_11',
  'challenge',
  'For dy/dx=2x, which functions satisfy the differential equation?',
  'y=x²',
  'y=x²+3',
  'y=x²-7',
  'y=2x²',
  'ABC',
  'All y=x²+C satisfy it.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='DIFFERENTIAL_EQUATIONS'
  AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'MULTI_SELECT',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_MATH_11',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_11';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  NULL,
  '["y=x²","y=x²+3","y=x²-7","y=2x²"]',
  '["A","B","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_11';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  11,
  'MATH',
  4,
  -2,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_11'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 12. MATH | NUMERICAL | medium | VECTOR_ALGEBRA
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_ADV_12',
  'medium',
  'If a=(1,2,2), enter |a|.',
  '3',
  '',
  '',
  '',
  'A',
  '√(1+4+4)=3.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='VECTOR_ALGEBRA'
  AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_MATH_12',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_12';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["3"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_12';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  12,
  'MATH',
  4,
  0,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_12'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 13. MATH | SINGLE_CHOICE | challenge | THREE_D_GEOMETRY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_ADV_13',
  'challenge',
  'Distance between (1,2,3) and (4,6,3) is:',
  '4',
  '5',
  '6',
  '7',
  'B',
  'Distance is √(3²+4²)=5.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='THREE_D_GEOMETRY'
  AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'SINGLE_CHOICE',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_MATH_13',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_13';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["4","5","6","7"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_13';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  13,
  'MATH',
  3,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_13'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 14. MATH | MULTI_SELECT | medium | STATISTICS_PROBABILITY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_ADV_14',
  'medium',
  'A fair die is rolled once. Which events have probability 1/2?',
  'even number',
  'odd number',
  'number greater than 3',
  'prime number',
  'ABCD',
  'Each event contains three of the six equally likely outcomes.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='STATISTICS_PROBABILITY'
  AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'MULTI_SELECT',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_MATH_14',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_14';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  NULL,
  '["even number","odd number","number greater than 3","prime number"]',
  '["A","B","C","D"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_14';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  14,
  'MATH',
  4,
  -2,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_14'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 15. MATH | NUMERICAL | challenge | MATRICES_DETERMINANTS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_ADV_15',
  'challenge',
  'Enter the determinant of [[2,1],[3,4]].',
  '5',
  '',
  '',
  '',
  'A',
  '2×4-1×3=5.',
  1,
  'gyan-quality-test1-advanced'
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
  'ADVANCED',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_MATH_15',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_15';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["5"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_15';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  15,
  'MATH',
  4,
  0,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_15'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 16. MATH | SINGLE_CHOICE | medium | COMPLEX_QUADRATIC
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_ADV_16',
  'medium',
  'The sum of roots of x²-6x+5=0 is:',
  '1',
  '5',
  '6',
  '11',
  'C',
  'Sum of roots is 6.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='COMPLEX_QUADRATIC'
  AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'SINGLE_CHOICE',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_MATH_16',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_16';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["1","5","6","11"]',
  '["C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_16';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  16,
  'MATH',
  3,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_16'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 17. MATH | MULTI_SELECT | challenge | SETS_RELATIONS_FUNCTIONS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_ADV_17',
  'challenge',
  'For f(x)=|x|, which statements are true?',
  'f is even',
  'f is continuous at 0',
  'f is differentiable at 0',
  'f(x)≥0 for all real x',
  'ABD',
  '|x| is even, continuous, nonnegative, but not differentiable at 0.',
  1,
  'gyan-quality-test1-advanced'
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
  'ADVANCED',
  'MULTI_SELECT',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_MATH_17',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_17';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  NULL,
  '["f is even","f is continuous at 0","f is differentiable at 0","f(x)≥0 for all real x"]',
  '["A","B","D"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_17';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  17,
  'MATH',
  4,
  -2,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_17'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 18. MATH | NUMERICAL | easy | INTEGRAL_CALCULUS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_MATH_QT1_ADV_18',
  'easy',
  'Enter ∫₀² x dx.',
  '2',
  '',
  '',
  '',
  'A',
  'x²/2 from 0 to 2 equals 2.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='INTEGRAL_CALCULUS'
  AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_MATH_18',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_18';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["2"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_18';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  18,
  'MATH',
  4,
  0,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_QT1_ADV_18'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 19. PHYSICS | SINGLE_CHOICE | easy | UNITS_MEASUREMENTS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_ADV_01',
  'easy',
  'The dimensional formula of energy is:',
  'ML²T⁻²',
  'MLT⁻²',
  'ML⁻¹T⁻²',
  'M⁰L²T⁻¹',
  'A',
  'Energy has dimensions force × distance.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='UNITS_MEASUREMENTS'
  AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'SINGLE_CHOICE',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_PHYSICS_19',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["ML²T⁻²","MLT⁻²","ML⁻¹T⁻²","M⁰L²T⁻¹"]',
  '["A"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  19,
  'PHYSICS',
  3,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_01'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 20. PHYSICS | MULTI_SELECT | medium | KINEMATICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_ADV_02',
  'medium',
  'For motion with constant acceleration, which statements are true?',
  'velocity changes linearly with time',
  'displacement is quadratic in time',
  'acceleration is constant',
  'speed must always increase',
  'ABC',
  'The first three are standard constant-acceleration properties.',
  1,
  'gyan-quality-test1-advanced'
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
  'ADVANCED',
  'MULTI_SELECT',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_PHYSICS_20',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  NULL,
  '["velocity changes linearly with time","displacement is quadratic in time","acceleration is constant","speed must always increase"]',
  '["A","B","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  20,
  'PHYSICS',
  4,
  -2,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_02'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 21. PHYSICS | NUMERICAL | medium | LAWS_OF_MOTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_ADV_03',
  'medium',
  'A 4 kg body is acted on by a net force of 20 N. Enter its acceleration in m/s².',
  '5',
  '',
  '',
  '',
  'A',
  'a=F/m=5.',
  1,
  'gyan-quality-test1-advanced'
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
  'ADVANCED',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_PHYSICS_21',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["5"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  21,
  'PHYSICS',
  4,
  0,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_03'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 22. PHYSICS | SINGLE_CHOICE | medium | WORK_ENERGY_POWER
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_ADV_04',
  'medium',
  'A 2 kg body moving at 4 m/s has kinetic energy:',
  '8 J',
  '12 J',
  '16 J',
  '32 J',
  'C',
  'K=½mv²=16 J.',
  1,
  'gyan-quality-test1-advanced'
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
  'ADVANCED',
  'SINGLE_CHOICE',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_PHYSICS_22',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["8 J","12 J","16 J","32 J"]',
  '["C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  22,
  'PHYSICS',
  3,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_04'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 23. PHYSICS | MULTI_SELECT | challenge | ROTATIONAL_MOTION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_ADV_05',
  'challenge',
  'For pure rolling without slipping, which statements are true?',
  'vCM=ωR',
  'point of contact is instantaneously at rest relative to ground',
  'translational and rotational kinetic energies both contribute',
  'angular speed must be zero',
  'ABC',
  'Pure rolling satisfies the first three.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'MULTI_SELECT',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_PHYSICS_23',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  NULL,
  '["vCM=ωR","point of contact is instantaneously at rest relative to ground","translational and rotational kinetic energies both contribute","angular speed must be zero"]',
  '["A","B","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_05';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  23,
  'PHYSICS',
  4,
  -2,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_05'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 24. PHYSICS | NUMERICAL | challenge | GRAVITATION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_ADV_06',
  'challenge',
  'Taking g=10 m/s², enter the weight in newtons of a 3 kg body.',
  '30',
  '',
  '',
  '',
  'A',
  'W=mg=30 N.',
  1,
  'gyan-quality-test1-advanced'
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
  'ADVANCED',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_PHYSICS_24',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_06';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["30"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_06';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  24,
  'PHYSICS',
  4,
  0,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_06'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 25. PHYSICS | SINGLE_CHOICE | easy | THERMODYNAMICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_ADV_07',
  'easy',
  'For an ideal gas in an isothermal process, ΔU is:',
  'positive',
  'negative',
  'zero',
  'infinite',
  'C',
  'Internal energy depends only on temperature.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='THERMODYNAMICS'
  AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'SINGLE_CHOICE',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_PHYSICS_25',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_07';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["positive","negative","zero","infinite"]',
  '["C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_07';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  25,
  'PHYSICS',
  3,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_07'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 26. PHYSICS | MULTI_SELECT | medium | CURRENT_ELECTRICITY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_ADV_08',
  'medium',
  'For two resistors 6 Ω and 3 Ω in parallel, which statements are true?',
  'equivalent resistance is 2 Ω',
  'same voltage appears across both',
  'current through 3 Ω is larger',
  'equivalent resistance exceeds 6 Ω',
  'ABC',
  'Parallel combination gives 2 Ω and common voltage.',
  1,
  'gyan-quality-test1-advanced'
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
  'ADVANCED',
  'MULTI_SELECT',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_PHYSICS_26',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_08';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  NULL,
  '["equivalent resistance is 2 Ω","same voltage appears across both","current through 3 Ω is larger","equivalent resistance exceeds 6 Ω"]',
  '["A","B","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_08';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  26,
  'PHYSICS',
  4,
  -2,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_08'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 27. PHYSICS | NUMERICAL | medium | ELECTROSTATICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_ADV_09',
  'medium',
  'Two charges 1 C and 1 C are separated by 3 m in vacuum. Using k=9×10⁹, enter the force in 10⁹ N units.',
  '1',
  '',
  '',
  '',
  'A',
  'F=9×10⁹/9=1×10⁹ N.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTROSTATICS'
  AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_PHYSICS_27',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_09';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["1"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_09';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  27,
  'PHYSICS',
  4,
  0,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_09'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 28. PHYSICS | SINGLE_CHOICE | medium | MAGNETIC_EFFECTS_MAGNETISM
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_ADV_10',
  'medium',
  'A charged particle moving parallel to a uniform magnetic field experiences force:',
  'qvB',
  'zero',
  'qB/v',
  'maximum',
  'B',
  'F=qvB sin0=0.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM'
  AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'SINGLE_CHOICE',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_PHYSICS_28',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_10';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["qvB","zero","qB/v","maximum"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_10';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  28,
  'PHYSICS',
  3,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_10'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 29. PHYSICS | MULTI_SELECT | challenge | EMI_AC
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_ADV_11',
  'challenge',
  'For a pure resistor connected to AC, which statements are true?',
  'current and voltage are in phase',
  'average power is positive',
  'power factor is 1',
  'current lags voltage by 90°',
  'ABC',
  'A pure resistor has zero phase angle.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='EMI_AC'
  AND st.subtopic_code='EMI_AC_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'MULTI_SELECT',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_PHYSICS_29',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_11';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  NULL,
  '["current and voltage are in phase","average power is positive","power factor is 1","current lags voltage by 90°"]',
  '["A","B","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_11';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  29,
  'PHYSICS',
  4,
  -2,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_11'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 30. PHYSICS | NUMERICAL | medium | OSCILLATIONS_WAVES
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_ADV_12',
  'medium',
  'A wave has frequency 25 Hz and wavelength 4 m. Enter speed in m/s.',
  '100',
  '',
  '',
  '',
  'A',
  'v=fλ=100.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OSCILLATIONS_WAVES'
  AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_PHYSICS_30',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_12';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["100"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_12';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  30,
  'PHYSICS',
  4,
  0,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_12'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 31. PHYSICS | SINGLE_CHOICE | challenge | OPTICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_ADV_13',
  'challenge',
  'A convex lens has focal length 20 cm. Its power is:',
  '+5 D',
  '-5 D',
  '+0.2 D',
  '-0.2 D',
  'A',
  'f=0.2 m, so P=+5 D.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS'
  AND st.subtopic_code='OPTICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'SINGLE_CHOICE',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_PHYSICS_31',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_13';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["+5 D","-5 D","+0.2 D","-0.2 D"]',
  '["A"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_13';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  31,
  'PHYSICS',
  3,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_13'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 32. PHYSICS | MULTI_SELECT | medium | DUAL_NATURE
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_ADV_14',
  'medium',
  'Which statements about photoelectric effect are true?',
  'there is a threshold frequency',
  'maximum kinetic energy depends on frequency',
  'increasing intensity above threshold can increase photoelectron count',
  'below threshold, arbitrarily high intensity always causes emission',
  'ABC',
  'The fourth statement is false.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='DUAL_NATURE'
  AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'MULTI_SELECT',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_PHYSICS_32',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_14';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  NULL,
  '["there is a threshold frequency","maximum kinetic energy depends on frequency","increasing intensity above threshold can increase photoelectron count","below threshold, arbitrarily high intensity always causes emission"]',
  '["A","B","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_14';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  32,
  'PHYSICS',
  4,
  -2,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_14'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 33. PHYSICS | NUMERICAL | challenge | ATOMS_NUCLEI
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_ADV_15',
  'challenge',
  'After 4 half-lives, enter the percentage of a radioactive sample remaining.',
  '6.25',
  '',
  '',
  '',
  'A',
  'Remaining fraction=(1/2)^4=1/16=6.25%.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ATOMS_NUCLEI'
  AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_PHYSICS_33',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_15';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["6.25"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_15';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  33,
  'PHYSICS',
  4,
  0,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_15'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 34. PHYSICS | SINGLE_CHOICE | medium | ELECTRONIC_DEVICES
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_ADV_16',
  'medium',
  'In forward bias, a p-n junction diode has:',
  'high resistance',
  'low resistance',
  'zero current always',
  'infinite barrier width',
  'B',
  'Forward bias lowers the barrier.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ELECTRONIC_DEVICES'
  AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'SINGLE_CHOICE',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_PHYSICS_34',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_16';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["high resistance","low resistance","zero current always","infinite barrier width"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_16';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  34,
  'PHYSICS',
  3,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_16'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 35. PHYSICS | MULTI_SELECT | challenge | PROPERTIES_SOLIDS_LIQUIDS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_ADV_17',
  'challenge',
  'For steady incompressible fluid flow, which statements may be used?',
  'A₁v₁=A₂v₂',
  'Bernoulli equation along a streamline',
  'speed rises in a narrower tube',
  'pressure must always rise in a narrower tube',
  'ABC',
  'Continuity and Bernoulli support A-C; pressure commonly falls in a constriction.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS'
  AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'MULTI_SELECT',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_PHYSICS_35',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_17';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  NULL,
  '["A₁v₁=A₂v₂","Bernoulli equation along a streamline","speed rises in a narrower tube","pressure must always rise in a narrower tube"]',
  '["A","B","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_17';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  35,
  'PHYSICS',
  4,
  -2,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_17'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 36. PHYSICS | NUMERICAL | easy | KINETIC_THEORY_GASES
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_PHYSICS_QT1_ADV_18',
  'easy',
  'At fixed molar mass, if absolute temperature becomes four times, rms speed becomes how many times?',
  '2',
  '',
  '',
  '',
  'A',
  'vrms∝√T.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINETIC_THEORY_GASES'
  AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_PHYSICS_36',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_18';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["2"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_18';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  36,
  'PHYSICS',
  4,
  0,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_ADV_18'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 37. CHEMISTRY | SINGLE_CHOICE | easy | BASIC_CONCEPTS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_01',
  'easy',
  'The number of moles in 18 g of water is:',
  '0.5',
  '1',
  '2',
  '18',
  'B',
  'Molar mass is 18 g/mol.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BASIC_CONCEPTS'
  AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'SINGLE_CHOICE',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_CHEMISTRY_37',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_01';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["0.5","1","2","18"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_01';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  37,
  'CHEMISTRY',
  3,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_01'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 38. CHEMISTRY | MULTI_SELECT | medium | ATOMIC_STRUCTURE
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_02',
  'medium',
  'Which statements are true for the n=3 shell?',
  'l can be 0,1,2',
  'maximum electrons are 18',
  'it contains s,p,d subshells',
  'l can be 3',
  'ABC',
  'For n=3, l=0,1,2 and capacity is 18.',
  1,
  'gyan-quality-test1-advanced'
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
  'ADVANCED',
  'MULTI_SELECT',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_CHEMISTRY_38',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_02';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  NULL,
  '["l can be 0,1,2","maximum electrons are 18","it contains s,p,d subshells","l can be 3"]',
  '["A","B","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_02';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  38,
  'CHEMISTRY',
  4,
  -2,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_02'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 39. CHEMISTRY | NUMERICAL | medium | CHEMICAL_BONDING
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_03',
  'medium',
  'Enter the number of lone pairs on the central atom in NH₃.',
  '1',
  '',
  '',
  '',
  'A',
  'Nitrogen has one lone pair in NH₃.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_BONDING'
  AND st.subtopic_code='CHEMICAL_BONDING_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_CHEMISTRY_39',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_03';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["1"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_03';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  39,
  'CHEMISTRY',
  4,
  0,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_03'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 40. CHEMISTRY | SINGLE_CHOICE | medium | CHEMICAL_THERMODYNAMICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_04',
  'medium',
  'For a spontaneous process at constant T and P, ΔG is:',
  'positive',
  'negative',
  'always zero',
  'equal to ΔH',
  'B',
  'Spontaneity requires ΔG<0.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMICAL_THERMODYNAMICS'
  AND st.subtopic_code='CHEMICAL_THERMODYNAMICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'SINGLE_CHOICE',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_CHEMISTRY_40',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_04';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["positive","negative","always zero","equal to ΔH"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_04';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  40,
  'CHEMISTRY',
  3,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_04'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 41. CHEMISTRY | MULTI_SELECT | challenge | SOLUTIONS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_05',
  'challenge',
  'For an ideal dilute solution with a nonvolatile solute, which colligative properties increase with solute concentration?',
  'boiling-point elevation',
  'freezing-point depression',
  'osmotic pressure',
  'vapour pressure of solvent',
  'ABC',
  'Vapour pressure decreases.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOLUTIONS'
  AND st.subtopic_code='SOLUTIONS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'MULTI_SELECT',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_CHEMISTRY_41',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_05';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  NULL,
  '["boiling-point elevation","freezing-point depression","osmotic pressure","vapour pressure of solvent"]',
  '["A","B","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_05';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  41,
  'CHEMISTRY',
  4,
  -2,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_05'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 42. CHEMISTRY | NUMERICAL | challenge | EQUILIBRIUM
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_06',
  'challenge',
  'At 25°C, enter pOH when pH=9.2.',
  '4.8',
  '',
  '',
  '',
  'A',
  'pH+pOH=14.',
  1,
  'gyan-quality-test1-advanced'
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
  'ADVANCED',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_CHEMISTRY_42',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_06';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["4.8"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_06';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  42,
  'CHEMISTRY',
  4,
  0,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_06'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 43. CHEMISTRY | SINGLE_CHOICE | easy | REDOX_ELECTROCHEMISTRY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_07',
  'easy',
  'Oxidation occurs at the:',
  'cathode',
  'anode',
  'salt bridge',
  'electrolyte only',
  'B',
  'Oxidation is at the anode.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='REDOX_ELECTROCHEMISTRY'
  AND st.subtopic_code='REDOX_ELECTROCHEMISTRY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'SINGLE_CHOICE',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_CHEMISTRY_43',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_07';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["cathode","anode","salt bridge","electrolyte only"]',
  '["B"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_07';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  43,
  'CHEMISTRY',
  3,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_07'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 44. CHEMISTRY | MULTI_SELECT | medium | CHEMICAL_KINETICS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_08',
  'medium',
  'Which factors can increase reaction rate?',
  'higher temperature',
  'higher reactant concentration in many reactions',
  'a suitable catalyst',
  'always increasing product concentration',
  'ABC',
  'A-C commonly increase rate.',
  1,
  'gyan-quality-test1-advanced'
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
  'ADVANCED',
  'MULTI_SELECT',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_CHEMISTRY_44',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_08';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  NULL,
  '["higher temperature","higher reactant concentration in many reactions","a suitable catalyst","always increasing product concentration"]',
  '["A","B","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_08';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  44,
  'CHEMISTRY',
  4,
  -2,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_08'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 45. CHEMISTRY | NUMERICAL | medium | PERIODICITY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_09',
  'medium',
  'Enter the number of valence electrons in a neutral chlorine atom.',
  '7',
  '',
  '',
  '',
  'A',
  'Cl is in group 17.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='PERIODICITY'
  AND st.subtopic_code='PERIODICITY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_CHEMISTRY_45',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_09';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["7"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_09';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  45,
  'CHEMISTRY',
  4,
  0,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_09'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 46. CHEMISTRY | SINGLE_CHOICE | medium | COORDINATION
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_10',
  'medium',
  'Coordination number of Co in [Co(NH₃)₆]³⁺ is:',
  '3',
  '4',
  '6',
  '9',
  'C',
  'Six ligands are coordinated.',
  1,
  'gyan-quality-test1-advanced'
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
  'ADVANCED',
  'SINGLE_CHOICE',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_CHEMISTRY_46',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_10';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["3","4","6","9"]',
  '["C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_10';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  46,
  'CHEMISTRY',
  3,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_10'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 47. CHEMISTRY | MULTI_SELECT | challenge | D_F_BLOCK
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_11',
  'challenge',
  'Which are commonly associated with transition-metal chemistry?',
  'variable oxidation states',
  'coloured ions',
  'complex formation',
  'complete absence of catalytic behaviour',
  'ABC',
  'The first three are common features.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='D_F_BLOCK'
  AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'MULTI_SELECT',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_CHEMISTRY_47',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_11';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  NULL,
  '["variable oxidation states","coloured ions","complex formation","complete absence of catalytic behaviour"]',
  '["A","B","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_11';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  47,
  'CHEMISTRY',
  4,
  -2,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_11'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 48. CHEMISTRY | NUMERICAL | medium | P_BLOCK
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_12',
  'medium',
  'Enter the oxidation state of sulfur in H₂SO₄.',
  '6',
  '',
  '',
  '',
  'A',
  '2(+1)+S+4(-2)=0 gives S=+6.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='P_BLOCK'
  AND st.subtopic_code='P_BLOCK_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_CHEMISTRY_48',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_12';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["6"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_12';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  48,
  'CHEMISTRY',
  4,
  0,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_12'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 49. CHEMISTRY | SINGLE_CHOICE | challenge | ORGANIC_PRINCIPLES
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_13',
  'challenge',
  'The most stable carbocation among these is:',
  'CH₃⁺',
  'primary',
  'secondary',
  'tertiary',
  'D',
  'Alkyl substitution stabilizes carbocations.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='ORGANIC_PRINCIPLES'
  AND st.subtopic_code='ORGANIC_PRINCIPLES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'SINGLE_CHOICE',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_CHEMISTRY_49',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_13';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["CH₃⁺","primary","secondary","tertiary"]',
  '["D"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_13';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  49,
  'CHEMISTRY',
  3,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_13'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 50. CHEMISTRY | MULTI_SELECT | medium | HYDROCARBONS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_14',
  'medium',
  'Which compounds readily undergo electrophilic addition?',
  'ethene',
  'propene',
  'ethyne',
  'benzene under ordinary alkene-addition conditions',
  'ABC',
  'Alkenes and alkynes undergo addition; benzene resists ordinary addition.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='HYDROCARBONS'
  AND st.subtopic_code='HYDROCARBONS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'MULTI_SELECT',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_CHEMISTRY_50',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_14';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  NULL,
  '["ethene","propene","ethyne","benzene under ordinary alkene-addition conditions"]',
  '["A","B","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_14';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  50,
  'CHEMISTRY',
  4,
  -2,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_14'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 51. CHEMISTRY | NUMERICAL | challenge | OXYGEN_COMPOUNDS
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_15',
  'challenge',
  'Enter the number of carbon atoms in ethanol.',
  '2',
  '',
  '',
  '',
  'A',
  'Ethanol is C₂H₅OH.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='OXYGEN_COMPOUNDS'
  AND st.subtopic_code='OXYGEN_COMPOUNDS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_CHEMISTRY_51',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_15';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["2"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_15';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  51,
  'CHEMISTRY',
  4,
  0,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_15'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 52. CHEMISTRY | SINGLE_CHOICE | medium | BIOMOLECULES
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_16',
  'medium',
  'Proteins are polymers of:',
  'amino acids',
  'nucleotides',
  'monosaccharides only',
  'fatty acids',
  'A',
  'Peptide bonds connect amino acids.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BIOMOLECULES'
  AND st.subtopic_code='BIOMOLECULES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'SINGLE_CHOICE',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_CHEMISTRY_52',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_16';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'SINGLE_CHOICE',
  'NONE',
  NULL,
  NULL,
  '["amino acids","nucleotides","monosaccharides only","fatty acids"]',
  '["A"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_16';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  52,
  'CHEMISTRY',
  3,
  -1,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_16'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 53. CHEMISTRY | MULTI_SELECT | challenge | PRACTICAL_CHEMISTRY
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_17',
  'challenge',
  'Which practices improve reliability in volumetric analysis?',
  'rinsing burette with titrant',
  'reading meniscus consistently',
  'repeating concordant titrations',
  'using an uncalibrated beaker instead of a pipette for exact aliquots',
  'ABC',
  'A-C are good volumetric practices.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='PRACTICAL_CHEMISTRY'
  AND st.subtopic_code='PRACTICAL_CHEMISTRY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'MULTI_SELECT',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_CHEMISTRY_53',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_17';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'MULTI_SELECT',
  'NONE',
  NULL,
  NULL,
  '["rinsing burette with titrant","reading meniscus consistently","repeating concordant titrations","using an uncalibrated beaker instead of a pipette for exact aliquots"]',
  '["A","B","C"]',
  0,
  NULL,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_17';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  53,
  'CHEMISTRY',
  4,
  -2,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_17'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


-- 54. CHEMISTRY | NUMERICAL | easy | STATES_OF_MATTER
INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  st.id,
  'IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_18',
  'easy',
  'At STP in the idealized school convention, enter the molar gas volume in litres per mole.',
  '22.4',
  '',
  '',
  '',
  'A',
  'Standard textbook value is 22.4 L mol⁻¹.',
  1,
  'gyan-quality-test1-advanced'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='STATES_OF_MATTER'
  AND st.subtopic_code='STATES_OF_MATTER_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT
  q.id,
  'ADVANCED',
  'NUMERICAL',
  'JEE_2026',
  'REVIEWED',
  'QUALITY_ADV_TEST1_CHEMISTRY_54',
  'GYAN JEE Advanced Quality Test 1'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_18';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT
  q.id,
  'NUMERIC_ENTRY',
  'NONE',
  NULL,
  NULL,
  NULL,
  '["22.4"]',
  0,
  0.000001,
  0,
  CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_18';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT
  mt.id,
  q.id,
  54,
  'CHEMISTRY',
  4,
  0,
  0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_ADV_18'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;


UPDATE education_mock_tests
SET published=CASE
      WHEN (
        SELECT COUNT(*)
        FROM education_mock_test_questions mtq
        WHERE mtq.mock_test_id=education_mock_tests.id
      )=54 THEN 1 ELSE 0 END,
    access_mode='OPEN',
    updated_at=CURRENT_TIMESTAMP
WHERE program_code='JEE'
  AND test_kind='FULL'
  AND test_code='TEST_1'
  AND exam_level='ADVANCED'
  AND version=1;

-- Audits
SELECT
  mt.id, mt.published,
  COUNT(mtq.question_id) AS question_count,
  COUNT(DISTINCT mtq.question_id) AS unique_questions,
  SUM(COALESCE(mtq.marks_correct,0)) AS maximum_marks
FROM education_mock_tests mt
LEFT JOIN education_mock_test_questions mtq ON mtq.mock_test_id=mt.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
GROUP BY mt.id,mt.published;

SELECT mtq.section_code, COUNT(*) AS questions
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq ON mtq.mock_test_id=mt.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
GROUP BY mtq.section_code
ORDER BY MIN(mtq.question_order);

SELECT q.difficulty, COUNT(*) AS questions
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq ON mtq.mock_test_id=mt.id
JOIN education_questions q ON q.id=mtq.question_id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
GROUP BY q.difficulty
ORDER BY CASE q.difficulty WHEN 'easy' THEN 1 WHEN 'medium' THEN 2 WHEN 'challenge' THEN 3 ELSE 4 END;

SELECT COALESCE(rd.response_type,qm.question_format,'SINGLE_CHOICE') AS response_type,
       COUNT(*) AS questions
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq ON mtq.mock_test_id=mt.id
JOIN education_questions q ON q.id=mtq.question_id
LEFT JOIN education_question_metadata qm ON qm.question_id=q.id
LEFT JOIN education_question_response_details rd ON rd.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
GROUP BY COALESCE(rd.response_type,qm.question_format,'SINGLE_CHOICE')
ORDER BY response_type;

SELECT s.subject_code,
       COUNT(DISTINCT t.id) AS topics_covered,
       COUNT(*) AS questions
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq ON mtq.mock_test_id=mt.id
JOIN education_questions q ON q.id=mtq.question_id
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
GROUP BY s.subject_code
ORDER BY MIN(mtq.question_order);
