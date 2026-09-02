-- GYAN IIT-JEE rebuild Phase 2A
-- 0074_jee_math_topic_starters.sql
-- 5 distinct starter questions for each new JEE Mathematics topic.
PRAGMA foreign_keys = ON;

-- SETS_RELATIONS_FUNCTIONS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_001', 'easy', 'If A = {1,2,3} and B = {2,3,4}, what is A ∩ B?',
'{1,2}', '{2,3}', '{3,4}', '{1,4}',
'B', 'The intersection contains elements common to both sets: 2 and 3.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_STARTER_01', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_002', 'medium', 'Let f(x)=2x+3. If f(a)=11, what is a?',
'3', '4', '5', '7',
'B', 'Solve 2a+3=11, so 2a=8 and a=4.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_STARTER_02', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_003', 'medium', 'If n(A)=18, n(B)=15 and n(A ∩ B)=7, what is n(A ∪ B)?',
'26', '33', '40', '10',
'A', 'Use n(A∪B)=n(A)+n(B)-n(A∩B)=18+15-7=26.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_STARTER_03', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_004', 'medium', 'Which relation on the integers is an equivalence relation?',
'aRb iff a<b', 'aRb iff a-b is even', 'aRb iff a+b=1', 'aRb iff a=2b',
'B', 'Having an even difference is reflexive, symmetric and transitive.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_STARTER_04', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_005', 'challenge', 'For f(x)=(x-1)/(x+2), which value is excluded from the domain?',
'-2', '-1', '1', '2',
'A', 'The denominator must be nonzero, so x≠-2.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_STARTER_05', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_005';

-- COMPLEX_QUADRATIC
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_001', 'easy', 'What is i^2?',
'1', '-1', 'i', '-i',
'B', 'By definition, i²=-1.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_STARTER_01', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_002', 'medium', 'If z=3+4i, what is |z|?',
'3', '4', '5', '7',
'C', '|z|=sqrt(3²+4²)=5.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_STARTER_02', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_003', 'medium', 'The roots of x²-5x+6=0 are:',
'1 and 6', '2 and 3', '-2 and -3', '3 and 6',
'B', 'x²-5x+6=(x-2)(x-3).', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_STARTER_03', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_004', 'medium', 'If one root of x²+px+9=0 is 3, what is p?',
'-6', '6', '-3', '3',
'A', 'Substitute x=3: 9+3p+9=0, hence p=-6.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_STARTER_04', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_005', 'challenge', 'For z=(1+i)/(1-i), z equals:',
'1', '-1', 'i', '-i',
'C', 'Multiply numerator and denominator by 1+i: (1+i)²/2=i.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_STARTER_05', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_005';

-- MATRICES_DETERMINANTS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_001', 'easy', 'What is det([[2,0],[0,3]])?',
'5', '6', '0', '-6',
'B', 'For a diagonal 2×2 matrix, determinant is 2×3=6.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_STARTER_01', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_002', 'medium', 'If A=[[1,2],[3,4]], what is tr(A)?',
'4', '5', '6', '10',
'B', 'The trace is the sum of diagonal entries: 1+4=5.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_STARTER_02', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_003', 'medium', 'For A=[[1,2],[2,4]], det(A) is:',
'0', '2', '4', '8',
'A', 'det(A)=1·4-2·2=0.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_STARTER_03', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_004', 'medium', 'If det(A)=5 for a 2×2 matrix, what is det(3A)?',
'15', '30', '45', '5',
'C', 'For a 2×2 matrix, det(kA)=k²det(A)=9×5=45.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_STARTER_04', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_005', 'challenge', 'The inverse of [[1,0],[0,2]] is:',
'[[1,0],[0,1/2]]', '[[1,0],[0,2]]', '[[2,0],[0,1]]', '[[1/2,0],[0,1]]',
'A', 'The inverse of a diagonal matrix has reciprocal diagonal entries.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_STARTER_05', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_005';

-- PERMUTATIONS_COMBINATIONS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_001', 'easy', 'How many ways can 4 distinct books be arranged on a shelf?',
'4', '12', '24', '16',
'C', 'The number of arrangements is 4!=24.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_STARTER_01', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_002', 'medium', 'How many ways can 2 students be chosen from 5 students?',
'10', '20', '25', '5',
'A', 'The count is C(5,2)=10.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_STARTER_02', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_003', 'medium', 'How many 3-digit numbers can be formed from 1,2,3,4 without repetition?',
'12', '24', '64', '6',
'B', 'Choose and arrange 3 of 4 digits: P(4,3)=4·3·2=24.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_STARTER_03', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_004', 'medium', 'How many distinct arrangements does the word LEVEL have?',
'120', '60', '30', '20',
'C', 'LEVEL has 5 letters with L repeated twice and E repeated twice: 5!/(2!2!)=30.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_STARTER_04', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_005', 'challenge', 'From 6 men and 4 women, how many 3-person committees contain exactly 2 women?',
'24', '36', '60', '90',
'B', 'Choose 2 of 4 women and 1 of 6 men: C(4,2)C(6,1)=6×6=36.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_STARTER_05', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_005';

-- BINOMIAL_THEOREM
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_001', 'easy', 'In (1+x)^5, the coefficient of x is:',
'1', '5', '10', '25',
'B', 'The coefficient of x is C(5,1)=5.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_STARTER_01', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_002', 'medium', 'The coefficient of x² in (1+x)^6 is:',
'6', '12', '15', '20',
'C', 'The coefficient is C(6,2)=15.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_STARTER_02', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_003', 'medium', 'The middle term coefficient in (1+x)^4 is:',
'4', '6', '8', '10',
'B', 'The middle term is C(4,2)x², with coefficient 6.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_STARTER_03', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_004', 'medium', 'The constant term in (x+1/x)^4 is:',
'4', '6', '8', '12',
'B', 'For x^(4-2r) to be x^0, r=2; coefficient C(4,2)=6.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_STARTER_04', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_005', 'challenge', 'The coefficient of x³ in (1+2x)^5 is:',
'40', '60', '80', '120',
'C', 'Coefficient = C(5,3)·2³ = 10·8 = 80.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_STARTER_05', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_005';

-- SEQUENCES_SERIES
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_001', 'easy', 'For the AP 3,7,11,..., the common difference is:',
'3', '4', '7', '8',
'B', 'Each term increases by 4.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_STARTER_01', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_002', 'medium', 'The 10th term of the AP 2,5,8,... is:',
'27', '29', '30', '32',
'B', 'a10=2+(10-1)·3=29.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_STARTER_02', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_003', 'medium', 'The sum of the first 10 positive integers is:',
'45', '50', '55', '60',
'C', '10·11/2=55.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_STARTER_03', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_004', 'medium', 'For the GP 2,6,18,..., the common ratio is:',
'2', '3', '6', '9',
'B', 'Each term is multiplied by 3.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_STARTER_04', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_005', 'challenge', 'If a,b,c are consecutive terms of a GP and a=4, c=36 with b>0, then b is:',
'8', '10', '12', '18',
'C', 'For consecutive GP terms, b²=ac=144, so b=12.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_STARTER_05', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_005';

-- LIMITS_CONTINUITY_DIFFERENTIABILITY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_001', 'easy', 'lim(x→2) (x+3) equals:',
'2', '3', '5', '6',
'C', 'Polynomials are continuous, so substitute x=2.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_STARTER_01', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_002', 'medium', 'lim(x→0) sin x / x equals:',
'0', '1', '-1', 'Does not exist',
'B', 'This is the standard trigonometric limit.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_STARTER_02', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_003', 'medium', 'If f(x)=x², then f''(3) is:',
'3', '6', '9', '12',
'B', 'f''(x)=2x, hence f''(3)=6.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_STARTER_03', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_004', 'medium', 'For f(x)=|x|, f is not differentiable at:',
'-1', '0', '1', '2',
'B', 'Left and right derivatives at 0 are -1 and +1.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_STARTER_04', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_005', 'challenge', 'lim(x→1) (x²-1)/(x-1) equals:',
'0', '1', '2', 'Does not exist',
'C', 'Factor x²-1=(x-1)(x+1), then limit is 2.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_STARTER_05', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_005';

-- INTEGRAL_CALCULUS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_001', 'easy', '∫ 2x dx equals:',
'x²+C', '2x²+C', 'x+C', '2+C',
'A', 'The antiderivative of 2x is x²+C.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_STARTER_01', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_002', 'medium', '∫₀¹ x dx equals:',
'1', '1/2', '1/3', '2',
'B', '[x²/2]₀¹=1/2.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_STARTER_02', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_003', 'medium', '∫ cos x dx equals:',
'-sin x+C', 'sin x+C', 'cos x+C', '-cos x+C',
'B', 'The derivative of sin x is cos x.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_STARTER_03', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_004', 'medium', '∫₁² 1/x dx equals:',
'1', 'ln 2', '2 ln 2', '1/2',
'B', 'The antiderivative is ln x, giving ln2-ln1=ln2.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_STARTER_04', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_005', 'challenge', 'The area under y=x² from x=0 to x=2 is:',
'4/3', '8/3', '4', '8',
'B', '∫₀²x²dx=[x³/3]₀²=8/3.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_STARTER_05', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_005';

-- DIFFERENTIAL_EQUATIONS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_001', 'easy', 'If dy/dx=3 and y(0)=2, then y equals:',
'3x+2', '2x+3', '3x', 'x+2',
'A', 'Integrate dy/dx=3 to get y=3x+C; y(0)=2 gives C=2.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_STARTER_01', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_002', 'medium', 'The general solution of dy/dx=2x is:',
'y=2x+C', 'y=x²+C', 'y=x+C', 'y=2x²+C',
'B', 'Integrating 2x gives x²+C.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_STARTER_02', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_003', 'medium', 'For dy/dx=y, which function is a solution?',
'y=x', 'y=x²', 'y=e^x', 'y=ln x',
'C', 'The derivative of e^x equals e^x.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_STARTER_03', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_004', 'medium', 'The order of d²y/dx² + 3dy/dx + y = 0 is:',
'1', '2', '3', '0',
'B', 'The highest derivative present is the second derivative.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_STARTER_04', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_005', 'challenge', 'Solve dy/dx = y/x for x>0. The general solution is:',
'y=C+x', 'y=Cx', 'y=C/x', 'y=C e^x',
'B', 'Separate variables: dy/y=dx/x, so ln y=ln x+C and y=Cx.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_STARTER_05', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_005';

-- COORDINATE_GEOMETRY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_001', 'easy', 'The distance between (0,0) and (3,4) is:',
'3', '4', '5', '7',
'C', 'Distance=sqrt(3²+4²)=5.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_STARTER_01', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_002', 'medium', 'The slope of the line through (1,2) and (3,6) is:',
'1', '2', '3', '4',
'B', 'Slope=(6-2)/(3-1)=2.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_STARTER_02', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_003', 'medium', 'The equation of the line with slope 2 through the origin is:',
'y=x+2', 'y=2x', 'x=2y', 'y=2',
'B', 'Using y=mx+c with m=2 and c=0 gives y=2x.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_STARTER_03', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_004', 'medium', 'The center of x²+y²-4x+6y-12=0 is:',
'(2,-3)', '(-2,3)', '(4,-6)', '(-4,6)',
'A', 'Completing squares gives (x-2)²+(y+3)²=25.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_STARTER_04', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_005', 'challenge', 'A parabola y²=8x has focus:',
'(1,0)', '(2,0)', '(0,2)', '(4,0)',
'B', 'Compare y²=4ax with 8x, so a=2 and focus=(2,0).', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_STARTER_05', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_005';

-- THREE_D_GEOMETRY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_001', 'easy', 'The distance between (0,0,0) and (1,2,2) is:',
'2', '3', '4', '5',
'B', 'Distance=sqrt(1²+2²+2²)=3.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_STARTER_01', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_002', 'medium', 'A direction vector of the line x=1+2t, y=3-t, z=4+5t is:',
'(1,3,4)', '(2,-1,5)', '(2,1,5)', '(1,-1,4)',
'B', 'The coefficients of t form a direction vector.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_STARTER_02', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_003', 'medium', 'The plane x+y+z=6 has normal vector:',
'(1,1,1)', '(6,6,6)', '(1,0,0)', '(0,1,1)',
'A', 'Coefficients of x,y,z give a normal vector.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_STARTER_03', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_004', 'medium', 'The point (1,2,3) lies on which plane?',
'x+y+z=5', 'x+y+z=6', 'x-y+z=0', '2x+y+z=8',
'B', '1+2+3=6.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_STARTER_04', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_005', 'challenge', 'The angle between the positive x-axis and vector (1,1,0) is:',
'30°', '45°', '60°', '90°',
'B', 'cos θ = 1/sqrt(2), so θ=45°.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_STARTER_05', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_005';

-- VECTOR_ALGEBRA
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_001', 'easy', 'If a=(1,2) and b=(3,4), then a+b is:',
'(2,2)', '(3,6)', '(4,6)', '(4,8)',
'C', 'Add corresponding components: (1+3,2+4)=(4,6).', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_STARTER_01', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_002', 'medium', 'For a=(1,0,0) and b=(0,1,0), a·b equals:',
'0', '1', '-1', '2',
'A', 'The vectors are perpendicular, so their dot product is 0.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_STARTER_02', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_003', 'medium', '|3i+4j| equals:',
'3', '4', '5', '7',
'C', 'Magnitude=sqrt(3²+4²)=5.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_STARTER_03', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_004', 'medium', 'i × j equals:',
'-k', 'k', 'i', 'j',
'B', 'Using the right-hand rule, i×j=k.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_STARTER_04', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_005', 'challenge', 'If |a|=2, |b|=3 and a·b=3, the angle between them is:',
'30°', '45°', '60°', '90°',
'C', 'cosθ=(a·b)/(|a||b|)=3/6=1/2, so θ=60°.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_STARTER_05', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_005';

-- STATISTICS_PROBABILITY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_001', 'easy', 'The mean of 2,4,6,8 is:',
'4', '5', '6', '8',
'B', 'Mean=(2+4+6+8)/4=5.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_STARTER_01', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_002', 'medium', 'A fair coin is tossed once. P(Head) is:',
'0', '1/4', '1/2', '1',
'C', 'There are two equally likely outcomes and one is Head.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_STARTER_02', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_003', 'medium', 'A fair die is rolled. P(getting an even number) is:',
'1/6', '1/3', '1/2', '2/3',
'C', 'Even outcomes are 2,4,6: 3 of 6 outcomes.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_STARTER_03', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_004', 'medium', 'If P(A)=0.4, then P(A'') is:',
'0.4', '0.5', '0.6', '1.4',
'C', 'Complement probability is 1-0.4=0.6.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_STARTER_04', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_005', 'challenge', 'Two fair dice are rolled. P(sum=7) is:',
'1/12', '1/6', '1/4', '5/36',
'B', 'Six of the 36 ordered outcomes have sum 7, so probability is 6/36=1/6.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_STARTER_05', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_005';

-- TRIGONOMETRY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_001', 'easy', 'sin 30° equals:',
'0', '1/2', 'sqrt(2)/2', '1',
'B', 'The standard value is sin30°=1/2.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_STARTER_01', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_001';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_002', 'medium', 'tan 45° equals:',
'0', '1/2', '1', 'sqrt(3)',
'C', 'The standard value is tan45°=1.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_STARTER_02', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_002';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_003', 'medium', 'sin²θ + cos²θ equals:',
'0', '1', '2', 'sin 2θ',
'B', 'This is the fundamental Pythagorean identity.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_STARTER_03', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_003';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_004', 'medium', 'If cos θ=0 for 0°≤θ≤180°, then θ is:',
'0°', '45°', '90°', '180°',
'C', 'Cosine is zero at 90° in this interval.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_STARTER_04', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_004';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_005', 'challenge', 'If sin θ=3/5 and θ is acute, then cos θ is:',
'2/5', '3/4', '4/5', '5/4',
'C', 'Using sin²θ+cos²θ=1 gives cosθ=4/5 for acute θ.', 1, 'jee-rebuild-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_STARTER_05', 'GYAN JEE rebuild starter bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_005';
