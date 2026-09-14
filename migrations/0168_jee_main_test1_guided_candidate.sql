-- 0168_jee_main_test1_guided_candidate.sql
-- Candidate regeneration of JEE Main Test 1 with a Tip designed together
-- with every question. Apply LOCAL first.
--
-- Structure:
--   75 questions / 300 marks
--   Mathematics 25, Physics 25, Chemistry 25
--   Per subject: 20 MCQ + 5 Numerical
--   Difficulty total: 18 easy / 39 medium / 18 challenge
--   +4 correct, -1 incorrect, 0 unanswered
--
-- This replaces ONLY JEE FULL TEST_1 MAIN v1 mappings.
-- Dedicated new questions are anchored to the existing Test 1 subtopics.
-- All 75 carry education_question_guidance.tip_text.
--
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
  SELECT id FROM education_mock_tests
  WHERE program_code='JEE'
    AND test_kind='FULL'
    AND test_code='TEST_1'
    AND exam_level='MAIN'
    AND version=1
);


-- 01. MATHEMATICS | SINGLE_CHOICE | challenge

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_001',
  'challenge',
  'Let f:R→R be defined by f(x)=x²+2x+3. The minimum value of f(x) is:',
  '1','2','3','4',
  'B',
  'Complete the square: f(x)=(x+1)²+2, so the minimum is 2.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_005'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_001',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_001';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["1","2","3","4"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_001';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Complete the square first. The constant left after forming a perfect square gives the minimum.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_001';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,1,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_001'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 02. MATHEMATICS | SINGLE_CHOICE | challenge

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_002',
  'challenge',
  'If z satisfies z²-(2+i)z+(1+i)=0, then the sum of the moduli of its roots is:',
  '1','2','√2','1+√2',
  'D',
  'The roots are 1 and 1+i, with moduli 1 and √2.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_005'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_002',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_002';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["1","2","√2","1+√2"]','["D"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_002';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Try factoring the quadratic by testing a simple real root before using the quadratic formula.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_002';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,2,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_002'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 03. MATHEMATICS | SINGLE_CHOICE | challenge

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_003',
  'challenge',
  'For A=[[1,2],[3,4]], det(A²-5A+2I) equals:',
  '0','4','8','16',
  'D',
  'The characteristic polynomial is λ²-5λ-2, so A²-5A-2I=0. Hence A²-5A+2I=4I and det(4I)=16.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_005'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_003',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_003';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["0","4","8","16"]','["D"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_003';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Use Cayley-Hamilton first; avoid multiplying A² directly.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_003';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,3,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_003'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 04. MATHEMATICS | SINGLE_CHOICE | challenge

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_004',
  'challenge',
  'From 6 distinct books, the number of ways to choose 3 books if two particular books are not chosen together is:',
  '16','18','19','20',
  'A',
  'Total C(6,3)=20. Choices containing both particular books: choose the third from the other 4, so 4. Valid=20-4=16.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_005'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_004',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_004';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["16","18","19","20"]','["A"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_004';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Count all selections, then subtract those containing both restricted books.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_004';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,4,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_004'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 05. MATHEMATICS | SINGLE_CHOICE | challenge

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_005',
  'challenge',
  'The coefficient of x⁴ in (1+x)⁸(1-x)² is:',
  '-14','14','28','42',
  'A',
  'Coefficient=C(8,4)-2C(8,3)+C(8,2)=70-112+28=-14.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_005'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_005',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_005';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["-14","14","28","42"]','["A"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_005';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Only three products can contribute to x⁴; combine their binomial coefficients with signs.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_005';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,5,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_005'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 06. MATHEMATICS | SINGLE_CHOICE | easy

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_006',
  'easy',
  'If an AP has first term 4 and common difference 3, its 10th term is:',
  '28','31','34','37',
  'B',
  'a₁₀=4+9·3=31.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_006',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_006';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["28","31","34","37"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_006';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Use a_n=a+(n-1)d; be careful that the multiplier is n-1.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_006';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,6,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_006'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 07. MATHEMATICS | SINGLE_CHOICE | easy

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_007',
  'easy',
  'lim(x→0) (sin 5x)/(sin 2x) equals:',
  '2/5','5/2','3/2','1',
  'B',
  'Using sin(kx)~kx near zero, the limit is 5/2.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_007',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_007';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["2/5","5/2","3/2","1"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_007';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Replace each sine by its small-angle leading term.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_007';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,7,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_007'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 08. MATHEMATICS | SINGLE_CHOICE | easy

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_008',
  'easy',
  '∫₀² (3x²+2x) dx equals:',
  '8','10','12','14',
  'C',
  'The antiderivative is x³+x²; at 2 it gives 8+4=12.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_008',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_008';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["8","10","12","14"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_008';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Integrate term by term before applying the limits.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_008';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,8,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_008'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 09. MATHEMATICS | SINGLE_CHOICE | easy

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_009',
  'easy',
  'The general solution of dy/dx=2x with y(0)=3 is:',
  'y=x²+3','y=2x²+3','y=x²','y=2x+3',
  'A',
  'Integrating gives y=x²+C; y(0)=3 gives C=3.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_009',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_009';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["y=x²+3","y=2x²+3","y=x²","y=2x+3"]','["A"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_009';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Integrate first, then use the initial condition to determine the constant.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_009';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,9,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_009'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 10. MATHEMATICS | SINGLE_CHOICE | easy

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_010',
  'easy',
  'The distance between the parallel lines 3x+4y+5=0 and 3x+4y-10=0 is:',
  '1','2','3','5',
  'C',
  'Distance=|5-(-10)|/√(3²+4²)=15/5=3.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_010',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_010';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["1","2","3","5"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_010';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'For parallel lines with the same x,y coefficients, compare only their constant terms.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_010';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,10,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_010'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 11. MATHEMATICS | SINGLE_CHOICE | easy

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_011',
  'easy',
  'The distance from (1,2,3) to the xy-plane is:',
  '1','2','3','√14',
  'C',
  'Distance to the xy-plane z=0 is |z|=3.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_011',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_011';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["1","2","3","√14"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_011';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Which coordinate measures perpendicular displacement from the xy-plane?','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_011';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,11,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_011'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 12. MATHEMATICS | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_012',
  'medium',
  'If a=(1,2,2) and b=(2,0,1), then a·b equals:',
  '2','3','4','5',
  'C',
  'a·b=1·2+2·0+2·1=4.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_012',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_012';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["2","3","4","5"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_012';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Multiply corresponding components and add.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_012';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,12,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_012'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 13. MATHEMATICS | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_013',
  'medium',
  'A fair die is thrown once. The probability of obtaining a prime number is:',
  '1/3','1/2','2/3','5/6',
  'B',
  'Prime outcomes are 2,3,5: 3 of 6 outcomes, so 1/2.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_013',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_013';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["1/3","1/2","2/3","5/6"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_013';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'List the prime faces of the die before forming the probability.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_013';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,13,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_013'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 14. MATHEMATICS | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_014',
  'medium',
  'sin²θ+cos²θ equals:',
  '0','1','sin2θ','cos2θ',
  'B',
  'This is the fundamental Pythagorean identity.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_014',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_014';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["0","1","sin2θ","cos2θ"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_014';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Recall the basic identity obtained from a unit circle.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_014';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,14,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_014'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 15. MATHEMATICS | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_015',
  'medium',
  'If A={1,2,3} and B={2,3,4}, then A∩B is:',
  '{1,4}','{2,3}','{1,2,3,4}','∅',
  'B',
  'The common elements are 2 and 3.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_015',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_015';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["{1,4}","{2,3}","{1,2,3,4}","∅"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_015';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Intersection means elements present in both sets.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_015';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,15,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_015'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 16. MATHEMATICS | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_016',
  'medium',
  'If f(x)=2x-1, then f⁻¹(7) is:',
  '3','4','5','7',
  'B',
  'Solve 2x-1=7, giving x=4.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_003'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_016',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_016';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["3","4","5","7"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_016';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'To evaluate the inverse at 7, ask which input maps to 7.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_016';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,16,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_016'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 17. MATHEMATICS | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_017',
  'medium',
  'For f(x)=|x|, which statement is true on R?',
  'One-one and onto','One-one only','Onto only','Neither one-one nor onto',
  'D',
  'f is not one-one because f(1)=f(-1), and it is not onto R because outputs are nonnegative.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_004'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_017',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_017';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["One-one and onto","One-one only","Onto only","Neither one-one nor onto"]','["D"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_017';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Check injectivity using x and -x, then inspect the range.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_017';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,17,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_017'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 18. MATHEMATICS | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_018',
  'medium',
  'The roots of x²-7x+12=0 are:',
  '2,6','3,4','1,12','-3,-4',
  'B',
  'x²-7x+12=(x-3)(x-4).',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_018',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_018';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["2,6","3,4","1,12","-3,-4"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_018';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Look for two numbers whose product is 12 and sum is 7.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_018';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,18,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_018'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 19. MATHEMATICS | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_019',
  'medium',
  'If α,β are roots of x²-5x+6=0, then α²+β² equals:',
  '13','17','25','31',
  'A',
  'α+β=5 and αβ=6; α²+β²=(α+β)²-2αβ=25-12=13.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_003'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_019',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_019';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["13","17","25","31"]','["A"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_019';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Use sum and product of roots instead of solving for the roots.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_019';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,19,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_019'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 20. MATHEMATICS | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_020',
  'medium',
  'For z=3+4i, |z| equals:',
  '3','4','5','7',
  'C',
  '|z|=√(3²+4²)=5.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_004'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_020',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_020';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["3","4","5","7"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_020';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Treat the real and imaginary parts as perpendicular components.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_020';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,20,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_020'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 21. MATHEMATICS | NUMERICAL | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_021',
  'medium',
  'If f(x)=4x-3 and f(a)=29, enter a.',
  '8','','','',
  'A',
  '4a-3=29, so 4a=32 and a=8.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_01'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_021',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_021';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'NUMERIC_ENTRY','NONE',NULL,NULL,
       NULL,'["8"]',0,0.000001,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_021';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Set the function equal to the given output and solve the resulting linear equation.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_021';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,21,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_021'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 22. MATHEMATICS | NUMERICAL | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_022',
  'medium',
  'The sum of the first 10 positive integers is:',
  '55','','','',
  'A',
  '10·11/2=55.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_02'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_022',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_022';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'NUMERIC_ENTRY','NONE',NULL,NULL,
       NULL,'["55"]',0,0.000001,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_022';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Use the formula n(n+1)/2.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_022';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,22,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_022'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 23. MATHEMATICS | NUMERICAL | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_023',
  'medium',
  'If the area of a circle is 49π, enter its radius.',
  '7','','','',
  'A',
  'πr²=49π, so r=7.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_03'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_023',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_023';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'NUMERIC_ENTRY','NONE',NULL,NULL,
       NULL,'["7"]',0,0.000001,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_023';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Cancel π first and solve for the positive radius.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_023';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,23,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_023'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 24. MATHEMATICS | NUMERICAL | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_024',
  'medium',
  'For x²-9x+20=0, enter the larger root.',
  '5','','','',
  'A',
  '(x-4)(x-5)=0, so the larger root is 5.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_04'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_024',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_024';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'NUMERIC_ENTRY','NONE',NULL,NULL,
       NULL,'["5"]',0,0.000001,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_024';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Factor the quadratic into two integer factors of 20 whose sum is 9.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_024';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,24,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_024'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 25. MATHEMATICS | NUMERICAL | challenge

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_025',
  'challenge',
  'If vectors a=(2,1,-1) and b=(1,3,2), enter a·b.',
  '3','','','',
  'A',
  'a·b=2·1+1·3+(-1)·2=3.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_MATH_QT1_NUM_05'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED',
       'GUIDED_TEST1_MATHEMATICS_025',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_025';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'NUMERIC_ENTRY','NONE',NULL,NULL,
       NULL,'["3"]',0,0.000001,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_025';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Multiply corresponding components, including the sign of the last component.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_025';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,25,'MATHEMATICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_025'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 26. PHYSICS | SINGLE_CHOICE | challenge

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_026',
  'challenge',
  'A measured length is (2.50±0.02) m. The percentage uncertainty is closest to:',
  '0.2%','0.8%','2%','8%',
  'B',
  'Percentage uncertainty=(0.02/2.50)×100=0.8%.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_005'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_026',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_026';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["0.2%","0.8%","2%","8%"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_026';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Divide the absolute uncertainty by the measured value before multiplying by 100.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_026';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,26,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_026'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 27. PHYSICS | SINGLE_CHOICE | challenge

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_027',
  'challenge',
  'A particle starts from rest with constant acceleration 4 m/s². Its displacement in the 3rd second is:',
  '6 m','8 m','10 m','12 m',
  'C',
  'Distance in nth second = u+a(n-1/2)=0+4(2.5)=10 m.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_005'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_027',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_027';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["6 m","8 m","10 m","12 m"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_027';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Use the displacement-in-the-nth-second relation rather than total displacement after 3 s.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_027';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,27,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_027'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 28. PHYSICS | SINGLE_CHOICE | challenge

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_028',
  'challenge',
  'A 2 kg block on a smooth horizontal surface is acted on by a 10 N force. Its acceleration is:',
  '2','5','10','20',
  'B',
  'a=F/m=10/2=5 m/s².',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_005'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_028',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_028';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["2","5","10","20"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_028';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Apply Newton''s second law to the net horizontal force.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_028';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,28,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_028'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 29. PHYSICS | SINGLE_CHOICE | challenge

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_029',
  'challenge',
  'A 1 kg body moving at 6 m/s is brought to rest by a constant 3 N force. The stopping distance is:',
  '3 m','6 m','9 m','12 m',
  'B',
  'a=-3 m/s²; 0=36-6s gives s=6 m.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_005'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_029',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_029';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["3 m","6 m","9 m","12 m"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_029';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Use v²=u²+2as so that time is unnecessary.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_029';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,29,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_029'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 30. PHYSICS | SINGLE_CHOICE | challenge

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_030',
  'challenge',
  'For a solid sphere rolling without slipping, the ratio K_rot/K_trans is:',
  '2/5','5/2','2/7','7/2',
  'A',
  'K_rot/K_trans=I/(MR²)=2/5 for a solid sphere.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_005'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_030',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_030';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["2/5","5/2","2/7","7/2"]','["A"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_030';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'For rolling, write both kinetic energies and use I=(2/5)MR².','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_030';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,30,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_030'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 31. PHYSICS | SINGLE_CHOICE | easy

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_031',
  'easy',
  'At height h above Earth''s surface, for h≪R, g is approximately:',
  'g(1-h/R)','g(1-2h/R)','g(1+h/R)','g(1+2h/R)',
  'B',
  'g_h=g(R/(R+h))²≈g(1-2h/R).',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_031',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_031';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["g(1-h/R)","g(1-2h/R)","g(1+h/R)","g(1+2h/R)"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_031';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Expand (1+h/R)^-2 to first order.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_031';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,31,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_031'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 32. PHYSICS | SINGLE_CHOICE | easy

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_032',
  'easy',
  'Young''s modulus has the same dimensions as:',
  'strain','pressure','energy','power',
  'B',
  'Young''s modulus=stress/strain; strain is dimensionless, so its dimensions are pressure.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_032',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_032';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["strain","pressure","energy","power"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_032';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Strain is dimensionless, so focus on the dimensions of stress.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_032';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,32,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_032'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 33. PHYSICS | SINGLE_CHOICE | easy

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_033',
  'easy',
  'For an ideal gas in an isothermal process, ΔU is:',
  'positive','negative','zero','path dependent',
  'C',
  'Internal energy of an ideal gas depends only on temperature; isothermal means ΔT=0.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_033',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_033';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["positive","negative","zero","path dependent"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_033';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Ask which state variable determines the internal energy of an ideal gas.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_033';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,33,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_033'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 34. PHYSICS | SINGLE_CHOICE | easy

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_034',
  'easy',
  'The rms speed of gas molecules is proportional to:',
  'T','1/T','√T','1/√T',
  'C',
  'v_rms=√(3RT/M), hence proportional to √T.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_034',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_034';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["T","1/T","√T","1/√T"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_034';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Recall the temperature dependence inside the square root in the rms-speed expression.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_034';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,34,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_034'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 35. PHYSICS | SINGLE_CHOICE | easy

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_035',
  'easy',
  'For SHM x=A cosωt, the maximum speed is:',
  'A/ω','Aω','Aω²','ω/A',
  'B',
  'v=-Aω sinωt, so |v|max=Aω.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_035',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_035';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["A/ω","Aω","Aω²","ω/A"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_035';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Differentiate displacement once with respect to time.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_035';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,35,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_035'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 36. PHYSICS | SINGLE_CHOICE | easy

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_036',
  'easy',
  'Electric field inside a conductor in electrostatic equilibrium is:',
  'zero','constant nonzero','infinite','dependent on shape only',
  'A',
  'Free charges rearrange until the internal electrostatic field becomes zero.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_036',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_036';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["zero","constant nonzero","infinite","dependent on shape only"]','["A"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_036';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Think about what would happen to free charges if a nonzero field remained.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_036';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,36,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_036'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 37. PHYSICS | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_037',
  'medium',
  'Two resistors 6 Ω and 3 Ω in parallel have equivalent resistance:',
  '1 Ω','2 Ω','3 Ω','9 Ω',
  'B',
  '1/R=1/6+1/3=1/2, so R=2 Ω.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_037',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_037';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["1 Ω","2 Ω","3 Ω","9 Ω"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_037';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'For a parallel pair, add reciprocals rather than resistances.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_037';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,37,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_037'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 38. PHYSICS | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_038',
  'medium',
  'A charge q moving with velocity v parallel to a uniform magnetic field B experiences force:',
  'qvB','qvB/2','zero','qB/v',
  'C',
  'F=qvB sinθ and θ=0, so F=0.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_038',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_038';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["qvB","qvB/2","zero","qB/v"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_038';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'The magnetic force depends on the sine of the angle between velocity and field.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_038';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,38,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_038'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 39. PHYSICS | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_039',
  'medium',
  'For a sinusoidal voltage V=V₀ sinωt, the rms value is:',
  'V₀','V₀/2','V₀/√2','√2V₀',
  'C',
  'V_rms=V₀/√2.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_039',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_039';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["V₀","V₀/2","V₀/√2","√2V₀"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_039';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Relate peak and rms values for a sine wave.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_039';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,39,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_039'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 40. PHYSICS | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_040',
  'medium',
  'Which electromagnetic radiation has the highest frequency?',
  'Radio waves','Microwaves','Visible light','Gamma rays',
  'D',
  'Gamma rays occupy the highest-frequency end of the electromagnetic spectrum.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_040',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_040';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["Radio waves","Microwaves","Visible light","Gamma rays"]','["D"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_040';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Order the electromagnetic spectrum from long wavelength to short wavelength.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_040';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,40,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_040'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 41. PHYSICS | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_041',
  'medium',
  'A convex lens has focal length 20 cm. Its power is:',
  '+2 D','+5 D','-2 D','-5 D',
  'B',
  'f=0.20 m; P=1/f=+5 D.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_041',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_041';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["+2 D","+5 D","-2 D","-5 D"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_041';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Convert focal length to metres before taking the reciprocal.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_041';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,41,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_041'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 42. PHYSICS | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_042',
  'medium',
  'In the photoelectric effect, increasing light intensity at fixed frequency above threshold mainly increases:',
  'maximum kinetic energy','stopping potential','photoelectron count','threshold frequency',
  'C',
  'Higher intensity means more photons per unit time and therefore more emitted electrons; kinetic energy depends on frequency.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_042',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_042';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["maximum kinetic energy","stopping potential","photoelectron count","threshold frequency"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_042';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Separate the roles of photon energy (frequency) and photon number (intensity).','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_042';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,42,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_042'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 43. PHYSICS | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_043',
  'medium',
  'The binding energy per nucleon is greatest approximately near:',
  'hydrogen','iron','uranium','helium only',
  'B',
  'The binding-energy-per-nucleon curve peaks near iron/nickel.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_043',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_043';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["hydrogen","iron","uranium","helium only"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_043';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Recall where the binding-energy curve reaches its broad maximum.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_043';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,43,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_043'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 44. PHYSICS | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_044',
  'medium',
  'In an n-type semiconductor, the majority carriers are:',
  'holes','electrons','protons','ions',
  'B',
  'Donor impurities contribute extra electrons.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_044',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_044';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["holes","electrons","protons","ions"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_044';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Think about what a pentavalent donor contributes to silicon or germanium.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_044';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,44,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_044'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 45. PHYSICS | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_045',
  'medium',
  'A screw gauge has pitch 0.5 mm and 50 divisions on its circular scale. Its least count is:',
  '0.1 mm','0.01 mm','0.001 mm','0.025 mm',
  'B',
  'Least count=pitch/divisions=0.5/50=0.01 mm.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_045',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_045';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["0.1 mm","0.01 mm","0.001 mm","0.025 mm"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_045';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Divide one pitch by the number of circular-scale divisions.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_045';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,45,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_045'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 46. PHYSICS | NUMERICAL | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_046',
  'medium',
  'A car accelerates uniformly from 10 m/s to 30 m/s in 5 s. Enter its acceleration in m/s².',
  '4','','','',
  'A',
  'a=(30-10)/5=4 m/s².',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_01'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_046',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_046';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'NUMERIC_ENTRY','NONE',NULL,NULL,
       NULL,'["4"]',0,0.000001,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_046';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Use change in velocity divided by elapsed time.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_046';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,46,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_046'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 47. PHYSICS | NUMERICAL | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_047',
  'medium',
  'A 5 kg block has momentum 40 kg·m/s. Enter its speed in m/s.',
  '8','','','',
  'A',
  'v=p/m=40/5=8 m/s.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_02'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_047',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_047';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'NUMERIC_ENTRY','NONE',NULL,NULL,
       NULL,'["8"]',0,0.000001,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_047';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Momentum is mass times velocity.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_047';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,47,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_047'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 48. PHYSICS | NUMERICAL | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_048',
  'medium',
  'A 2 μF capacitor is charged to 10 V. Enter the magnitude of charge in μC.',
  '20','','','',
  'A',
  'Q=CV=2 μF×10 V=20 μC.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_03'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_048',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_048';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'NUMERIC_ENTRY','NONE',NULL,NULL,
       NULL,'["20"]',0,0.000001,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_048';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Use Q=CV; the micro-prefix remains consistent in μF and μC.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_048';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,48,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_048'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 49. PHYSICS | NUMERICAL | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_049',
  'medium',
  'A wave has frequency 50 Hz and wavelength 4 m. Enter its speed in m/s.',
  '200','','','',
  'A',
  'v=fλ=50×4=200 m/s.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_04'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_049',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_049';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'NUMERIC_ENTRY','NONE',NULL,NULL,
       NULL,'["200"]',0,0.000001,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_049';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Wave speed is frequency times wavelength.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_049';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,49,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_049'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 50. PHYSICS | NUMERICAL | challenge

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_050',
  'challenge',
  'A 100 W device operates for 20 s. Enter the energy used in joules.',
  '2000','','','',
  'A',
  'E=Pt=100×20=2000 J.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_PHYSICS_QT1_NUM_05'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED',
       'GUIDED_TEST1_PHYSICS_050',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_050';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'NUMERIC_ENTRY','NONE',NULL,NULL,
       NULL,'["2000"]',0,0.000001,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_050';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Power is energy per unit time.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_050';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,50,'PHYSICS',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_050'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 51. CHEMISTRY | SINGLE_CHOICE | challenge

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_051',
  'challenge',
  '0.5 mol of O₂ contains how many oxygen atoms?',
  '0.5N_A','N_A','2N_A','4N_A',
  'B',
  '0.5 mol O₂ contains 0.5N_A molecules and 2 atoms per molecule, giving N_A atoms.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_BASIC_CONCEPTS_005'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_051',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_051';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["0.5N_A","N_A","2N_A","4N_A"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_051';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Convert moles to molecules first, then account for atoms per molecule.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_051';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,51,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_051'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 52. CHEMISTRY | SINGLE_CHOICE | challenge

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_052',
  'challenge',
  'At the same T and P, equal volumes of ideal gases contain:',
  'equal masses','equal numbers of molecules','equal densities','equal molar masses',
  'B',
  'Avogadro''s law states that equal gas volumes at the same T and P contain equal numbers of molecules.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_STATES_OF_MATTER_005'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_052',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_052';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["equal masses","equal numbers of molecules","equal densities","equal molar masses"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_052';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Recall Avogadro''s law rather than comparing molar masses.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_052';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,52,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_052'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 53. CHEMISTRY | SINGLE_CHOICE | challenge

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_053',
  'challenge',
  'For a hydrogen atom, the energy of the electron in the n=2 level is:',
  '-13.6 eV','-6.8 eV','-3.4 eV','-1.51 eV',
  'C',
  'E_n=-13.6/n²=-13.6/4=-3.4 eV.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_ATOMIC_STRUCTURE_005'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_053',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_053';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["-13.6 eV","-6.8 eV","-3.4 eV","-1.51 eV"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_053';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Use the 1/n² dependence of the Bohr energy levels.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_053';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,53,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_053'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 54. CHEMISTRY | SINGLE_CHOICE | challenge

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_054',
  'challenge',
  'Which molecule is linear?',
  'H₂O','NH₃','CO₂','SO₂',
  'C',
  'CO₂ has two electron domains around carbon and no lone pair on the central atom, giving a linear shape.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_BONDING_005'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_054',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_054';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["H₂O","NH₃","CO₂","SO₂"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_054';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Count electron domains around the central atom and consider lone pairs.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_054';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,54,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_054'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 55. CHEMISTRY | SINGLE_CHOICE | challenge

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_055',
  'challenge',
  'For an exothermic reaction at constant pressure, ΔH is:',
  'positive','negative','zero','always equal to ΔS',
  'B',
  'Heat is released by the system, so its enthalpy change is negative.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_THERMODYNAMICS_005'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_055',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_055';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["positive","negative","zero","always equal to ΔS"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_055';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Use the sign convention for heat released by the system.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_055';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,55,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_055'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 56. CHEMISTRY | SINGLE_CHOICE | easy

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_056',
  'easy',
  'For a weak acid HA, decreasing the solution concentration generally makes its percentage ionization:',
  'decrease','increase','unchanged','zero',
  'B',
  'Dilution shifts a weak electrolyte toward greater fractional ionization (Ostwald dilution law).',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_EQUILIBRIUM_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_056',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_056';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["decrease","increase","unchanged","zero"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_056';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Think about how dilution affects the fraction, not the absolute concentration, that ionizes.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_056';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,56,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_056'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 57. CHEMISTRY | SINGLE_CHOICE | easy

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_057',
  'easy',
  'In a galvanic cell, oxidation occurs at the:',
  'cathode','anode','salt bridge','electrolyte only',
  'B',
  'Oxidation always occurs at the anode.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_REDOX_ELECTROCHEMISTRY_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_057',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_057';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["cathode","anode","salt bridge","electrolyte only"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_057';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Use the mnemonic: AnOx, RedCat.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_057';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,57,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_057'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 58. CHEMISTRY | SINGLE_CHOICE | easy

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_058',
  'easy',
  'For a first-order reaction, the half-life is:',
  'proportional to initial concentration','inversely proportional to initial concentration','independent of initial concentration','zero',
  'C',
  't₁/₂=ln2/k, independent of the initial concentration.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_CHEMICAL_KINETICS_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_058',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_058';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["proportional to initial concentration","inversely proportional to initial concentration","independent of initial concentration","zero"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_058';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Write the first-order half-life expression in terms of k.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_058';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,58,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_058'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 59. CHEMISTRY | SINGLE_CHOICE | easy

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_059',
  'easy',
  'In an fcc crystal, the number of atoms per unit cell is:',
  '1','2','4','6',
  'C',
  '8 corners contribute 1 atom total and 6 faces contribute 3, for a total of 4.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLID_STATE_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_059',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_059';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["1","2","4","6"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_059';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Add the fractional contributions from corners and face centres.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_059';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,59,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_059'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 60. CHEMISTRY | SINGLE_CHOICE | easy

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_060',
  'easy',
  'For an ideal solution, ΔH_mix is:',
  'positive','negative','zero','infinite',
  'C',
  'Ideal solutions have ΔH_mix=0 and ΔV_mix=0.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_SOLUTIONS_001'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_060',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_060';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["positive","negative","zero","infinite"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_060';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Recall the defining thermodynamic conditions for ideal mixing.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_060';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,60,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_060'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 61. CHEMISTRY | SINGLE_CHOICE | easy

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_061',
  'easy',
  'A catalyst increases reaction rate mainly by:',
  'increasing ΔH','lowering activation energy','increasing equilibrium constant','raising product energy',
  'B',
  'A catalyst provides an alternative pathway with lower activation energy.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_SURFACE_CHEMISTRY_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_061',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_061';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["increasing ΔH","lowering activation energy","increasing equilibrium constant","raising product energy"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_061';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Focus on the energy barrier, not the energies of reactants and products.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_061';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,61,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_061'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 62. CHEMISTRY | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_062',
  'medium',
  'Across a period, atomic radius generally:',
  'increases','decreases','remains constant','first decreases then always doubles',
  'B',
  'Increasing effective nuclear charge pulls electrons closer across a period.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_PERIODICITY_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_062',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_062';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["increases","decreases","remains constant","first decreases then always doubles"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_062';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Compare the change in nuclear charge with shielding across the same shell.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_062';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,62,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_062'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 63. CHEMISTRY | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_063',
  'medium',
  'NaH is best classified as:',
  'covalent hydride','ionic hydride','interstitial hydride','metallic hydride',
  'B',
  'NaH consists predominantly of Na⁺ and H⁻ and is an ionic (saline) hydride.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROGEN_S_BLOCK_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_063',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_063';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["covalent hydride","ionic hydride","interstitial hydride","metallic hydride"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_063';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Consider the strongly electropositive nature of sodium.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_063';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,63,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_063'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 64. CHEMISTRY | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_064',
  'medium',
  'The oxidation state of sulfur in H₂SO₄ is:',
  '+4','+5','+6','+7',
  'C',
  '2(+1)+S+4(-2)=0 gives S=+6.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_P_BLOCK_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_064',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_064';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["+4","+5","+6","+7"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_064';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Assign H=+1 and O=-2, then impose charge balance.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_064';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,64,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_064'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 65. CHEMISTRY | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_065',
  'medium',
  'KMnO₄ contains Mn in oxidation state:',
  '+2','+4','+6','+7',
  'D',
  'K is +1 and four O contribute -8, so Mn must be +7.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_D_F_BLOCK_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_065',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_065';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["+2","+4","+6","+7"]','["D"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_065';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Balance the total oxidation numbers to zero.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_065';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,65,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_065'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 66. CHEMISTRY | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_066',
  'medium',
  'The coordination number of Co in [Co(NH₃)₆]³⁺ is:',
  '3','4','6','9',
  'C',
  'Six monodentate NH₃ ligands are directly bonded to cobalt.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_COORDINATION_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_066',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_066';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["3","4","6","9"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_066';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Count donor atoms directly attached to the central metal.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_066';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,66,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_066'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 67. CHEMISTRY | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_067',
  'medium',
  'In the blast furnace, limestone mainly acts as a:',
  'reducing agent','flux','fuel','catalyst',
  'B',
  'CaCO₃ forms CaO, which reacts with silica impurity to form slag; it acts as a flux.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_METALLURGY_QUALITATIVE_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_067',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_067';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["reducing agent","flux","fuel","catalyst"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_067';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Ask what removes acidic silica impurity from the ore.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_067';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,67,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_067'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 68. CHEMISTRY | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_068',
  'medium',
  'A major greenhouse gas among the following is:',
  'N₂','O₂','CO₂','He',
  'C',
  'CO₂ absorbs outgoing infrared radiation and contributes to the greenhouse effect.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_ENVIRONMENTAL_CHEMISTRY_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_068',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_068';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["N₂","O₂","CO₂","He"]','["C"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_068';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Which option strongly absorbs terrestrial infrared radiation?','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_068';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,68,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_068'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 69. CHEMISTRY | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_069',
  'medium',
  'The most stable carbocation among these is:',
  'CH₃⁺','primary','secondary','tertiary',
  'D',
  'Alkyl groups stabilize carbocations through hyperconjugation and inductive effects; tertiary is most stabilized.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_PRINCIPLES_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_069',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_069';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["CH₃⁺","primary","secondary","tertiary"]','["D"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_069';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Compare how many alkyl groups can stabilize the positive carbon.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_069';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,69,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_069'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 70. CHEMISTRY | SINGLE_CHOICE | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_070',
  'medium',
  'Addition of HBr to propene in the absence of peroxide gives mainly:',
  '1-bromopropane','2-bromopropane','1,2-dibromopropane','propane',
  'B',
  'Markovnikov addition forms the more stable secondary carbocation and gives 2-bromopropane.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_HYDROCARBONS_002'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','SINGLE_CHOICE','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_070',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_070';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'SINGLE_CHOICE','NONE',NULL,NULL,
       '["1-bromopropane","2-bromopropane","1,2-dibromopropane","propane"]','["B"]',0,NULL,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_070';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Identify which protonation route produces the more stable carbocation intermediate.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_070';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,70,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_070'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 71. CHEMISTRY | NUMERICAL | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_071',
  'medium',
  'Enter the number of moles in 44 g of CO₂. (Molar mass 44 g/mol)',
  '1','','','',
  'A',
  'n=m/M=44/44=1 mol.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_01'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_071',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_071';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'NUMERIC_ENTRY','NONE',NULL,NULL,
       NULL,'["1"]',0,0.000001,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_071';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Use moles = given mass / molar mass.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_071';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,71,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_071'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 72. CHEMISTRY | NUMERICAL | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_072',
  'medium',
  'For a solution with [H⁺]=1×10⁻³ mol/L, enter the pH.',
  '3','','','',
  'A',
  'pH=-log(10⁻³)=3.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_02'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_072',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_072';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'NUMERIC_ENTRY','NONE',NULL,NULL,
       NULL,'["3"]',0,0.000001,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_072';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Use pH=-log₁₀[H⁺].','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_072';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,72,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_072'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 73. CHEMISTRY | NUMERICAL | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_073',
  'medium',
  'A first-order reaction has k=0.693 min⁻¹. Enter its half-life in minutes.',
  '1','','','',
  'A',
  't₁/₂=0.693/k=1 min.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_03'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_073',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_073';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'NUMERIC_ENTRY','NONE',NULL,NULL,
       NULL,'["1"]',0,0.000001,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_073';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'For first order, use t₁/₂=0.693/k.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_073';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,73,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_073'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 74. CHEMISTRY | NUMERICAL | medium

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_074',
  'medium',
  'Enter the oxidation state of Cr in K₂Cr₂O₇.',
  '6','','','',
  'A',
  '2(+1)+2x+7(-2)=0 gives 2x=12, so x=+6.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_04'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_074',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_074';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'NUMERIC_ENTRY','NONE',NULL,NULL,
       NULL,'["6"]',0,0.000001,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_074';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Let the chromium oxidation state be x and impose overall charge neutrality.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_074';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,74,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_074'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


-- 75. CHEMISTRY | NUMERICAL | challenge

INSERT OR IGNORE INTO education_questions
(subtopic_id,question_key,difficulty,question_text,
 choice_a,choice_b,choice_c,choice_d,
 correct_choice,explanation,active,source_type)
SELECT
  anchor.subtopic_id,
  'IN_PROGRAM_JEE_GUIDED_T1_V2_075',
  'challenge',
  'A solution contains 0.20 mol solute in a total volume of 0.50 L. Enter its molarity.',
  '0.4','','','',
  'A',
  'M=n/V=0.20/0.50=0.40 mol/L.',
  1,
  'gyan-guided-test1-v2'
FROM education_questions anchor
WHERE anchor.question_key='IN_PROGRAM_JEE_CHEMISTRY_QT1_NUM_05'
LIMIT 1;

INSERT OR REPLACE INTO education_question_metadata
(question_id,exam_level,question_format,syllabus_version,
 quality_status,archetype_code,source_note)
SELECT q.id,'MAIN','NUMERICAL','JEE_2026','REVIEWED',
       'GUIDED_TEST1_CHEMISTRY_075',
       'GYAN JEE Main Guided Test 1 v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_075';

INSERT OR REPLACE INTO education_question_response_details
(question_id,response_type,stimulus_type,stimulus_text,directions_text,
 choices_json,correct_answers_json,blank_count,numeric_tolerance,
 calculator_allowed,updated_at)
SELECT q.id,'NUMERIC_ENTRY','NONE',NULL,NULL,
       NULL,'["0.4"]',0,0.000001,0,CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_075';

INSERT OR REPLACE INTO education_question_guidance
(question_id,tip_text,tip_status,tip_version,source_note,updated_at)
SELECT q.id,'Molarity is moles of solute divided by litres of solution.','READY',1,'guided-test1-v2',CURRENT_TIMESTAMP
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_075';

INSERT INTO education_mock_test_questions
(mock_test_id,question_id,question_order,section_code,
 marks_correct,marks_incorrect,marks_unanswered)
SELECT mt.id,q.id,75,'CHEMISTRY',4,-1,0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_GUIDED_T1_V2_075'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
  AND q.active=1;


UPDATE education_mock_tests
SET published=1,
    updated_at=CURRENT_TIMESTAMP
WHERE program_code='JEE'
  AND test_kind='FULL'
  AND test_code='TEST_1'
  AND exam_level='MAIN'
  AND version=1;

-- Verification
SELECT
  mt.program_code,mt.test_code,mt.exam_level,COUNT(*) AS questions,
  SUM(CASE WHEN q.difficulty='easy' THEN 1 ELSE 0 END) AS easy,
  SUM(CASE WHEN q.difficulty='medium' THEN 1 ELSE 0 END) AS medium,
  SUM(CASE WHEN q.difficulty='challenge' THEN 1 ELSE 0 END) AS challenge,
  SUM(CASE WHEN g.tip_status='READY' AND COALESCE(g.tip_text,'')<>'' THEN 1 ELSE 0 END) AS tips
FROM education_mock_tests mt
JOIN education_mock_test_questions mtq ON mtq.mock_test_id=mt.id
JOIN education_questions q ON q.id=mtq.question_id
LEFT JOIN education_question_guidance g ON g.question_id=q.id
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='MAIN'
  AND mt.version=1
GROUP BY mt.id;
