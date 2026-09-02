-- GYAN IIT-JEE Test 1 Advanced v1
-- 0084_jee_test1_advanced_fixed.sql
-- 54 fixed questions: 18 Mathematics + 18 Physics + 18 Chemistry.
-- Per subject: 6 single-choice + 6 multi-select + 6 numerical.
-- GYAN practice marking for this pilot:
--   SINGLE_CHOICE: +3 correct, -1 incorrect, 0 unanswered
--   MULTI_SELECT: +4 exact-set correct, -2 incorrect/incomplete, 0 unanswered
--   NUMERICAL: +4 correct, 0 incorrect, 0 unanswered
-- Named-test membership/order is fixed and must never be randomized.

PRAGMA foreign_keys = ON;


CREATE TABLE IF NOT EXISTS education_mock_question_answers (
  question_id INTEGER PRIMARY KEY,
  answer_key TEXT NOT NULL,
  FOREIGN KEY (question_id)
    REFERENCES education_questions(id)
    ON DELETE CASCADE
);


UPDATE education_mock_tests
SET access_mode='OPEN', published=0, updated_at=CURRENT_TIMESTAMP
WHERE program_code='JEE' AND test_kind='FULL' AND test_code='TEST_1'
  AND exam_level='ADVANCED' AND version=1;

DELETE FROM education_mock_test_questions
WHERE mock_test_id=(
  SELECT id FROM education_mock_tests
  WHERE program_code='JEE' AND test_kind='FULL' AND test_code='TEST_1'
    AND exam_level='ADVANCED' AND version=1 LIMIT 1
);

-- 01 SINGLE_CHOICE IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M1', 'challenge', 'If z satisfies z²-(2+i)z+(1+i)=0, then the product of the moduli of its two roots is:',
'1', '√2', '2', '2√2',
'B', 'The product of the roots is 1+i, so the product of their moduli is |1+i|=√2.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','TEST1_ADV_01','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M1';

-- 02 SINGLE_CHOICE IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M2
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M2', 'challenge', 'Let A be a 2×2 real matrix with trace 6 and determinant 8. If the eigenvalues are real, the larger eigenvalue is:',
'2', '3', '4', '8',
'C', 'Eigenvalues satisfy λ²-6λ+8=0, giving 2 and 4.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','TEST1_ADV_02','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M2';

-- 03 SINGLE_CHOICE IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M3
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M3', 'challenge', 'For a geometric progression with positive terms, the 2nd, 5th and 8th terms are x, y and z. Which relation must hold?',
'y=x+z', 'y²=xz', 'xz=1', 'x²=yz',
'B', 'The exponents are equally spaced, so the middle term squared equals the product of the outer terms.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','TEST1_ADV_03','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M3';

-- 04 SINGLE_CHOICE IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M4
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M4', 'challenge', 'For f(x)=x³-3x, the number of points in [-2,2] at which f''(x)=0 is:',
'0', '1', '2', '3',
'C', 'f''(x)=3x²-3=0 at x=±1.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','TEST1_ADV_04','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M4';

-- 05 SINGLE_CHOICE IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M5
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M5', 'challenge', 'The number of 5-digit numbers formed using distinct digits from {1,2,3,4,5,6} and divisible by 5 is:',
'24', '60', '120', '240',
'C', 'The last digit must be 5. The remaining four positions are filled by choosing and arranging 4 of the remaining 5 digits: 5P4=120.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','TEST1_ADV_05','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M5';

-- 06 SINGLE_CHOICE IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M6
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M6', 'challenge', 'If A is a 3×3 matrix with det(A)=2, then det(3A) equals:',
'6', '18', '27', '54',
'D', 'For a 3×3 matrix, det(kA)=k³det(A)=27×2=54.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','TEST1_ADV_06','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M6';

-- 07 MULTI_SELECT IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M1', 'challenge', 'For z=3+4i, which statements are correct?',
'|z|=5', 'z·conjugate(z)=25', '1/z=(3-4i)/25', 'arg(z)=π/4',
'A', 'The modulus is 5, z·conjugate(z)=25, and 1/z=(3-4i)/25. The argument is not π/4.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','TEST1_ADV_07','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M1';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id, 'ABC'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M1';

-- 08 MULTI_SELECT IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M2
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M2', 'challenge', 'For a square matrix A, which statements are always true?',
'det(Aᵀ)=det(A)', 'det(AB)=det(A)det(B)', 'det(A+B)=det(A)+det(B)', 'If det(A)≠0 then A is invertible',
'A', 'Transpose preserves determinant, determinants multiply, and nonzero determinant implies invertibility. Determinant is not additive.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','TEST1_ADV_08','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M2';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id, 'ABD'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M2';

-- 09 MULTI_SELECT IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M3
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M3', 'challenge', 'For an arithmetic progression with first term a and common difference d, which are correct?',
'aₙ=a+(n-1)d', 'Sₙ=n[2a+(n-1)d]/2', 'If d=0 all terms are equal', 'Sₙ=n(a+d) for all n',
'A', 'The standard nth-term and sum formulas hold, and d=0 gives a constant sequence.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','TEST1_ADV_09','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M3';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id, 'ABC'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M3';

-- 10 MULTI_SELECT IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M4
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M4', 'challenge', 'Let f be differentiable at x=a. Which statements must be true?',
'f is continuous at a', 'The left and right derivatives at a are equal', 'f''(a) is finite', 'f has a local extremum at a',
'A', 'Differentiability implies continuity, equality of one-sided derivatives, and a finite derivative; it does not imply an extremum.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','TEST1_ADV_10','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M4';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id, 'ABC'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M4';

-- 11 MULTI_SELECT IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M5
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M5', 'challenge', 'For integers n≥r≥0, which identities are correct?',
'C(n,r)=C(n,n-r)', 'r·C(n,r)=n·C(n-1,r-1)', 'C(n,r)+C(n,r+1)=C(n+1,r+1)', 'P(n,r)=C(n,r)/r!',
'A', 'The first three are standard identities. P(n,r)=C(n,r)r!, not C(n,r)/r!.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','TEST1_ADV_11','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M5';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id, 'ABC'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M5';

-- 12 MULTI_SELECT IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M6
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M6', 'challenge', 'For the quadratic x²-5x+6=0, which statements are correct?',
'Both roots are positive', 'Sum of roots is 5', 'Product of roots is 6', 'The discriminant is negative',
'A', 'The roots are 2 and 3, so the first three statements are true and the discriminant is positive.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','TEST1_ADV_12','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M6';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id, 'ABC'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M6';

-- 13 NUMERICAL IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M1', 'challenge', 'If the roots of x²-9x+14=0 are α and β, enter α²+β².',
'53', '', '', '',
'A', '(α+β)²-2αβ=9²-2×14=53.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','TEST1_ADV_13','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M1';

-- 14 NUMERICAL IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M2
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M2', 'challenge', 'For A=[[2,1],[3,4]], enter det(A²).',
'25', '', '', '',
'A', 'det(A)=8-3=5 and det(A²)=det(A)²=25.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','TEST1_ADV_14','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M2';

-- 15 NUMERICAL IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M3
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M3', 'challenge', 'An AP has 5th term 18 and 11th term 42. Enter its common difference.',
'4', '', '', '',
'A', 'The difference of the terms is 6d=42-18=24, hence d=4.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','TEST1_ADV_15','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M3';

-- 16 NUMERICAL IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M4
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M4', 'challenge', 'Enter the value of lim(x→0) [sin(5x)/x].',
'5', '', '', '',
'A', 'sin(5x)/(5x)→1, so the limit is 5.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','TEST1_ADV_16','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M4';

-- 17 NUMERICAL IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M5
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M5', 'challenge', 'Enter the number of diagonals in a convex 12-gon.',
'54', '', '', '',
'A', 'The number of diagonals is n(n-3)/2=12×9/2=54.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','TEST1_ADV_17','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M5';

-- 18 NUMERICAL IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M6
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M6', 'challenge', 'If det(A)=3 for a 2×2 matrix A, enter det(3A⁻¹).',
'1.3333333333333333', '', '', '',
'A', 'det(2A⁻¹)=2² det(A⁻¹)=4/3.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','TEST1_ADV_18','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M6';

-- 19 SINGLE_CHOICE IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P1', 'challenge', 'A particle moves along x-axis with x=t³-6t²+9t. Its velocity is zero at t=1 s and:',
'2 s', '3 s', '4 s', '6 s',
'B', 'v=3t²-12t+9=3(t-1)(t-3), so the second instant is 3 s.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','TEST1_ADV_19','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P1';

-- 20 SINGLE_CHOICE IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P2
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P2', 'challenge', 'A 5 kg block on a frictionless horizontal surface is pulled by 20 N. If a 3 kg block is attached to it and the same force pulls the pair, the acceleration becomes:',
'1.5 m/s²', '2.5 m/s²', '4 m/s²', '6.67 m/s²',
'B', 'The total mass is 8 kg, so a=20/8=2.5 m/s².', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','TEST1_ADV_20','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P2';

-- 21 SINGLE_CHOICE IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P3
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P3', 'challenge', 'A spring of constant 200 N/m is compressed by 0.10 m. Its stored elastic potential energy is:',
'0.5 J', '1 J', '2 J', '10 J',
'B', 'U=½kx²=0.5×200×0.01=1 J.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','TEST1_ADV_21','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P3';

-- 22 SINGLE_CHOICE IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P4
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P4', 'challenge', 'Two resistors 6 Ω and 3 Ω are connected in parallel across 12 V. The total current drawn is:',
'2 A', '4 A', '6 A', '8 A',
'C', 'Equivalent resistance is 2 Ω, hence I=12/2=6 A.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','TEST1_ADV_22','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P4';

-- 23 SINGLE_CHOICE IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P5
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P5', 'challenge', 'A thin convex lens has focal length 20 cm. An object is placed 60 cm in front of it. The magnitude of image distance is:',
'15 cm', '20 cm', '30 cm', '60 cm',
'C', '1/f=1/v+1/u in magnitudes gives 1/20=1/v+1/60, hence v=30 cm.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','TEST1_ADV_23','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P5';

-- 24 SINGLE_CHOICE IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P6
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P6', 'challenge', 'A 2 kg body moving at 6 m/s is brought to rest uniformly over 3 m. The magnitude of the average retarding force is:',
'6 N', '9 N', '12 N', '18 N',
'C', 'Work by the retarding force equals the loss of kinetic energy: F×3=½×2×36=36, so F=12 N.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','TEST1_ADV_24','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P6';

-- 25 MULTI_SELECT IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P1', 'challenge', 'For one-dimensional motion with constant acceleration, which relations are valid?',
'v=u+at', 's=ut+½at²', 'v²=u²+2as', 's=(u+v)t for all such motion',
'A', 'The first three are standard equations. Average velocity is (u+v)/2, so s=(u+v)t/2.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','TEST1_ADV_25','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P1';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id, 'ABC'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P1';

-- 26 MULTI_SELECT IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P2
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P2', 'challenge', 'Which statements about Newton''s laws are correct in an inertial frame?',
'Net force equals rate of change of momentum', 'Action and reaction act on different bodies', 'If net force is zero, momentum is constant', 'A moving body must have a net force in the direction of motion',
'A', 'The first three are correct. Uniform motion needs no net force.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','TEST1_ADV_26','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P2';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id, 'ABC'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P2';

-- 27 MULTI_SELECT IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P3
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P3', 'challenge', 'Which quantities can be negative?',
'Work done by a force', 'Kinetic energy', 'Potential energy relative to a chosen zero', 'Power delivered by a force',
'A', 'Work, potential energy relative to a reference, and instantaneous power may be negative; kinetic energy is nonnegative.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','TEST1_ADV_27','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P3';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id, 'ACD'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P3';

-- 28 MULTI_SELECT IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P4
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P4', 'challenge', 'For resistors connected in parallel, which statements are correct?',
'Potential difference across each branch is the same', 'Equivalent resistance is less than the smallest branch resistance', 'Currents in all branches must be equal', 'Total current is the sum of branch currents',
'A', 'Parallel branches share the same voltage, equivalent resistance is smaller than any branch resistance, and currents add.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','TEST1_ADV_28','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P4';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id, 'ABD'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P4';

-- 29 MULTI_SELECT IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P5
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P5', 'challenge', 'For a real object in front of a concave mirror, which image types are possible as the object position changes?',
'Real inverted', 'Virtual erect', 'Magnified', 'Diminished',
'A', 'A concave mirror can produce all four descriptions depending on object position.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','TEST1_ADV_29','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P5';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id, 'ABCD'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P5';

-- 30 MULTI_SELECT IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P6
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P6', 'challenge', 'For a metallic conductor obeying Ohm''s law at constant temperature, which statements are correct?',
'V is proportional to I', 'Resistance is V/I', 'Doubling V doubles I', 'Resistance necessarily doubles when V doubles',
'A', 'Ohm''s law gives V=IR with constant R; increasing V changes current, not the resistance under the stated condition.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','TEST1_ADV_30','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P6';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id, 'ABC'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P6';

-- 31 NUMERICAL IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P1', 'challenge', 'A particle starts from rest with constant acceleration 3 m/s². Enter the distance travelled in the 4th second in metres.',
'10.5', '', '', '',
'A', 'Distance in nth second is u+a(n-1/2)=0+3×3.5=10.5 m.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','TEST1_ADV_31','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P1';

-- 32 NUMERICAL IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P2
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P2', 'challenge', 'A 10 kg block has horizontal forces 35 N right and 15 N left. Enter its acceleration in m/s².',
'2', '', '', '',
'A', 'Net force is 20 N, so a=20/10=2 m/s².', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','TEST1_ADV_32','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P2';

-- 33 NUMERICAL IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P3
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P3', 'challenge', 'A 1000 kg car increases speed from 10 m/s to 20 m/s. Enter the increase in kinetic energy in kJ.',
'150', '', '', '',
'A', 'ΔK=½m(v²-u²)=500(400-100)=150000 J=150 kJ.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','TEST1_ADV_33','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P3';

-- 34 NUMERICAL IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P4
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P4', 'challenge', 'Three 6 Ω resistors are connected in parallel. Enter the equivalent resistance in ohms.',
'2', '', '', '',
'A', 'For three equal resistors R in parallel, Req=R/3=2 Ω.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','TEST1_ADV_34','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P4';

-- 35 NUMERICAL IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P5
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P5', 'challenge', 'A lens has power +5 dioptres. Enter its focal length in centimetres.',
'20', '', '', '',
'A', 'f=1/P=0.2 m=20 cm.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','TEST1_ADV_35','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P5';

-- 36 NUMERICAL IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P6
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P6', 'challenge', 'A machine does 18 kJ of work in 30 s. Enter its average power in watts.',
'600', '', '', '',
'A', 'P=W/t=18000/30=600 W.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','TEST1_ADV_36','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P6';

-- 37 SINGLE_CHOICE IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C1', 'challenge', 'How many moles of oxygen atoms are present in 0.5 mol of H2SO4?',
'0.5', '1', '2', '4',
'C', 'Each mole of H2SO4 contains 4 mol of O atoms, so 0.5 mol contains 2 mol.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','TEST1_ADV_37','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C1';

-- 38 SINGLE_CHOICE IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C2
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C2', 'challenge', 'For the equilibrium H2(g)+I2(g) ⇌ 2HI(g), decreasing the volume at constant temperature ideally causes the equilibrium composition to:',
'shift right', 'shift left', 'remain unchanged', 'form only HI',
'C', 'The total number of gaseous moles is the same on both sides, so pressure/volume change does not shift the equilibrium.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','TEST1_ADV_38','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C2';

-- 39 SINGLE_CHOICE IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C3
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C3', 'challenge', 'The coordination number of Co in [Co(NH3)6]3+ is:',
'3', '4', '6', '9',
'C', 'Six monodentate NH3 ligands are directly coordinated to Co.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','TEST1_ADV_39','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C3';

-- 40 SINGLE_CHOICE IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C4
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C4', 'challenge', 'Which ion has a d5 configuration?',
'Fe3+', 'Cu2+', 'Zn2+', 'Sc3+',
'A', 'Fe is [Ar]3d6 4s2; Fe3+ is [Ar]3d5.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','TEST1_ADV_40','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C4';

-- 41 SINGLE_CHOICE IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C5
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C5', 'challenge', 'The number of atoms effectively present in one face-centered cubic unit cell is:',
'2', '3', '4', '6',
'C', 'Eight corners contribute 1 atom and six faces contribute 3 atoms, total 4.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','TEST1_ADV_41','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C5';

-- 42 SINGLE_CHOICE IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C6
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C6', 'challenge', 'At 25°C, a solution with [H+]=10^-3 M has pH:',
'1', '2', '3', '11',
'C', 'pH=-log10(10^-3)=3.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','SINGLE_CHOICE','JEE_2026','REVIEWED','TEST1_ADV_42','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C6';

-- 43 MULTI_SELECT IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C1', 'challenge', 'Which statements about one mole are correct?',
'It contains Avogadro''s number of specified entities', 'One mole of ideal gas always occupies 22.4 L at every temperature and pressure', 'Molar mass in grams is numerically equal to relative molecular mass', '0.5 mol contains half Avogadro''s number of entities',
'A', 'Avogadro count and molar-mass relations are correct; 22.4 L applies only approximately under specific standard conditions.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','TEST1_ADV_43','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C1';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id, 'ACD'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C1';

-- 44 MULTI_SELECT IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C2
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C2', 'challenge', 'For a system at chemical equilibrium, which statements are correct?',
'Forward and reverse reaction rates are equal', 'Macroscopic concentrations remain constant with time', 'Both reactions stop', 'A catalyst changes the equilibrium constant',
'A', 'Equilibrium is dynamic: rates are equal and macroscopic concentrations are constant. Reactions continue, and a catalyst does not change K.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','TEST1_ADV_44','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C2';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id, 'AB'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C2';

-- 45 MULTI_SELECT IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C3
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C3', 'challenge', 'Which can act as ligands through a lone pair?',
'NH3', 'H2O', 'CN-', 'Na+',
'A', 'NH3, H2O and CN- donate lone pairs; Na+ is not a ligand donor.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','TEST1_ADV_45','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C3';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id, 'ABC'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C3';

-- 46 MULTI_SELECT IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C4
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C4', 'challenge', 'Which are characteristic features often associated with transition-metal ions?',
'Variable oxidation states', 'Colored compounds', 'Complex formation', 'Only +1 oxidation state',
'A', 'Variable oxidation states, color, and complex formation are common transition-metal behavior.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','TEST1_ADV_46','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C4';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id, 'ABC'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C4';

-- 47 MULTI_SELECT IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C5
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C5', 'challenge', 'For an ideal face-centered cubic lattice, which statements are correct?',
'Atoms per unit cell = 4', 'Coordination number = 12', 'Packing efficiency is greater than simple cubic', 'Each corner atom belongs entirely to one unit cell',
'A', 'FCC has 4 atoms per cell, coordination number 12, and high packing efficiency. Corner atoms are shared among eight cells.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','TEST1_ADV_47','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C5';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id, 'ABC'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C5';

-- 48 MULTI_SELECT IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C6
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C6', 'challenge', 'For a weak acid HA in water, which changes generally increase its degree of ionization?',
'Dilution', 'Adding a strong acid containing H+', 'Removing H+ from solution', 'Increasing concentration of HA at fixed temperature',
'A', 'Dilution favors ionization of a weak electrolyte, and removing H+ shifts HA ⇌ H+ + A- to the right.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','MULTI_SELECT','JEE_2026','REVIEWED','TEST1_ADV_48','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C6';

INSERT OR REPLACE INTO education_mock_question_answers
(question_id, answer_key)
SELECT q.id, 'AC'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C6';

-- 49 NUMERICAL IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C1
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C1', 'challenge', 'Enter the number of moles in 44 g of CO2 (molar mass 44 g/mol).',
'1', '', '', '',
'A', 'n=m/M=44/44=1 mol.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','TEST1_ADV_49','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C1';

-- 50 NUMERICAL IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C2
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C2', 'challenge', 'At 25°C, enter the pOH of a solution whose pH is 9.',
'5', '', '', '',
'A', 'At 25°C, pH+pOH=14, hence pOH=5.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='EQUILIBRIUM' AND st.subtopic_code='EQUILIBRIUM_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','TEST1_ADV_50','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C2';

-- 51 NUMERICAL IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C3
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C3', 'challenge', 'Enter the oxidation state of Co in [Co(NH3)5Cl]Cl2.',
'3', '', '', '',
'A', 'The complex cation has charge +2. With one coordinated Cl- and neutral NH3, x-1=+2, so x=+3.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='COORDINATION' AND st.subtopic_code='COORDINATION_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','TEST1_ADV_51','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C3';

-- 52 NUMERICAL IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C4
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C4', 'challenge', 'Enter the number of unpaired electrons in a free high-spin Fe3+ ion (3d5).',
'5', '', '', '',
'A', 'A high-spin d5 configuration has one electron in each of the five d orbitals.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='D_F_BLOCK' AND st.subtopic_code='D_F_BLOCK_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','TEST1_ADV_52','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C4';

-- 53 NUMERICAL IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C5
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C5', 'challenge', 'Enter the coordination number of a body-centered cubic lattice.',
'8', '', '', '',
'A', 'Each atom in BCC has eight nearest neighbors.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='SOLID_STATE' AND st.subtopic_code='SOLID_STATE_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','TEST1_ADV_53','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C5';

-- 54 NUMERICAL IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C6
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C6', 'challenge', 'Enter the mass in grams of 0.25 mol of NaOH (molar mass 40 g/mol).',
'10', '', '', '',
'A', 'm=nM=0.25×40=10 g.', 1, 'jee-mock-advanced-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='BASIC_CONCEPTS' AND st.subtopic_code='BASIC_CONCEPTS_CORE';

INSERT OR REPLACE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id,'ADVANCED','NUMERICAL','JEE_2026','REVIEWED','TEST1_ADV_54','GYAN JEE Test 1 Advanced fixed bank'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C6';

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  1, 'MATH', 3, -1, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M1'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  2, 'MATH', 3, -1, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M2'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  3, 'MATH', 3, -1, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M3'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  4, 'MATH', 3, -1, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M4'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  5, 'MATH', 3, -1, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M5'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  6, 'MATH', 3, -1, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_SC_M6'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  7, 'MATH', 4, -2, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M1'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  8, 'MATH', 4, -2, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M2'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  9, 'MATH', 4, -2, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M3'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  10, 'MATH', 4, -2, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M4'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  11, 'MATH', 4, -2, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M5'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  12, 'MATH', 4, -2, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_MS_M6'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  13, 'MATH', 4, 0, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M1'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  14, 'MATH', 4, 0, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M2'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  15, 'MATH', 4, 0, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M3'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  16, 'MATH', 4, 0, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M4'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  17, 'MATH', 4, 0, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M5'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  18, 'MATH', 4, 0, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_MATH_TEST1_ADV_NUM_M6'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  19, 'PHYSICS', 3, -1, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P1'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  20, 'PHYSICS', 3, -1, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P2'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  21, 'PHYSICS', 3, -1, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P3'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  22, 'PHYSICS', 3, -1, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P4'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  23, 'PHYSICS', 3, -1, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P5'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  24, 'PHYSICS', 3, -1, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_SC_P6'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  25, 'PHYSICS', 4, -2, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P1'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  26, 'PHYSICS', 4, -2, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P2'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  27, 'PHYSICS', 4, -2, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P3'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  28, 'PHYSICS', 4, -2, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P4'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  29, 'PHYSICS', 4, -2, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P5'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  30, 'PHYSICS', 4, -2, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_MS_P6'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  31, 'PHYSICS', 4, 0, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P1'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  32, 'PHYSICS', 4, 0, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P2'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  33, 'PHYSICS', 4, 0, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P3'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  34, 'PHYSICS', 4, 0, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P4'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  35, 'PHYSICS', 4, 0, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P5'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  36, 'PHYSICS', 4, 0, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_PHYSICS_TEST1_ADV_NUM_P6'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  37, 'CHEMISTRY', 3, -1, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C1'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  38, 'CHEMISTRY', 3, -1, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C2'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  39, 'CHEMISTRY', 3, -1, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C3'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  40, 'CHEMISTRY', 3, -1, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C4'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  41, 'CHEMISTRY', 3, -1, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C5'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  42, 'CHEMISTRY', 3, -1, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_SC_C6'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  43, 'CHEMISTRY', 4, -2, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C1'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  44, 'CHEMISTRY', 4, -2, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C2'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  45, 'CHEMISTRY', 4, -2, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C3'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  46, 'CHEMISTRY', 4, -2, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C4'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  47, 'CHEMISTRY', 4, -2, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C5'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  48, 'CHEMISTRY', 4, -2, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_MS_C6'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  49, 'CHEMISTRY', 4, 0, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C1'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  50, 'CHEMISTRY', 4, 0, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C2'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  51, 'CHEMISTRY', 4, 0, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C3'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  52, 'CHEMISTRY', 4, 0, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C4'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  53, 'CHEMISTRY', 4, 0, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C5'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

INSERT INTO education_mock_test_questions
(mock_test_id, question_id, question_order, section_code, marks_correct, marks_incorrect, marks_unanswered)
SELECT mt.id, q.id,
  54, 'CHEMISTRY', 4, 0, 0
FROM education_mock_tests mt
JOIN education_questions q
  ON q.question_key='IN_PROGRAM_JEE_CHEMISTRY_TEST1_ADV_NUM_C6'
WHERE mt.program_code='JEE'
  AND mt.test_kind='FULL'
  AND mt.test_code='TEST_1'
  AND mt.exam_level='ADVANCED'
  AND mt.version=1
  AND q.active=1;

-- Keep unpublished here. Publish only with 0085 after validation.
UPDATE education_mock_tests
SET access_mode='OPEN', published=0, updated_at=CURRENT_TIMESTAMP
WHERE program_code='JEE' AND test_kind='FULL' AND test_code='TEST_1'
  AND exam_level='ADVANCED' AND version=1;
