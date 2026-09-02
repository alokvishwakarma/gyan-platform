-- GYAN IIT-JEE complete bank expansion - Mathematics batch 1
-- 0079_jee_math_bank_006_025.sql
-- Adds questions 006..025 for each of the 14 Mathematics topics.
-- Result: Mathematics grows from 5 to 25 questions per topic (350 total).
-- Named Mock/Mini tests remain fixed and are not modified.

PRAGMA foreign_keys = ON;

-- SETS_RELATIONS_FUNCTIONS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_006', 'medium', 'If n(A)=10, n(B)=7 and n(A∩B)=2, find n(A∪B).',
'14', '17', '1', '15',
'D', 'n(A∪B)=n(A)+n(B)-n(A∩B)=10+7-2=15.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_006', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_007', 'medium', 'If n(A)=11, n(B)=8 and n(A∩B)=3, find n(A∪B).',
'16', '18', '19', '15',
'A', 'n(A∪B)=n(A)+n(B)-n(A∩B)=11+8-3=16.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_007', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_008', 'medium', 'If n(A)=12, n(B)=9 and n(A∩B)=4, find n(A∪B).',
'19', '17', '21', '16',
'B', 'n(A∪B)=n(A)+n(B)-n(A∩B)=12+9-4=17.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_008', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_009', 'medium', 'If n(A)=13, n(B)=10 and n(A∩B)=5, find n(A∪B).',
'23', '18', '20', '17',
'B', 'n(A∪B)=n(A)+n(B)-n(A∩B)=13+10-5=18.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_009', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_010', 'medium', 'If n(A)=14, n(B)=11 and n(A∩B)=2, find n(A∪B).',
'22', '25', '1', '23',
'D', 'n(A∪B)=n(A)+n(B)-n(A∩B)=14+11-2=23.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_010', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_011', 'medium', 'If n(A)=15, n(B)=12 and n(A∩B)=3, find n(A∪B).',
'24', '26', '27', '23',
'A', 'n(A∪B)=n(A)+n(B)-n(A∩B)=15+12-3=24.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_011', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_012', 'medium', 'If n(A)=16, n(B)=13 and n(A∩B)=4, find n(A∪B).',
'25', '27', '24', '29',
'A', 'n(A∪B)=n(A)+n(B)-n(A∩B)=16+13-4=25.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_012', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_013', 'medium', 'If n(A)=17, n(B)=14 and n(A∩B)=5, find n(A∪B).',
'28', '25', '31', '26',
'D', 'n(A∪B)=n(A)+n(B)-n(A∩B)=17+14-5=26.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_013', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_014', 'medium', 'If n(A)=18, n(B)=15 and n(A∩B)=2, find n(A∪B).',
'33', '31', '1', '30',
'B', 'n(A∪B)=n(A)+n(B)-n(A∩B)=18+15-2=31.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_014', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_015', 'medium', 'If n(A)=19, n(B)=16 and n(A∩B)=3, find n(A∪B).',
'35', '32', '34', '31',
'B', 'n(A∪B)=n(A)+n(B)-n(A∩B)=19+16-3=32.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_015', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_016', 'medium', 'For f(x)=2x+1, if f(a)=5, find a.',
'5', '1', '2', '3',
'C', '2a+1=5, so a=2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_016', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_017', 'medium', 'For f(x)=3x+2, if f(a)=11, find a.',
'3', '11', '2', '4',
'A', '3a+2=11, so a=3.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_017', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_018', 'medium', 'For f(x)=4x+3, if f(a)=19, find a.',
'19', '3', '4', '5',
'C', '4a+3=19, so a=4.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_018', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_019', 'medium', 'For f(x)=5x+4, if f(a)=29, find a.',
'29', '4', '6', '5',
'D', '5a+4=29, so a=5.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_019', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_020', 'medium', 'For f(x)=6x+5, if f(a)=41, find a.',
'7', '6', '41', '5',
'B', '6a+5=41, so a=6.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_020', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_021', 'medium', 'For f(x)=7x+6, if f(a)=55, find a.',
'7', '6', '55', '8',
'A', '7a+6=55, so a=7.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_021', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_022', 'challenge', 'For f(x)=8x+7, if f(a)=71, find a.',
'9', '7', '8', '71',
'C', '8a+7=71, so a=8.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_022', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_023', 'challenge', 'For f(x)=9x+8, if f(a)=89, find a.',
'89', '10', '9', '8',
'C', '9a+8=89, so a=9.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_023', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_024', 'challenge', 'For f(x)=10x+9, if f(a)=109, find a.',
'11', '10', '109', '9',
'B', '10a+9=109, so a=10.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_024', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_025', 'challenge', 'For f(x)=11x+10, if f(a)=131, find a.',
'10', '131', '11', '12',
'C', '11a+10=131, so a=11.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SETS_RELATIONS_FUNCTIONS' AND st.subtopic_code='SETS_RELATIONS_FUNCTIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SETS_RELATIONS_FUNCTIONS_BANK_025', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SETS_RELATIONS_FUNCTIONS_025';

-- COMPLEX_QUADRATIC
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_006', 'medium', 'If z=2+1i, find |z|².',
'5', '1', '7', '3',
'A', '|z|²=2²+1²=5.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_006', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_007', 'medium', 'If z=3+2i, find |z|².',
'5', '1', '13', '15',
'C', '|z|²=3²+2²=13.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_007', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_008', 'medium', 'If z=4+3i, find |z|².',
'25', '7', '1', '27',
'A', '|z|²=4²+3²=25.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_008', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_009', 'medium', 'If z=5+4i, find |z|².',
'41', '43', '9', '1',
'A', '|z|²=5²+4²=41.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_009', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_010', 'medium', 'If z=6+5i, find |z|².',
'61', '11', '1', '63',
'A', '|z|²=6²+5²=61.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_010', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_011', 'medium', 'If z=7+6i, find |z|².',
'87', '85', '1', '13',
'B', '|z|²=7²+6²=85.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_011', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_012', 'medium', 'If z=8+7i, find |z|².',
'1', '115', '15', '113',
'D', '|z|²=8²+7²=113.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_012', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_013', 'medium', 'If z=9+8i, find |z|².',
'17', '145', '147', '1',
'B', '|z|²=9²+8²=145.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_013', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_014', 'medium', 'If z=10+9i, find |z|².',
'183', '19', '1', '181',
'D', '|z|²=10²+9²=181.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_014', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_015', 'medium', 'If z=11+10i, find |z|².',
'223', '221', '1', '21',
'B', '|z|²=11²+10²=221.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_015', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_016', 'challenge', 'Find the roots of x²-13x+12=0.',
'2 and 12', '1 and 13', '1 and 12', '-1 and -12',
'C', 'The numbers 1 and 12 have sum 13 and product 12.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_016', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_017', 'challenge', 'Find the roots of x²-15x+26=0.',
'2 and 13', '3 and 13', '-2 and -13', '2 and 14',
'A', 'The numbers 2 and 13 have sum 15 and product 26.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_017', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_018', 'challenge', 'Find the roots of x²-17x+42=0.',
'-3 and -14', '3 and 15', '3 and 14', '4 and 14',
'C', 'The numbers 3 and 14 have sum 17 and product 42.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_018', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_019', 'challenge', 'Find the roots of x²-19x+60=0.',
'5 and 15', '-4 and -15', '4 and 16', '4 and 15',
'D', 'The numbers 4 and 15 have sum 19 and product 60.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_019', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_020', 'challenge', 'Find the roots of x²-21x+80=0.',
'5 and 16', '-5 and -16', '5 and 17', '6 and 16',
'A', 'The numbers 5 and 16 have sum 21 and product 80.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_020', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_021', 'challenge', 'Find the roots of x²-23x+102=0.',
'7 and 17', '-6 and -17', '6 and 18', '6 and 17',
'D', 'The numbers 6 and 17 have sum 23 and product 102.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_021', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_022', 'challenge', 'Find the roots of x²-25x+126=0.',
'7 and 19', '8 and 18', '-7 and -18', '7 and 18',
'D', 'The numbers 7 and 18 have sum 25 and product 126.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_022', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_023', 'challenge', 'Find the roots of x²-27x+152=0.',
'-8 and -19', '8 and 20', '8 and 19', '9 and 19',
'C', 'The numbers 8 and 19 have sum 27 and product 152.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_023', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_024', 'challenge', 'Find the roots of x²-29x+180=0.',
'-9 and -20', '9 and 21', '9 and 20', '10 and 20',
'C', 'The numbers 9 and 20 have sum 29 and product 180.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_024', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_025', 'challenge', 'Find the roots of x²-31x+210=0.',
'10 and 22', '11 and 21', '10 and 21', '-10 and -21',
'C', 'The numbers 10 and 21 have sum 31 and product 210.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COMPLEX_QUADRATIC' AND st.subtopic_code='COMPLEX_QUADRATIC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COMPLEX_QUADRATIC_BANK_025', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COMPLEX_QUADRATIC_025';

-- MATRICES_DETERMINANTS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_006', 'medium', 'For A=[[2,1],[3,5]], find det(A).',
'6', '7', '8', '13',
'B', 'det(A)=(2)(5)-(1)(3)=7.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_006', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_007', 'medium', 'For A=[[3,2],[4,6]], find det(A).',
'9', '10', '11', '26',
'B', 'det(A)=(3)(6)-(2)(4)=10.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_007', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_008', 'medium', 'For A=[[4,3],[5,7]], find det(A).',
'12', '13', '14', '43',
'B', 'det(A)=(4)(7)-(3)(5)=13.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_008', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_009', 'medium', 'For A=[[5,4],[6,8]], find det(A).',
'16', '15', '64', '17',
'A', 'det(A)=(5)(8)-(4)(6)=16.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_009', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_010', 'medium', 'For A=[[6,5],[7,9]], find det(A).',
'89', '19', '18', '20',
'B', 'det(A)=(6)(9)-(5)(7)=19.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_010', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_011', 'medium', 'For A=[[7,6],[8,10]], find det(A).',
'22', '23', '21', '118',
'A', 'det(A)=(7)(10)-(6)(8)=22.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_011', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_012', 'medium', 'For A=[[8,7],[9,11]], find det(A).',
'25', '151', '24', '26',
'A', 'det(A)=(8)(11)-(7)(9)=25.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_012', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_013', 'medium', 'For A=[[9,8],[10,12]], find det(A).',
'188', '27', '29', '28',
'D', 'det(A)=(9)(12)-(8)(10)=28.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_013', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_014', 'medium', 'For A=[[10,9],[11,13]], find det(A).',
'32', '229', '31', '30',
'C', 'det(A)=(10)(13)-(9)(11)=31.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_014', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_015', 'medium', 'For A=[[11,10],[12,14]], find det(A).',
'33', '35', '34', '274',
'C', 'det(A)=(11)(14)-(10)(12)=34.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_015', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_016', 'medium', 'Find the trace of diag(3,15).',
'45', '19', '12', '18',
'D', 'Trace=3+15=18.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_016', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_017', 'medium', 'Find the trace of diag(4,16).',
'21', '20', '64', '12',
'B', 'Trace=4+16=20.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_017', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_018', 'medium', 'Find the trace of diag(5,17).',
'85', '12', '22', '23',
'C', 'Trace=5+17=22.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_018', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_019', 'medium', 'Find the trace of diag(6,18).',
'108', '12', '24', '25',
'C', 'Trace=6+18=24.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_019', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_020', 'medium', 'Find the trace of diag(7,19).',
'133', '27', '12', '26',
'D', 'Trace=7+19=26.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_020', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_021', 'medium', 'Find the trace of diag(8,20).',
'29', '12', '160', '28',
'D', 'Trace=8+20=28.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_021', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_022', 'challenge', 'Find the trace of diag(9,21).',
'189', '31', '12', '30',
'D', 'Trace=9+21=30.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_022', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_023', 'challenge', 'Find the trace of diag(10,22).',
'32', '33', '12', '220',
'A', 'Trace=10+22=32.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_023', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_024', 'challenge', 'Find the trace of diag(11,23).',
'35', '253', '34', '12',
'C', 'Trace=11+23=34.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_024', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_025', 'challenge', 'Find the trace of diag(12,24).',
'288', '36', '12', '37',
'B', 'Trace=12+24=36.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='MATRICES_DETERMINANTS' AND st.subtopic_code='MATRICES_DETERMINANTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MATRICES_DETERMINANTS_BANK_025', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_MATRICES_DETERMINANTS_025';

-- PERMUTATIONS_COMBINATIONS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_006', 'medium', 'In how many ways can 2 objects be chosen from 5 distinct objects?',
'8', '12', '20', '10',
'D', 'The answer is C(5,2)=10.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_006', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_007', 'medium', 'In how many ways can 2 objects be chosen from 6 distinct objects?',
'17', '15', '13', '30',
'B', 'The answer is C(6,2)=15.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_007', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_008', 'medium', 'In how many ways can 3 objects be chosen from 6 distinct objects?',
'120', '17', '23', '20',
'D', 'The answer is C(6,3)=20.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_008', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_009', 'medium', 'In how many ways can 2 objects be chosen from 7 distinct objects?',
'23', '21', '19', '42',
'B', 'The answer is C(7,2)=21.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_009', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_010', 'medium', 'In how many ways can 3 objects be chosen from 7 distinct objects?',
'35', '32', '38', '210',
'A', 'The answer is C(7,3)=35.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_010', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_011', 'medium', 'In how many ways can 4 objects be chosen from 7 distinct objects?',
'39', '840', '35', '31',
'C', 'The answer is C(7,4)=35.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_011', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_012', 'medium', 'In how many ways can 2 objects be chosen from 8 distinct objects?',
'56', '30', '26', '28',
'D', 'The answer is C(8,2)=28.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_012', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_013', 'medium', 'In how many ways can 3 objects be chosen from 8 distinct objects?',
'56', '336', '53', '59',
'A', 'The answer is C(8,3)=56.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_013', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_014', 'medium', 'In how many ways can 4 objects be chosen from 8 distinct objects?',
'74', '66', '70', '1680',
'C', 'The answer is C(8,4)=70.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_014', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_015', 'medium', 'In how many ways can 3 objects be chosen from 9 distinct objects?',
'81', '504', '87', '84',
'D', 'The answer is C(9,3)=84.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_015', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_016', 'challenge', 'How many ordered selections of 2 objects can be made from 5 distinct objects?',
'18', '10', '20', '25',
'C', 'The answer is P(5,2)=20.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_016', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_017', 'challenge', 'How many ordered selections of 3 objects can be made from 5 distinct objects?',
'10', '125', '60', '57',
'C', 'The answer is P(5,3)=60.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_017', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_018', 'challenge', 'How many ordered selections of 2 objects can be made from 6 distinct objects?',
'36', '30', '15', '28',
'B', 'The answer is P(6,2)=30.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_018', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_019', 'challenge', 'How many ordered selections of 3 objects can be made from 6 distinct objects?',
'117', '20', '120', '216',
'C', 'The answer is P(6,3)=120.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_019', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_020', 'challenge', 'How many ordered selections of 4 objects can be made from 6 distinct objects?',
'360', '356', '15', '1296',
'A', 'The answer is P(6,4)=360.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_020', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_021', 'challenge', 'How many ordered selections of 2 objects can be made from 7 distinct objects?',
'21', '40', '42', '49',
'C', 'The answer is P(7,2)=42.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_021', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_022', 'challenge', 'How many ordered selections of 3 objects can be made from 7 distinct objects?',
'210', '35', '207', '343',
'A', 'The answer is P(7,3)=210.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_022', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_023', 'challenge', 'How many ordered selections of 4 objects can be made from 7 distinct objects?',
'840', '836', '2401', '35',
'A', 'The answer is P(7,4)=840.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_023', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_024', 'challenge', 'How many ordered selections of 2 objects can be made from 8 distinct objects?',
'54', '56', '28', '64',
'B', 'The answer is P(8,2)=56.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_024', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_025', 'challenge', 'How many ordered selections of 3 objects can be made from 8 distinct objects?',
'336', '512', '56', '333',
'A', 'The answer is P(8,3)=336.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='PERMUTATIONS_COMBINATIONS' AND st.subtopic_code='PERMUTATIONS_COMBINATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PERMUTATIONS_COMBINATIONS_BANK_025', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_PERMUTATIONS_COMBINATIONS_025';

-- BINOMIAL_THEOREM
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_006', 'medium', 'In (1+x)^5, what is the coefficient of x^1?',
'1', '4', '5', '6',
'C', 'The coefficient is C(5,1)=5.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_006', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_007', 'medium', 'In (1+x)^6, what is the coefficient of x^2?',
'15', '13', '12', '17',
'A', 'The coefficient is C(6,2)=15.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_007', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_008', 'medium', 'In (1+x)^7, what is the coefficient of x^3?',
'35', '32', '38', '21',
'A', 'The coefficient is C(7,3)=35.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_008', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_009', 'medium', 'In (1+x)^8, what is the coefficient of x^2?',
'16', '30', '26', '28',
'D', 'The coefficient is C(8,2)=28.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_009', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_010', 'medium', 'In (1+x)^9, what is the coefficient of x^4?',
'122', '130', '126', '36',
'C', 'The coefficient is C(9,4)=126.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_010', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_011', 'medium', 'In (1+x)^10, what is the coefficient of x^3?',
'117', '120', '30', '123',
'B', 'The coefficient is C(10,3)=120.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_011', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_012', 'medium', 'In (1+x)^11, what is the coefficient of x^2?',
'57', '53', '22', '55',
'D', 'The coefficient is C(11,2)=55.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_012', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_013', 'medium', 'In (1+x)^12, what is the coefficient of x^5?',
'792', '60', '787', '797',
'A', 'The coefficient is C(12,5)=792.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_013', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_014', 'medium', 'In (1+x)^13, what is the coefficient of x^4?',
'715', '719', '52', '711',
'A', 'The coefficient is C(13,4)=715.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_014', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_015', 'medium', 'In (1+x)^14, what is the coefficient of x^3?',
'367', '364', '361', '42',
'B', 'The coefficient is C(14,3)=364.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_015', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_016', 'medium', 'In (1+x)^15, what is the coefficient of x^2?',
'105', '30', '103', '107',
'A', 'The coefficient is C(15,2)=105.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_016', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_017', 'medium', 'In (1+x)^8, what is the coefficient of x^4?',
'74', '32', '66', '70',
'D', 'The coefficient is C(8,4)=70.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_017', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_018', 'challenge', 'In (1+x)^9, what is the coefficient of x^2?',
'34', '36', '18', '38',
'B', 'The coefficient is C(9,2)=36.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_018', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_019', 'challenge', 'In (1+x)^10, what is the coefficient of x^5?',
'257', '252', '247', '50',
'B', 'The coefficient is C(10,5)=252.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_019', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_020', 'challenge', 'In (1+x)^11, what is the coefficient of x^4?',
'44', '326', '334', '330',
'D', 'The coefficient is C(11,4)=330.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_020', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_021', 'challenge', 'In (1+x)^12, what is the coefficient of x^3?',
'36', '220', '223', '217',
'B', 'The coefficient is C(12,3)=220.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_021', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_022', 'challenge', 'In (1+x)^13, what is the coefficient of x^5?',
'65', '1282', '1292', '1287',
'D', 'The coefficient is C(13,5)=1287.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_022', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_023', 'challenge', 'In (1+x)^14, what is the coefficient of x^6?',
'84', '2997', '3003', '3009',
'C', 'The coefficient is C(14,6)=3003.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_023', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_024', 'challenge', 'In (1+x)^15, what is the coefficient of x^7?',
'6442', '6435', '105', '6428',
'B', 'The coefficient is C(15,7)=6435.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_024', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_025', 'challenge', 'In (1+x)^16, what is the coefficient of x^4?',
'1820', '64', '1816', '1824',
'A', 'The coefficient is C(16,4)=1820.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='BINOMIAL_THEOREM' AND st.subtopic_code='BINOMIAL_THEOREM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'BINOMIAL_THEOREM_BANK_025', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_BINOMIAL_THEOREM_025';

-- SEQUENCES_SERIES
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_006', 'medium', 'An AP has first term 2 and common difference 3. Find its 8th term.',
'23', '26', '1', '20',
'A', 'a_n=a+(n-1)d=23.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_006', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_007', 'medium', 'An AP has first term 3 and common difference 4. Find its 9th term.',
'39', '1', '31', '35',
'D', 'a_n=a+(n-1)d=35.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_007', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_008', 'medium', 'An AP has first term 4 and common difference 5. Find its 10th term.',
'1', '49', '54', '44',
'B', 'a_n=a+(n-1)d=49.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_008', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_009', 'medium', 'An AP has first term 5 and common difference 6. Find its 11th term.',
'65', '71', '1', '59',
'A', 'a_n=a+(n-1)d=65.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_009', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_010', 'medium', 'An AP has first term 6 and common difference 7. Find its 12th term.',
'83', '90', '76', '1',
'A', 'a_n=a+(n-1)d=83.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_010', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_011', 'medium', 'An AP has first term 7 and common difference 8. Find its 13th term.',
'111', '95', '103', '1',
'C', 'a_n=a+(n-1)d=103.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_011', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_012', 'medium', 'An AP has first term 8 and common difference 9. Find its 14th term.',
'1', '134', '116', '125',
'D', 'a_n=a+(n-1)d=125.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_012', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_013', 'medium', 'An AP has first term 9 and common difference 10. Find its 15th term.',
'1', '139', '159', '149',
'D', 'a_n=a+(n-1)d=149.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_013', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_014', 'medium', 'An AP has first term 10 and common difference 11. Find its 16th term.',
'175', '186', '164', '1',
'A', 'a_n=a+(n-1)d=175.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_014', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_015', 'medium', 'An AP has first term 11 and common difference 12. Find its 17th term.',
'191', '203', '1', '215',
'B', 'a_n=a+(n-1)d=203.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_015', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_016', 'challenge', 'A GP has first term 1 and common ratio 2. Find its 4th term.',
'8', '16', '10', '4',
'A', 'a_n=ar^(n-1)=1×2^3=8.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_016', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_017', 'challenge', 'A GP has first term 2 and common ratio 2. Find its 5th term.',
'32', '64', '16', '34',
'A', 'a_n=ar^(n-1)=2×2^4=32.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_017', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_018', 'challenge', 'A GP has first term 3 and common ratio 2. Find its 6th term.',
'98', '96', '192', '48',
'B', 'a_n=ar^(n-1)=3×2^5=96.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_018', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_019', 'challenge', 'A GP has first term 4 and common ratio 2. Find its 7th term.',
'256', '258', '512', '128',
'A', 'a_n=ar^(n-1)=4×2^6=256.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_019', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_020', 'challenge', 'A GP has first term 5 and common ratio 2. Find its 8th term.',
'642', '1280', '320', '640',
'D', 'a_n=ar^(n-1)=5×2^7=640.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_020', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_021', 'challenge', 'A GP has first term 6 and common ratio 2. Find its 9th term.',
'768', '1538', '3072', '1536',
'D', 'a_n=ar^(n-1)=6×2^8=1536.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_021', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_022', 'challenge', 'A GP has first term 7 and common ratio 2. Find its 10th term.',
'3586', '3584', '1792', '7168',
'B', 'a_n=ar^(n-1)=7×2^9=3584.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_022', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_023', 'challenge', 'A GP has first term 8 and common ratio 2. Find its 11th term.',
'4096', '8194', '16384', '8192',
'D', 'a_n=ar^(n-1)=8×2^10=8192.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_023', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_024', 'challenge', 'A GP has first term 9 and common ratio 2. Find its 12th term.',
'36864', '18434', '9216', '18432',
'D', 'a_n=ar^(n-1)=9×2^11=18432.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_024', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_025', 'challenge', 'A GP has first term 10 and common ratio 2. Find its 13th term.',
'40960', '40962', '81920', '20480',
'A', 'a_n=ar^(n-1)=10×2^12=40960.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='SEQUENCES_SERIES' AND st.subtopic_code='SEQUENCES_SERIES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'SEQUENCES_SERIES_BANK_025', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_SEQUENCES_SERIES_025';

-- LIMITS_CONTINUITY_DIFFERENTIABILITY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_006', 'medium', 'If f(x)=x²+2x, find f''(1).',
'3', '2', '4', '5',
'C', 'f''(x)=2x+2; f''(1)=4.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_006', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_007', 'medium', 'If f(x)=x²+3x, find f''(2).',
'8', '6', '4', '7',
'D', 'f''(x)=2x+3; f''(2)=7.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_007', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_008', 'medium', 'If f(x)=x²+4x, find f''(3).',
'6', '9', '10', '11',
'C', 'f''(x)=2x+4; f''(3)=10.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_008', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_009', 'medium', 'If f(x)=x²+5x, find f''(4).',
'12', '13', '8', '14',
'B', 'f''(x)=2x+5; f''(4)=13.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_009', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_010', 'medium', 'If f(x)=x²+6x, find f''(5).',
'17', '15', '10', '16',
'D', 'f''(x)=2x+6; f''(5)=16.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_010', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_011', 'medium', 'If f(x)=x²+7x, find f''(6).',
'12', '20', '18', '19',
'D', 'f''(x)=2x+7; f''(6)=19.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_011', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_012', 'medium', 'If f(x)=x²+8x, find f''(7).',
'23', '22', '21', '14',
'B', 'f''(x)=2x+8; f''(7)=22.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_012', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_013', 'medium', 'If f(x)=x²+9x, find f''(8).',
'25', '24', '16', '26',
'A', 'f''(x)=2x+9; f''(8)=25.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_013', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_014', 'medium', 'If f(x)=x²+10x, find f''(9).',
'29', '18', '28', '27',
'C', 'f''(x)=2x+10; f''(9)=28.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_014', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_015', 'medium', 'If f(x)=x²+11x, find f''(10).',
'31', '32', '20', '30',
'A', 'f''(x)=2x+11; f''(10)=31.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_015', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_016', 'challenge', 'Evaluate lim(x→2) (x²-4)/(x-2).',
'5', '1', '4', '2',
'C', 'Factor x²-4=(x-2)(x+2); the limit is 4.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_016', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_017', 'challenge', 'Evaluate lim(x→3) (x²-9)/(x-3).',
'7', '6', '9', '3',
'B', 'Factor x²-9=(x-3)(x+3); the limit is 6.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_017', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_018', 'challenge', 'Evaluate lim(x→4) (x²-16)/(x-4).',
'8', '4', '9', '16',
'A', 'Factor x²-16=(x-4)(x+4); the limit is 8.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_018', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_019', 'challenge', 'Evaluate lim(x→5) (x²-25)/(x-5).',
'10', '11', '5', '25',
'A', 'Factor x²-25=(x-5)(x+5); the limit is 10.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_019', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_020', 'challenge', 'Evaluate lim(x→6) (x²-36)/(x-6).',
'12', '13', '6', '36',
'A', 'Factor x²-36=(x-6)(x+6); the limit is 12.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_020', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_021', 'challenge', 'Evaluate lim(x→7) (x²-49)/(x-7).',
'14', '15', '49', '7',
'A', 'Factor x²-49=(x-7)(x+7); the limit is 14.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_021', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_022', 'challenge', 'Evaluate lim(x→8) (x²-64)/(x-8).',
'8', '16', '17', '64',
'B', 'Factor x²-64=(x-8)(x+8); the limit is 16.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_022', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_023', 'challenge', 'Evaluate lim(x→9) (x²-81)/(x-9).',
'81', '19', '9', '18',
'D', 'Factor x²-81=(x-9)(x+9); the limit is 18.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_023', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_024', 'challenge', 'Evaluate lim(x→10) (x²-100)/(x-10).',
'21', '10', '20', '100',
'C', 'Factor x²-100=(x-10)(x+10); the limit is 20.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_024', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_025', 'challenge', 'Evaluate lim(x→11) (x²-121)/(x-11).',
'121', '22', '23', '11',
'B', 'Factor x²-121=(x-11)(x+11); the limit is 22.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY' AND st.subtopic_code='LIMITS_CONTINUITY_DIFFERENTIABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LIMITS_CONTINUITY_DIFFERENTIABILITY_BANK_025', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_LIMITS_CONTINUITY_DIFFERENTIABILITY_025';

-- INTEGRAL_CALCULUS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_006', 'medium', 'Evaluate ∫₀¹ 2x^1 dx.',
'3', '2', '2/3', '1',
'D', '∫₀¹2x^1dx=2/(1+1)=1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_006', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_007', 'medium', 'Evaluate ∫₀¹ 3x^2 dx.',
'1', '3', '3/4', '3/2',
'A', '∫₀¹3x^2dx=3/(2+1)=1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_007', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_008', 'medium', 'Evaluate ∫₀¹ 4x^3 dx.',
'1', '4/3', '4/5', '4',
'A', '∫₀¹4x^3dx=4/(3+1)=1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_008', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_009', 'medium', 'Evaluate ∫₀¹ 5x^4 dx.',
'5/6', '1', '5', '5/4',
'B', '∫₀¹5x^4dx=5/(4+1)=1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_009', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_010', 'medium', 'Evaluate ∫₀¹ 6x^5 dx.',
'1', '6/7', '6/5', '6',
'A', '∫₀¹6x^5dx=6/(5+1)=1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_010', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_011', 'medium', 'Evaluate ∫₀¹ 7x^6 dx.',
'1', '7/6', '7', '7/8',
'A', '∫₀¹7x^6dx=7/(6+1)=1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_011', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_012', 'medium', 'Evaluate ∫₀¹ 8x^7 dx.',
'8', '1', '8/7', '8/9',
'B', '∫₀¹8x^7dx=8/(7+1)=1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_012', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_013', 'medium', 'Evaluate ∫₀¹ 9x^8 dx.',
'9/10', '1', '9', '9/8',
'B', '∫₀¹9x^8dx=9/(8+1)=1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_013', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_014', 'medium', 'Evaluate ∫₀¹ 10x^9 dx.',
'1', '10/9', '10/11', '10',
'A', '∫₀¹10x^9dx=10/(9+1)=1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_014', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_015', 'medium', 'Evaluate ∫₀¹ 11x^10 dx.',
'11/12', '11/10', '11', '1',
'D', '∫₀¹11x^10dx=11/(10+1)=1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_015', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_016', 'challenge', 'Find the area under y=x from x=0 to x=2.',
'4', '3', '1', '2',
'D', 'Area=∫₀^2x dx=2²/2=2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_016', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_017', 'challenge', 'Find the area under y=x from x=0 to x=3.',
'3/2', '3', '9/2', '9',
'C', 'Area=∫₀^3x dx=3²/2=9/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_017', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_018', 'challenge', 'Find the area under y=x from x=0 to x=4.',
'16', '8', '4', '2',
'B', 'Area=∫₀^4x dx=4²/2=8.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_018', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_019', 'challenge', 'Find the area under y=x from x=0 to x=5.',
'25/2', '5/2', '25', '5',
'A', 'Area=∫₀^5x dx=5²/2=25/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_019', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_020', 'challenge', 'Find the area under y=x from x=0 to x=6.',
'3', '18', '36', '6',
'B', 'Area=∫₀^6x dx=6²/2=18.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_020', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_021', 'challenge', 'Find the area under y=x from x=0 to x=7.',
'49', '49/2', '7', '7/2',
'B', 'Area=∫₀^7x dx=7²/2=49/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_021', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_022', 'challenge', 'Find the area under y=x from x=0 to x=8.',
'8', '64', '32', '4',
'C', 'Area=∫₀^8x dx=8²/2=32.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_022', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_023', 'challenge', 'Find the area under y=x from x=0 to x=9.',
'9', '81', '9/2', '81/2',
'D', 'Area=∫₀^9x dx=9²/2=81/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_023', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_024', 'challenge', 'Find the area under y=x from x=0 to x=10.',
'50', '100', '5', '10',
'A', 'Area=∫₀^10x dx=10²/2=50.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_024', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_025', 'challenge', 'Find the area under y=x from x=0 to x=11.',
'11', '121', '121/2', '11/2',
'C', 'Area=∫₀^11x dx=11²/2=121/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='INTEGRAL_CALCULUS' AND st.subtopic_code='INTEGRAL_CALCULUS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'INTEGRAL_CALCULUS_BANK_025', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_INTEGRAL_CALCULUS_025';

-- DIFFERENTIAL_EQUATIONS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_006', 'medium', 'If dy/dx=2 and y(0)=1, find y(1).',
'4', '1', '2', '3',
'D', 'y=2x+1; hence y(1)=3.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_006', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_007', 'medium', 'If dy/dx=3 and y(0)=2, find y(2).',
'7', '6', '9', '8',
'D', 'y=3x+2; hence y(2)=8.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_007', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_008', 'medium', 'If dy/dx=4 and y(0)=3, find y(3).',
'16', '12', '15', '14',
'C', 'y=4x+3; hence y(3)=15.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_008', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_009', 'medium', 'If dy/dx=5 and y(0)=4, find y(4).',
'24', '20', '23', '25',
'A', 'y=5x+4; hence y(4)=24.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_009', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_010', 'medium', 'If dy/dx=6 and y(0)=5, find y(5).',
'34', '36', '35', '30',
'C', 'y=6x+5; hence y(5)=35.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_010', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_011', 'medium', 'If dy/dx=7 and y(0)=6, find y(6).',
'48', '42', '47', '49',
'A', 'y=7x+6; hence y(6)=48.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_011', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_012', 'medium', 'If dy/dx=8 and y(0)=7, find y(7).',
'64', '63', '62', '56',
'B', 'y=8x+7; hence y(7)=63.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_012', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_013', 'medium', 'If dy/dx=9 and y(0)=8, find y(8).',
'79', '72', '81', '80',
'D', 'y=9x+8; hence y(8)=80.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_013', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_014', 'medium', 'If dy/dx=10 and y(0)=9, find y(9).',
'90', '99', '100', '98',
'B', 'y=10x+9; hence y(9)=99.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_014', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_015', 'medium', 'If dy/dx=11 and y(0)=10, find y(10).',
'120', '110', '119', '121',
'A', 'y=11x+10; hence y(10)=120.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_015', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_016', 'challenge', 'If dy/dx=1x and y(0)=0, find y(2).',
'1', '4', '3', '2',
'D', 'y=1x²/2; at x=2, y=2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_016', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_017', 'challenge', 'If dy/dx=2x and y(0)=0, find y(3).',
'10', '9', '6', '18',
'B', 'y=2x²/2; at x=3, y=9.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_017', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_018', 'challenge', 'If dy/dx=3x and y(0)=0, find y(4).',
'12', '48', '25', '24',
'D', 'y=3x²/2; at x=4, y=24.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_018', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_019', 'challenge', 'If dy/dx=4x and y(0)=0, find y(5).',
'50', '51', '100', '20',
'A', 'y=4x²/2; at x=5, y=50.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_019', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_020', 'challenge', 'If dy/dx=5x and y(0)=0, find y(6).',
'91', '90', '180', '30',
'B', 'y=5x²/2; at x=6, y=90.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_020', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_021', 'challenge', 'If dy/dx=6x and y(0)=0, find y(7).',
'147', '42', '294', '148',
'A', 'y=6x²/2; at x=7, y=147.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_021', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_022', 'challenge', 'If dy/dx=7x and y(0)=0, find y(8).',
'448', '225', '56', '224',
'D', 'y=7x²/2; at x=8, y=224.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_022', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_023', 'challenge', 'If dy/dx=8x and y(0)=0, find y(9).',
'325', '72', '648', '324',
'D', 'y=8x²/2; at x=9, y=324.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_023', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_024', 'challenge', 'If dy/dx=9x and y(0)=0, find y(10).',
'451', '900', '450', '90',
'C', 'y=9x²/2; at x=10, y=450.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_024', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_025', 'challenge', 'If dy/dx=10x and y(0)=0, find y(11).',
'1210', '110', '605', '606',
'C', 'y=10x²/2; at x=11, y=605.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='DIFFERENTIAL_EQUATIONS' AND st.subtopic_code='DIFFERENTIAL_EQUATIONS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DIFFERENTIAL_EQUATIONS_BANK_025', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_DIFFERENTIAL_EQUATIONS_025';

-- COORDINATE_GEOMETRY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_006', 'medium', 'Find the distance between (0,0) and (3,4).',
'5', '6', '7', '4',
'A', 'The coordinate differences are 3 and 4, so distance=√(3²+4²)=5.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_006', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_007', 'medium', 'Find the distance between (1,2) and (4,6).',
'7', '4', '6', '5',
'D', 'The coordinate differences are 3 and 4, so distance=√(3²+4²)=5.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_007', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_008', 'medium', 'Find the distance between (2,4) and (5,8).',
'6', '7', '5', '4',
'C', 'The coordinate differences are 3 and 4, so distance=√(3²+4²)=5.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_008', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_009', 'medium', 'Find the distance between (3,6) and (6,10).',
'4', '5', '7', '6',
'B', 'The coordinate differences are 3 and 4, so distance=√(3²+4²)=5.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_009', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_010', 'medium', 'Find the distance between (4,8) and (7,12).',
'4', '6', '5', '7',
'C', 'The coordinate differences are 3 and 4, so distance=√(3²+4²)=5.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_010', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_011', 'medium', 'Find the distance between (5,10) and (8,14).',
'4', '7', '6', '5',
'D', 'The coordinate differences are 3 and 4, so distance=√(3²+4²)=5.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_011', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_012', 'medium', 'Find the distance between (6,12) and (9,16).',
'4', '6', '7', '5',
'D', 'The coordinate differences are 3 and 4, so distance=√(3²+4²)=5.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_012', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_013', 'medium', 'Find the distance between (7,14) and (10,18).',
'5', '4', '7', '6',
'A', 'The coordinate differences are 3 and 4, so distance=√(3²+4²)=5.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_013', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_014', 'medium', 'Find the distance between (8,16) and (11,20).',
'7', '4', '6', '5',
'D', 'The coordinate differences are 3 and 4, so distance=√(3²+4²)=5.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_014', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_015', 'medium', 'Find the distance between (9,18) and (12,22).',
'5', '7', '4', '6',
'A', 'The coordinate differences are 3 and 4, so distance=√(3²+4²)=5.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_015', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_016', 'challenge', 'Find the slope of the line through (0,1) and (2,5).',
'2', '4', '1', '3',
'A', 'Slope=(5-1)/(2-0)=2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_016', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_017', 'challenge', 'Find the slope of the line through (1,2) and (3,8).',
'3', '4', '6', '2',
'A', 'Slope=(8-2)/(3-1)=3.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_017', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_018', 'challenge', 'Find the slope of the line through (2,3) and (4,11).',
'4', '5', '8', '3',
'A', 'Slope=(11-3)/(4-2)=4.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_018', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_019', 'challenge', 'Find the slope of the line through (3,4) and (5,14).',
'6', '10', '5', '4',
'C', 'Slope=(14-4)/(5-3)=5.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_019', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_020', 'challenge', 'Find the slope of the line through (4,5) and (6,17).',
'12', '7', '6', '5',
'C', 'Slope=(17-5)/(6-4)=6.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_020', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_021', 'challenge', 'Find the slope of the line through (5,6) and (7,20).',
'8', '6', '7', '14',
'C', 'Slope=(20-6)/(7-5)=7.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_021', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_022', 'challenge', 'Find the slope of the line through (6,7) and (8,23).',
'8', '7', '16', '9',
'A', 'Slope=(23-7)/(8-6)=8.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_022', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_023', 'challenge', 'Find the slope of the line through (7,8) and (9,26).',
'18', '10', '8', '9',
'D', 'Slope=(26-8)/(9-7)=9.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_023', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_024', 'challenge', 'Find the slope of the line through (8,9) and (10,29).',
'9', '20', '11', '10',
'D', 'Slope=(29-9)/(10-8)=10.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_024', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_025', 'challenge', 'Find the slope of the line through (9,10) and (11,32).',
'12', '11', '22', '10',
'B', 'Slope=(32-10)/(11-9)=11.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='COORDINATE_GEOMETRY' AND st.subtopic_code='COORDINATE_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'COORDINATE_GEOMETRY_BANK_025', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_COORDINATE_GEOMETRY_025';

-- THREE_D_GEOMETRY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_006', 'medium', 'Find the square of the distance from the origin to (1,2,3).',
'14', '15', '6', '13',
'A', 'Distance²=1²+2²+3²=14.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_006', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_007', 'medium', 'Find the square of the distance from the origin to (2,3,4).',
'9', '30', '28', '29',
'D', 'Distance²=2²+3²+4²=29.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_007', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_008', 'medium', 'Find the square of the distance from the origin to (3,4,5).',
'51', '50', '12', '49',
'B', 'Distance²=3²+4²+5²=50.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_008', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_009', 'medium', 'Find the square of the distance from the origin to (4,5,6).',
'15', '78', '77', '76',
'C', 'Distance²=4²+5²+6²=77.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_009', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_010', 'medium', 'Find the square of the distance from the origin to (5,6,7).',
'109', '18', '111', '110',
'D', 'Distance²=5²+6²+7²=110.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_010', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_011', 'medium', 'Find the square of the distance from the origin to (6,7,8).',
'21', '148', '149', '150',
'C', 'Distance²=6²+7²+8²=149.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_011', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_012', 'medium', 'Find the square of the distance from the origin to (7,8,9).',
'193', '195', '194', '24',
'C', 'Distance²=7²+8²+9²=194.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_012', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_013', 'medium', 'Find the square of the distance from the origin to (8,9,10).',
'244', '245', '246', '27',
'B', 'Distance²=8²+9²+10²=245.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_013', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_014', 'medium', 'Find the square of the distance from the origin to (9,10,11).',
'301', '30', '302', '303',
'C', 'Distance²=9²+10²+11²=302.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_014', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_015', 'medium', 'Find the square of the distance from the origin to (10,11,12).',
'33', '366', '364', '365',
'D', 'Distance²=10²+11²+12²=365.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_015', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_016', 'challenge', 'Give a normal vector to the plane 2x+3y+4z=10.',
'(3,2,4)', '(1,1,1)', '(2,4,3)', '(2,3,4)',
'D', 'The coefficients of x,y,z form a normal vector (2,3,4).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_016', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_017', 'challenge', 'Give a normal vector to the plane 3x+4y+5z=10.',
'(4,3,5)', '(3,4,5)', '(3,5,4)', '(1,1,1)',
'B', 'The coefficients of x,y,z form a normal vector (3,4,5).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_017', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_018', 'challenge', 'Give a normal vector to the plane 4x+5y+6z=10.',
'(4,5,6)', '(4,6,5)', '(5,4,6)', '(1,1,1)',
'A', 'The coefficients of x,y,z form a normal vector (4,5,6).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_018', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_019', 'challenge', 'Give a normal vector to the plane 5x+6y+7z=10.',
'(1,1,1)', '(5,6,7)', '(5,7,6)', '(6,5,7)',
'B', 'The coefficients of x,y,z form a normal vector (5,6,7).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_019', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_020', 'challenge', 'Give a normal vector to the plane 6x+7y+8z=10.',
'(6,8,7)', '(7,6,8)', '(6,7,8)', '(1,1,1)',
'C', 'The coefficients of x,y,z form a normal vector (6,7,8).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_020', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_021', 'challenge', 'Give a normal vector to the plane 7x+8y+9z=10.',
'(7,9,8)', '(7,8,9)', '(8,7,9)', '(1,1,1)',
'B', 'The coefficients of x,y,z form a normal vector (7,8,9).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_021', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_022', 'challenge', 'Give a normal vector to the plane 8x+9y+10z=10.',
'(8,9,10)', '(9,8,10)', '(1,1,1)', '(8,10,9)',
'A', 'The coefficients of x,y,z form a normal vector (8,9,10).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_022', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_023', 'challenge', 'Give a normal vector to the plane 9x+10y+11z=10.',
'(9,11,10)', '(1,1,1)', '(10,9,11)', '(9,10,11)',
'D', 'The coefficients of x,y,z form a normal vector (9,10,11).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_023', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_024', 'challenge', 'Give a normal vector to the plane 10x+11y+12z=10.',
'(10,12,11)', '(11,10,12)', '(1,1,1)', '(10,11,12)',
'D', 'The coefficients of x,y,z form a normal vector (10,11,12).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_024', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_025', 'challenge', 'Give a normal vector to the plane 11x+12y+13z=10.',
'(12,11,13)', '(1,1,1)', '(11,13,12)', '(11,12,13)',
'D', 'The coefficients of x,y,z form a normal vector (11,12,13).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='THREE_D_GEOMETRY' AND st.subtopic_code='THREE_D_GEOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THREE_D_GEOMETRY_BANK_025', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_THREE_D_GEOMETRY_025';

-- VECTOR_ALGEBRA
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_006', 'medium', 'For vectors a=(1,2) and b=(3,4), find a·b.',
'1', '11', '10', '12',
'B', 'a·b=1×3+2×4=11.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_006', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_007', 'medium', 'For vectors a=(2,3) and b=(4,5), find a·b.',
'24', '22', '23', '14',
'C', 'a·b=2×4+3×5=23.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_007', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_008', 'medium', 'For vectors a=(3,4) and b=(5,6), find a·b.',
'39', '40', '38', '18',
'A', 'a·b=3×5+4×6=39.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_008', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_009', 'medium', 'For vectors a=(4,5) and b=(6,7), find a·b.',
'22', '60', '59', '58',
'C', 'a·b=4×6+5×7=59.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_009', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_010', 'medium', 'For vectors a=(5,6) and b=(7,8), find a·b.',
'82', '26', '83', '84',
'C', 'a·b=5×7+6×8=83.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_010', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_011', 'medium', 'For vectors a=(6,7) and b=(8,9), find a·b.',
'30', '112', '111', '110',
'C', 'a·b=6×8+7×9=111.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_011', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_012', 'medium', 'For vectors a=(7,8) and b=(9,10), find a·b.',
'143', '142', '34', '144',
'A', 'a·b=7×9+8×10=143.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_012', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_013', 'medium', 'For vectors a=(8,9) and b=(10,11), find a·b.',
'38', '179', '180', '178',
'B', 'a·b=8×10+9×11=179.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_013', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_014', 'medium', 'For vectors a=(9,10) and b=(11,12), find a·b.',
'218', '219', '42', '220',
'B', 'a·b=9×11+10×12=219.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_014', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_015', 'medium', 'For vectors a=(10,11) and b=(12,13), find a·b.',
'262', '263', '264', '46',
'B', 'a·b=10×12+11×13=263.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_015', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_016', 'challenge', 'For v=(2,5), find |v|².',
'29', '30', '7', '3',
'A', '|v|²=2²+5²=29.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_016', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_017', 'challenge', 'For v=(3,6), find |v|².',
'45', '46', '3', '9',
'A', '|v|²=3²+6²=45.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_017', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_018', 'challenge', 'For v=(4,7), find |v|².',
'65', '66', '11', '3',
'A', '|v|²=4²+7²=65.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_018', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_019', 'challenge', 'For v=(5,8), find |v|².',
'13', '90', '3', '89',
'D', '|v|²=5²+8²=89.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_019', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_020', 'challenge', 'For v=(6,9), find |v|².',
'117', '15', '118', '3',
'A', '|v|²=6²+9²=117.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_020', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_021', 'challenge', 'For v=(7,10), find |v|².',
'149', '3', '150', '17',
'A', '|v|²=7²+10²=149.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_021', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_022', 'challenge', 'For v=(8,11), find |v|².',
'19', '186', '3', '185',
'D', '|v|²=8²+11²=185.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_022', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_023', 'challenge', 'For v=(9,12), find |v|².',
'225', '21', '3', '226',
'A', '|v|²=9²+12²=225.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_023', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_024', 'challenge', 'For v=(10,13), find |v|².',
'3', '23', '269', '270',
'C', '|v|²=10²+13²=269.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_024', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_025', 'challenge', 'For v=(11,14), find |v|².',
'3', '317', '318', '25',
'B', '|v|²=11²+14²=317.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='VECTOR_ALGEBRA' AND st.subtopic_code='VECTOR_ALGEBRA_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'VECTOR_ALGEBRA_BANK_025', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_VECTOR_ALGEBRA_025';

-- STATISTICS_PROBABILITY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_006', 'medium', 'Find the mean of 1, 3, 5, 7.',
'4', '5', '3', '16',
'A', 'Mean=(1+3+5+7)/4=4.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_006', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_007', 'medium', 'Find the mean of 2, 4, 6, 8.',
'6', '4', '20', '5',
'D', 'Mean=(2+4+6+8)/4=5.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_007', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_008', 'medium', 'Find the mean of 3, 5, 7, 9.',
'7', '6', '24', '5',
'B', 'Mean=(3+5+7+9)/4=6.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_008', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_009', 'medium', 'Find the mean of 4, 6, 8, 10.',
'7', '28', '6', '8',
'A', 'Mean=(4+6+8+10)/4=7.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_009', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_010', 'medium', 'Find the mean of 5, 7, 9, 11.',
'32', '9', '8', '7',
'C', 'Mean=(5+7+9+11)/4=8.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_010', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_011', 'medium', 'Find the mean of 6, 8, 10, 12.',
'8', '36', '9', '10',
'C', 'Mean=(6+8+10+12)/4=9.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_011', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_012', 'medium', 'Find the mean of 7, 9, 11, 13.',
'9', '10', '11', '40',
'B', 'Mean=(7+9+11+13)/4=10.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_012', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_013', 'medium', 'Find the mean of 8, 10, 12, 14.',
'10', '11', '44', '12',
'B', 'Mean=(8+10+12+14)/4=11.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_013', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_014', 'medium', 'Find the mean of 9, 11, 13, 15.',
'12', '11', '13', '48',
'A', 'Mean=(9+11+13+15)/4=12.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_014', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_015', 'medium', 'Find the mean of 10, 12, 14, 16.',
'13', '52', '12', '14',
'A', 'Mean=(10+12+14+16)/4=13.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_015', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_016', 'challenge', 'An experiment has 10 equally likely outcomes and 2 favorable outcomes. Find the probability.',
'2/11', '4/5', '1/5', '1/10',
'C', 'Probability=2/10=1/5.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_016', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_017', 'challenge', 'An experiment has 11 equally likely outcomes and 3 favorable outcomes. Find the probability.',
'3/11', '1/11', '8/11', '1/4',
'A', 'Probability=3/11=3/11.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_017', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_018', 'challenge', 'An experiment has 12 equally likely outcomes and 4 favorable outcomes. Find the probability.',
'1/3', '4/13', '1/12', '2/3',
'A', 'Probability=4/12=1/3.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_018', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_019', 'challenge', 'An experiment has 13 equally likely outcomes and 5 favorable outcomes. Find the probability.',
'5/14', '1/13', '8/13', '5/13',
'D', 'Probability=5/13=5/13.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_019', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_020', 'challenge', 'An experiment has 14 equally likely outcomes and 6 favorable outcomes. Find the probability.',
'2/5', '1/14', '3/7', '4/7',
'C', 'Probability=6/14=3/7.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_020', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_021', 'challenge', 'An experiment has 15 equally likely outcomes and 7 favorable outcomes. Find the probability.',
'7/15', '1/15', '7/16', '8/15',
'A', 'Probability=7/15=7/15.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_021', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_022', 'challenge', 'An experiment has 16 equally likely outcomes and 8 favorable outcomes. Find the probability.',
'1/2', '8/17', '1/16', '1',
'A', 'Probability=8/16=1/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_022', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_023', 'challenge', 'An experiment has 17 equally likely outcomes and 9 favorable outcomes. Find the probability.',
'9/17', '8/17', '1/2', '1/17',
'A', 'Probability=9/17=9/17.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_023', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_024', 'challenge', 'An experiment has 18 equally likely outcomes and 10 favorable outcomes. Find the probability.',
'1/18', '4/9', '10/19', '5/9',
'D', 'Probability=10/18=5/9.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_024', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_025', 'challenge', 'An experiment has 19 equally likely outcomes and 11 favorable outcomes. Find the probability.',
'11/19', '8/19', '11/20', '1/19',
'A', 'Probability=11/19=11/19.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='STATISTICS_PROBABILITY' AND st.subtopic_code='STATISTICS_PROBABILITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'STATISTICS_PROBABILITY_BANK_025', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_STATISTICS_PROBABILITY_025';

-- TRIGONOMETRY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_006', 'medium', 'sin 0° equals:',
'1/2', 'sqrt(3)/2', '1', '0',
'D', 'Using standard trigonometric values/identities, the result is 0.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_006', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_007', 'medium', 'cos 0° equals:',
'0', 'sqrt(2)/2', '1/2', '1',
'D', 'Using standard trigonometric values/identities, the result is 1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_007', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_008', 'medium', 'sin 30° equals:',
'sqrt(2)/2', '1/2', '0', 'sqrt(3)/2',
'B', 'Using standard trigonometric values/identities, the result is 1/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_008', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_009', 'medium', 'cos 30° equals:',
'1', 'sqrt(3)/2', '1/2', 'sqrt(2)/2',
'B', 'Using standard trigonometric values/identities, the result is sqrt(3)/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_009', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_010', 'medium', 'tan 30° equals:',
'1/2', '1', '1/sqrt(3)', 'sqrt(3)',
'C', 'Using standard trigonometric values/identities, the result is 1/sqrt(3).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_010', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_011', 'medium', 'sin 45° equals:',
'sqrt(2)/2', 'sqrt(3)/2', '1/2', '1',
'A', 'Using standard trigonometric values/identities, the result is sqrt(2)/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_011', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_012', 'medium', 'cos 45° equals:',
'sqrt(3)/2', '0', 'sqrt(2)/2', '1/2',
'C', 'Using standard trigonometric values/identities, the result is sqrt(2)/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_012', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_013', 'medium', 'tan 45° equals:',
'1/2', '0', '1', 'sqrt(3)',
'C', 'Using standard trigonometric values/identities, the result is 1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_013', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_014', 'medium', 'sin 60° equals:',
'sqrt(3)/2', 'sqrt(2)/2', '1', '1/2',
'A', 'Using standard trigonometric values/identities, the result is sqrt(3)/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_014', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_015', 'medium', 'cos 60° equals:',
'0', 'sqrt(2)/2', '1/2', 'sqrt(3)/2',
'C', 'Using standard trigonometric values/identities, the result is 1/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_015', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_016', 'medium', 'tan 60° equals:',
'sqrt(3)', '1', '2', '1/sqrt(3)',
'A', 'Using standard trigonometric values/identities, the result is sqrt(3).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_016', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_017', 'medium', 'sin 90° equals:',
'0', 'sqrt(3)/2', '1/2', '1',
'D', 'Using standard trigonometric values/identities, the result is 1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_017', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_018', 'medium', 'cos 90° equals:',
'1', 'sqrt(2)/2', '1/2', '0',
'D', 'Using standard trigonometric values/identities, the result is 0.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_018', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_019', 'medium', 'sin²θ+cos²θ equals:',
'sin 2θ', '2', '1', '0',
'C', 'Using standard trigonometric values/identities, the result is 1.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_019', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_020', 'challenge', '1+tan²θ equals:',
'sec²θ', '1', 'cosec²θ', 'cot²θ',
'A', 'Using standard trigonometric values/identities, the result is sec²θ.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_020', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_021', 'challenge', '1+cot²θ equals:',
'cosec²θ', 'tan²θ', 'sec²θ', '1',
'A', 'Using standard trigonometric values/identities, the result is cosec²θ.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_021', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_022', 'challenge', 'sin 2θ equals:',
'2sinθ cosθ', 'sinθ+cosθ', '2tanθ', 'sin²θ-cos²θ',
'A', 'Using standard trigonometric values/identities, the result is 2sinθ cosθ.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_022', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_023', 'challenge', 'cos 2θ equals:',
'cos²θ-sin²θ', '2sinθcosθ', '1', 'sin²θ+cos²θ',
'A', 'Using standard trigonometric values/identities, the result is cos²θ-sin²θ.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_023', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_024', 'challenge', 'If sinθ=3/5 and cosθ=4/5, tanθ is:',
'4/5', '3/5', '3/4', '4/3',
'C', 'Using standard trigonometric values/identities, the result is 3/4.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_024', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIGONOMETRY_025', 'challenge', 'If tanθ=1 and θ is acute, θ is:',
'45°', '30°', '90°', '60°',
'A', 'Using standard trigonometric values/identities, the result is 45°.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH' AND t.topic_code='TRIGONOMETRY' AND st.subtopic_code='TRIGONOMETRY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'TRIGONOMETRY_BANK_025', 'GYAN JEE mathematics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_MATH_TRIGONOMETRY_025';
