-- GENERATED ORIGINAL PRACTICE BANK
PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO education_subjects
(country_code, grade_code, subject_code, subject_name, enabled, sort_order)
VALUES ('IN','PROGRAM_JEE','MATH','JEE Mathematics',1,10);

INSERT OR IGNORE INTO education_topics
(subject_id, topic_code, topic_name, enabled, sort_order)
SELECT id,'MATH','JEE Mathematics',1,10
FROM education_subjects
WHERE country_code='IN' AND grade_code='PROGRAM_JEE' AND subject_code='MATH';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'ALGEBRA','Algebra',1,10
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='MATH';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'CALCULUS','Calculus',1,20
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='MATH';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'TRIG','Trigonometry',1,30
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='MATH';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'LOGS','Logarithms',1,40
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='MATH'
  AND t.topic_code='MATH';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0001',
'easy',
'Solve 2x + 1 = 5.',
'2',
'3',
'1',
'5',
'A',
'Subtract 1, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0002',
'easy',
'Solve 5x + 2 = 17.',
'4',
'2',
'17',
'3',
'D',
'Subtract 2, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0003',
'easy',
'Solve 2x + 3 = 11.',
'3',
'11',
'4',
'5',
'C',
'Subtract 3, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0004',
'easy',
'Solve 5x + 4 = 29.',
'29',
'5',
'6',
'4',
'B',
'Subtract 4, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0005',
'easy',
'Solve 2x + 5 = 17.',
'6',
'7',
'5',
'17',
'A',
'Subtract 5, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0006',
'easy',
'Solve 5x + 6 = 41.',
'8',
'6',
'41',
'7',
'D',
'Subtract 6, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0007',
'easy',
'Solve 2x + 7 = 23.',
'7',
'23',
'8',
'9',
'C',
'Subtract 7, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0008',
'easy',
'Solve 5x + 8 = 53.',
'53',
'9',
'10',
'8',
'B',
'Subtract 8, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0009',
'easy',
'Solve 2x + 9 = 29.',
'10',
'11',
'9',
'29',
'A',
'Subtract 9, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0010',
'easy',
'Solve 5x + 1 = 56.',
'12',
'10',
'56',
'11',
'D',
'Subtract 1, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0011',
'easy',
'Solve 2x + 2 = 26.',
'11',
'26',
'12',
'13',
'C',
'Subtract 2, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0012',
'easy',
'Solve 5x + 3 = 68.',
'68',
'13',
'14',
'12',
'B',
'Subtract 3, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0013',
'easy',
'Solve 2x + 4 = 32.',
'14',
'15',
'13',
'32',
'A',
'Subtract 4, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0014',
'easy',
'Solve 5x + 5 = 80.',
'16',
'14',
'80',
'15',
'D',
'Subtract 5, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0015',
'easy',
'Solve 2x + 6 = 38.',
'15',
'38',
'16',
'17',
'C',
'Subtract 6, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0016',
'easy',
'Solve 5x + 7 = 17.',
'17',
'2',
'3',
'1',
'B',
'Subtract 7, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0017',
'easy',
'Solve 2x + 8 = 14.',
'3',
'4',
'2',
'14',
'A',
'Subtract 8, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0018',
'easy',
'Solve 5x + 9 = 29.',
'5',
'3',
'29',
'4',
'D',
'Subtract 9, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0019',
'easy',
'Solve 2x + 1 = 11.',
'4',
'11',
'5',
'6',
'C',
'Subtract 1, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0020',
'easy',
'Solve 5x + 2 = 32.',
'32',
'6',
'7',
'5',
'B',
'Subtract 2, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0021',
'easy',
'Solve 2x + 3 = 17.',
'7',
'8',
'6',
'17',
'A',
'Subtract 3, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0022',
'easy',
'Solve 5x + 4 = 44.',
'9',
'7',
'44',
'8',
'D',
'Subtract 4, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0023',
'easy',
'Solve 2x + 5 = 23.',
'8',
'23',
'9',
'10',
'C',
'Subtract 5, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0024',
'easy',
'Solve 5x + 6 = 56.',
'56',
'10',
'11',
'9',
'B',
'Subtract 6, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0025',
'easy',
'Solve 2x + 7 = 29.',
'11',
'12',
'10',
'29',
'A',
'Subtract 7, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0026',
'easy',
'Solve 5x + 8 = 68.',
'13',
'11',
'68',
'12',
'D',
'Subtract 8, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0027',
'easy',
'Solve 2x + 9 = 35.',
'12',
'35',
'13',
'14',
'C',
'Subtract 9, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0028',
'easy',
'Solve 5x + 1 = 71.',
'71',
'14',
'15',
'13',
'B',
'Subtract 1, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0029',
'easy',
'Solve 2x + 2 = 32.',
'15',
'16',
'14',
'32',
'A',
'Subtract 2, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0030',
'easy',
'Solve 5x + 3 = 83.',
'17',
'15',
'83',
'16',
'D',
'Subtract 3, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0031',
'easy',
'Solve 2x + 4 = 8.',
'1',
'8',
'2',
'3',
'C',
'Subtract 4, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0032',
'easy',
'Solve 5x + 5 = 20.',
'20',
'3',
'4',
'2',
'B',
'Subtract 5, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0033',
'easy',
'Solve 2x + 6 = 14.',
'4',
'5',
'3',
'14',
'A',
'Subtract 6, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0034',
'easy',
'Solve 5x + 7 = 32.',
'6',
'4',
'32',
'5',
'D',
'Subtract 7, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0035',
'easy',
'Solve 2x + 8 = 20.',
'5',
'20',
'6',
'7',
'C',
'Subtract 8, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0036',
'easy',
'Solve 5x + 9 = 44.',
'44',
'7',
'8',
'6',
'B',
'Subtract 9, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0037',
'easy',
'Solve 2x + 1 = 17.',
'8',
'9',
'7',
'17',
'A',
'Subtract 1, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0038',
'easy',
'Solve 5x + 2 = 47.',
'10',
'8',
'47',
'9',
'D',
'Subtract 2, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0039',
'easy',
'Solve 2x + 3 = 23.',
'9',
'23',
'10',
'11',
'C',
'Subtract 3, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0040',
'easy',
'Solve 5x + 4 = 59.',
'59',
'11',
'12',
'10',
'B',
'Subtract 4, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0041',
'easy',
'Solve 2x + 5 = 29.',
'12',
'13',
'11',
'29',
'A',
'Subtract 5, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0042',
'easy',
'Solve 5x + 6 = 71.',
'14',
'12',
'71',
'13',
'D',
'Subtract 6, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0043',
'easy',
'Solve 2x + 7 = 35.',
'13',
'35',
'14',
'15',
'C',
'Subtract 7, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0044',
'easy',
'Solve 5x + 8 = 83.',
'83',
'15',
'16',
'14',
'B',
'Subtract 8, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0045',
'easy',
'Solve 2x + 9 = 41.',
'16',
'17',
'15',
'41',
'A',
'Subtract 9, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0046',
'easy',
'Solve 5x + 1 = 11.',
'3',
'1',
'11',
'2',
'D',
'Subtract 1, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0047',
'easy',
'Solve 2x + 2 = 8.',
'2',
'8',
'3',
'4',
'C',
'Subtract 2, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0048',
'easy',
'Solve 5x + 3 = 23.',
'23',
'4',
'5',
'3',
'B',
'Subtract 3, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0049',
'easy',
'Solve 2x + 4 = 14.',
'5',
'6',
'4',
'14',
'A',
'Subtract 4, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0050',
'easy',
'Solve 5x + 5 = 35.',
'7',
'5',
'35',
'6',
'D',
'Subtract 5, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0051',
'easy',
'Solve 2x + 6 = 20.',
'6',
'20',
'7',
'8',
'C',
'Subtract 6, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0052',
'easy',
'Solve 5x + 7 = 47.',
'47',
'8',
'9',
'7',
'B',
'Subtract 7, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0053',
'easy',
'Solve 2x + 8 = 26.',
'9',
'10',
'8',
'26',
'A',
'Subtract 8, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0054',
'easy',
'Solve 5x + 9 = 59.',
'11',
'9',
'59',
'10',
'D',
'Subtract 9, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0055',
'easy',
'Solve 2x + 1 = 23.',
'10',
'23',
'11',
'12',
'C',
'Subtract 1, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0056',
'easy',
'Solve 5x + 2 = 62.',
'62',
'12',
'13',
'11',
'B',
'Subtract 2, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0057',
'easy',
'Solve 2x + 3 = 29.',
'13',
'14',
'12',
'29',
'A',
'Subtract 3, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0058',
'easy',
'Solve 5x + 4 = 74.',
'15',
'13',
'74',
'14',
'D',
'Subtract 4, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0059',
'easy',
'Solve 2x + 5 = 35.',
'14',
'35',
'15',
'16',
'C',
'Subtract 5, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0060',
'easy',
'Solve 5x + 6 = 86.',
'86',
'16',
'17',
'15',
'B',
'Subtract 6, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0061',
'easy',
'Solve 2x + 7 = 11.',
'2',
'3',
'1',
'11',
'A',
'Subtract 7, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0062',
'easy',
'Solve 5x + 8 = 23.',
'4',
'2',
'23',
'3',
'D',
'Subtract 8, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0063',
'easy',
'Solve 2x + 9 = 17.',
'3',
'17',
'4',
'5',
'C',
'Subtract 9, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0064',
'easy',
'Solve 5x + 1 = 26.',
'26',
'5',
'6',
'4',
'B',
'Subtract 1, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0065',
'easy',
'Solve 2x + 2 = 14.',
'6',
'7',
'5',
'14',
'A',
'Subtract 2, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0066',
'easy',
'Solve 5x + 3 = 38.',
'8',
'6',
'38',
'7',
'D',
'Subtract 3, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0067',
'easy',
'Solve 2x + 4 = 20.',
'7',
'20',
'8',
'9',
'C',
'Subtract 4, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0068',
'easy',
'Solve 5x + 5 = 50.',
'50',
'9',
'10',
'8',
'B',
'Subtract 5, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0069',
'easy',
'Solve 2x + 6 = 26.',
'10',
'11',
'9',
'26',
'A',
'Subtract 6, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0070',
'easy',
'Solve 5x + 7 = 62.',
'12',
'10',
'62',
'11',
'D',
'Subtract 7, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0071',
'easy',
'Solve 2x + 8 = 32.',
'11',
'32',
'12',
'13',
'C',
'Subtract 8, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0072',
'easy',
'Solve 5x + 9 = 74.',
'74',
'13',
'14',
'12',
'B',
'Subtract 9, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0073',
'easy',
'Solve 2x + 1 = 29.',
'14',
'15',
'13',
'29',
'A',
'Subtract 1, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0074',
'easy',
'Solve 5x + 2 = 77.',
'16',
'14',
'77',
'15',
'D',
'Subtract 2, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0075',
'easy',
'Solve 2x + 3 = 35.',
'15',
'35',
'16',
'17',
'C',
'Subtract 3, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0076',
'easy',
'Solve 5x + 4 = 14.',
'14',
'2',
'3',
'1',
'B',
'Subtract 4, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0077',
'easy',
'Solve 2x + 5 = 11.',
'3',
'4',
'2',
'11',
'A',
'Subtract 5, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0078',
'easy',
'Solve 5x + 6 = 26.',
'5',
'3',
'26',
'4',
'D',
'Subtract 6, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0079',
'easy',
'Solve 2x + 7 = 17.',
'4',
'17',
'5',
'6',
'C',
'Subtract 7, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0080',
'easy',
'Solve 5x + 8 = 38.',
'38',
'6',
'7',
'5',
'B',
'Subtract 8, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0081',
'easy',
'Solve 2x + 9 = 23.',
'7',
'8',
'6',
'23',
'A',
'Subtract 9, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0082',
'easy',
'Solve 5x + 1 = 41.',
'9',
'7',
'41',
'8',
'D',
'Subtract 1, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0083',
'easy',
'Solve 2x + 2 = 20.',
'8',
'20',
'9',
'10',
'C',
'Subtract 2, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0084',
'easy',
'Solve 5x + 3 = 53.',
'53',
'10',
'11',
'9',
'B',
'Subtract 3, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0085',
'easy',
'Solve 2x + 4 = 26.',
'11',
'12',
'10',
'26',
'A',
'Subtract 4, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0086',
'easy',
'Solve 5x + 5 = 65.',
'13',
'11',
'65',
'12',
'D',
'Subtract 5, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0087',
'easy',
'Solve 2x + 6 = 32.',
'12',
'32',
'13',
'14',
'C',
'Subtract 6, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0088',
'easy',
'Solve 5x + 7 = 77.',
'77',
'14',
'15',
'13',
'B',
'Subtract 7, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0089',
'easy',
'Solve 2x + 8 = 38.',
'15',
'16',
'14',
'38',
'A',
'Subtract 8, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0090',
'easy',
'Solve 5x + 9 = 89.',
'17',
'15',
'89',
'16',
'D',
'Subtract 9, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0091',
'easy',
'Solve 2x + 1 = 5.',
'1',
'5',
'2',
'3',
'C',
'Subtract 1, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0092',
'easy',
'Solve 5x + 2 = 17.',
'17',
'3',
'4',
'2',
'B',
'Subtract 2, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0093',
'easy',
'Solve 2x + 3 = 11.',
'4',
'5',
'3',
'11',
'A',
'Subtract 3, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0094',
'easy',
'Solve 5x + 4 = 29.',
'6',
'4',
'29',
'5',
'D',
'Subtract 4, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0095',
'easy',
'Solve 2x + 5 = 17.',
'5',
'17',
'6',
'7',
'C',
'Subtract 5, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0096',
'easy',
'Solve 5x + 6 = 41.',
'41',
'7',
'8',
'6',
'B',
'Subtract 6, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0097',
'easy',
'Solve 2x + 7 = 23.',
'8',
'9',
'7',
'23',
'A',
'Subtract 7, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0098',
'easy',
'Solve 5x + 8 = 53.',
'10',
'8',
'53',
'9',
'D',
'Subtract 8, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0099',
'easy',
'Solve 2x + 9 = 29.',
'9',
'29',
'10',
'11',
'C',
'Subtract 9, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0100',
'easy',
'Solve 5x + 1 = 56.',
'56',
'11',
'12',
'10',
'B',
'Subtract 1, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0101',
'easy',
'Solve 2x + 2 = 26.',
'12',
'13',
'11',
'26',
'A',
'Subtract 2, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0102',
'easy',
'Solve 5x + 3 = 68.',
'14',
'12',
'68',
'13',
'D',
'Subtract 3, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0103',
'easy',
'Solve 2x + 4 = 32.',
'13',
'32',
'14',
'15',
'C',
'Subtract 4, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0104',
'easy',
'Solve 5x + 5 = 80.',
'80',
'15',
'16',
'14',
'B',
'Subtract 5, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0105',
'easy',
'Solve 2x + 6 = 38.',
'16',
'17',
'15',
'38',
'A',
'Subtract 6, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0106',
'medium',
'Solve 5x + 7 = 17.',
'3',
'1',
'17',
'2',
'D',
'Subtract 7, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0107',
'medium',
'Solve 2x + 8 = 14.',
'2',
'14',
'3',
'4',
'C',
'Subtract 8, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0108',
'medium',
'Solve 5x + 9 = 29.',
'29',
'4',
'5',
'3',
'B',
'Subtract 9, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0109',
'medium',
'Solve 2x + 1 = 11.',
'5',
'6',
'4',
'11',
'A',
'Subtract 1, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0110',
'medium',
'Solve 5x + 2 = 32.',
'7',
'5',
'32',
'6',
'D',
'Subtract 2, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0111',
'medium',
'Solve 2x + 3 = 17.',
'6',
'17',
'7',
'8',
'C',
'Subtract 3, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0112',
'medium',
'Solve 5x + 4 = 44.',
'44',
'8',
'9',
'7',
'B',
'Subtract 4, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0113',
'medium',
'Solve 2x + 5 = 23.',
'9',
'10',
'8',
'23',
'A',
'Subtract 5, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0114',
'medium',
'Solve 5x + 6 = 56.',
'11',
'9',
'56',
'10',
'D',
'Subtract 6, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0115',
'medium',
'Solve 2x + 7 = 29.',
'10',
'29',
'11',
'12',
'C',
'Subtract 7, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0116',
'medium',
'Solve 5x + 8 = 68.',
'68',
'12',
'13',
'11',
'B',
'Subtract 8, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0117',
'medium',
'Solve 2x + 9 = 35.',
'13',
'14',
'12',
'35',
'A',
'Subtract 9, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0118',
'medium',
'Solve 5x + 1 = 71.',
'15',
'13',
'71',
'14',
'D',
'Subtract 1, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0119',
'medium',
'Solve 2x + 2 = 32.',
'14',
'32',
'15',
'16',
'C',
'Subtract 2, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0120',
'medium',
'Solve 5x + 3 = 83.',
'83',
'16',
'17',
'15',
'B',
'Subtract 3, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0121',
'medium',
'Solve 2x + 4 = 8.',
'2',
'3',
'1',
'8',
'A',
'Subtract 4, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0122',
'medium',
'Solve 5x + 5 = 20.',
'4',
'2',
'20',
'3',
'D',
'Subtract 5, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0123',
'medium',
'Solve 2x + 6 = 14.',
'3',
'14',
'4',
'5',
'C',
'Subtract 6, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0124',
'medium',
'Solve 5x + 7 = 32.',
'32',
'5',
'6',
'4',
'B',
'Subtract 7, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0125',
'medium',
'Solve 2x + 8 = 20.',
'6',
'7',
'5',
'20',
'A',
'Subtract 8, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0126',
'medium',
'Solve 5x + 9 = 44.',
'8',
'6',
'44',
'7',
'D',
'Subtract 9, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0127',
'medium',
'Solve 2x + 1 = 17.',
'7',
'17',
'8',
'9',
'C',
'Subtract 1, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0128',
'medium',
'Solve 5x + 2 = 47.',
'47',
'9',
'10',
'8',
'B',
'Subtract 2, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0129',
'medium',
'Solve 2x + 3 = 23.',
'10',
'11',
'9',
'23',
'A',
'Subtract 3, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0130',
'medium',
'Solve 5x + 4 = 59.',
'12',
'10',
'59',
'11',
'D',
'Subtract 4, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0131',
'medium',
'Solve 2x + 5 = 29.',
'11',
'29',
'12',
'13',
'C',
'Subtract 5, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0132',
'medium',
'Solve 5x + 6 = 71.',
'71',
'13',
'14',
'12',
'B',
'Subtract 6, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0133',
'medium',
'Solve 2x + 7 = 35.',
'14',
'15',
'13',
'35',
'A',
'Subtract 7, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0134',
'medium',
'Solve 5x + 8 = 83.',
'16',
'14',
'83',
'15',
'D',
'Subtract 8, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0135',
'medium',
'Solve 2x + 9 = 41.',
'15',
'41',
'16',
'17',
'C',
'Subtract 9, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0136',
'medium',
'Solve 5x + 1 = 11.',
'11',
'2',
'3',
'1',
'B',
'Subtract 1, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0137',
'medium',
'Solve 2x + 2 = 8.',
'3',
'4',
'2',
'8',
'A',
'Subtract 2, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0138',
'medium',
'Solve 5x + 3 = 23.',
'5',
'3',
'23',
'4',
'D',
'Subtract 3, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0139',
'medium',
'Solve 2x + 4 = 14.',
'4',
'14',
'5',
'6',
'C',
'Subtract 4, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0140',
'medium',
'Solve 5x + 5 = 35.',
'35',
'6',
'7',
'5',
'B',
'Subtract 5, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0141',
'medium',
'Solve 2x + 6 = 20.',
'7',
'8',
'6',
'20',
'A',
'Subtract 6, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0142',
'medium',
'Solve 5x + 7 = 47.',
'9',
'7',
'47',
'8',
'D',
'Subtract 7, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0143',
'medium',
'Solve 2x + 8 = 26.',
'8',
'26',
'9',
'10',
'C',
'Subtract 8, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0144',
'medium',
'Solve 5x + 9 = 59.',
'59',
'10',
'11',
'9',
'B',
'Subtract 9, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0145',
'medium',
'Solve 2x + 1 = 23.',
'11',
'12',
'10',
'23',
'A',
'Subtract 1, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0146',
'medium',
'Solve 5x + 2 = 62.',
'13',
'11',
'62',
'12',
'D',
'Subtract 2, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0147',
'medium',
'Solve 2x + 3 = 29.',
'12',
'29',
'13',
'14',
'C',
'Subtract 3, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0148',
'medium',
'Solve 5x + 4 = 74.',
'74',
'14',
'15',
'13',
'B',
'Subtract 4, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0149',
'medium',
'Solve 2x + 5 = 35.',
'15',
'16',
'14',
'35',
'A',
'Subtract 5, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0150',
'medium',
'Solve 5x + 6 = 86.',
'17',
'15',
'86',
'16',
'D',
'Subtract 6, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0151',
'medium',
'Solve 2x + 7 = 11.',
'1',
'11',
'2',
'3',
'C',
'Subtract 7, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0152',
'medium',
'Solve 5x + 8 = 23.',
'23',
'3',
'4',
'2',
'B',
'Subtract 8, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0153',
'medium',
'Solve 2x + 9 = 17.',
'4',
'5',
'3',
'17',
'A',
'Subtract 9, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0154',
'medium',
'Solve 5x + 1 = 26.',
'6',
'4',
'26',
'5',
'D',
'Subtract 1, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0155',
'medium',
'Solve 2x + 2 = 14.',
'5',
'14',
'6',
'7',
'C',
'Subtract 2, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0156',
'medium',
'Solve 5x + 3 = 38.',
'38',
'7',
'8',
'6',
'B',
'Subtract 3, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0157',
'medium',
'Solve 2x + 4 = 20.',
'8',
'9',
'7',
'20',
'A',
'Subtract 4, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0158',
'medium',
'Solve 5x + 5 = 50.',
'10',
'8',
'50',
'9',
'D',
'Subtract 5, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0159',
'medium',
'Solve 2x + 6 = 26.',
'9',
'26',
'10',
'11',
'C',
'Subtract 6, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0160',
'medium',
'Solve 5x + 7 = 62.',
'62',
'11',
'12',
'10',
'B',
'Subtract 7, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0161',
'medium',
'Solve 2x + 8 = 32.',
'12',
'13',
'11',
'32',
'A',
'Subtract 8, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0162',
'medium',
'Solve 5x + 9 = 74.',
'14',
'12',
'74',
'13',
'D',
'Subtract 9, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0163',
'medium',
'Solve 2x + 1 = 29.',
'13',
'29',
'14',
'15',
'C',
'Subtract 1, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0164',
'medium',
'Solve 5x + 2 = 77.',
'77',
'15',
'16',
'14',
'B',
'Subtract 2, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0165',
'medium',
'Solve 2x + 3 = 35.',
'16',
'17',
'15',
'35',
'A',
'Subtract 3, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0166',
'medium',
'Solve 5x + 4 = 14.',
'3',
'1',
'14',
'2',
'D',
'Subtract 4, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0167',
'medium',
'Solve 2x + 5 = 11.',
'2',
'11',
'3',
'4',
'C',
'Subtract 5, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0168',
'medium',
'Solve 5x + 6 = 26.',
'26',
'4',
'5',
'3',
'B',
'Subtract 6, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0169',
'medium',
'Solve 2x + 7 = 17.',
'5',
'6',
'4',
'17',
'A',
'Subtract 7, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0170',
'medium',
'Solve 5x + 8 = 38.',
'7',
'5',
'38',
'6',
'D',
'Subtract 8, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0171',
'medium',
'Solve 2x + 9 = 23.',
'6',
'23',
'7',
'8',
'C',
'Subtract 9, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0172',
'medium',
'Solve 5x + 1 = 41.',
'41',
'8',
'9',
'7',
'B',
'Subtract 1, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0173',
'medium',
'Solve 2x + 2 = 20.',
'9',
'10',
'8',
'20',
'A',
'Subtract 2, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0174',
'medium',
'Solve 5x + 3 = 53.',
'11',
'9',
'53',
'10',
'D',
'Subtract 3, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0175',
'medium',
'Solve 2x + 4 = 26.',
'10',
'26',
'11',
'12',
'C',
'Subtract 4, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0176',
'medium',
'Solve 5x + 5 = 65.',
'65',
'12',
'13',
'11',
'B',
'Subtract 5, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0177',
'medium',
'Solve 2x + 6 = 32.',
'13',
'14',
'12',
'32',
'A',
'Subtract 6, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0178',
'medium',
'Solve 5x + 7 = 77.',
'15',
'13',
'77',
'14',
'D',
'Subtract 7, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0179',
'medium',
'Solve 2x + 8 = 38.',
'14',
'38',
'15',
'16',
'C',
'Subtract 8, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0180',
'medium',
'Solve 5x + 9 = 89.',
'89',
'16',
'17',
'15',
'B',
'Subtract 9, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0181',
'medium',
'Solve 2x + 1 = 5.',
'2',
'3',
'1',
'5',
'A',
'Subtract 1, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0182',
'medium',
'Solve 5x + 2 = 17.',
'4',
'2',
'17',
'3',
'D',
'Subtract 2, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0183',
'medium',
'Solve 2x + 3 = 11.',
'3',
'11',
'4',
'5',
'C',
'Subtract 3, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0184',
'medium',
'Solve 5x + 4 = 29.',
'29',
'5',
'6',
'4',
'B',
'Subtract 4, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0185',
'medium',
'Solve 2x + 5 = 17.',
'6',
'7',
'5',
'17',
'A',
'Subtract 5, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0186',
'medium',
'Solve 5x + 6 = 41.',
'8',
'6',
'41',
'7',
'D',
'Subtract 6, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0187',
'medium',
'Solve 2x + 7 = 23.',
'7',
'23',
'8',
'9',
'C',
'Subtract 7, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0188',
'medium',
'Solve 5x + 8 = 53.',
'53',
'9',
'10',
'8',
'B',
'Subtract 8, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0189',
'medium',
'Solve 2x + 9 = 29.',
'10',
'11',
'9',
'29',
'A',
'Subtract 9, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0190',
'medium',
'Solve 5x + 1 = 56.',
'12',
'10',
'56',
'11',
'D',
'Subtract 1, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0191',
'medium',
'Solve 2x + 2 = 26.',
'11',
'26',
'12',
'13',
'C',
'Subtract 2, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0192',
'medium',
'Solve 5x + 3 = 68.',
'68',
'13',
'14',
'12',
'B',
'Subtract 3, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0193',
'medium',
'Solve 2x + 4 = 32.',
'14',
'15',
'13',
'32',
'A',
'Subtract 4, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0194',
'medium',
'Solve 5x + 5 = 80.',
'16',
'14',
'80',
'15',
'D',
'Subtract 5, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0195',
'medium',
'Solve 2x + 6 = 38.',
'15',
'38',
'16',
'17',
'C',
'Subtract 6, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0196',
'medium',
'Solve 5x + 7 = 17.',
'17',
'2',
'3',
'1',
'B',
'Subtract 7, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0197',
'medium',
'Solve 2x + 8 = 14.',
'3',
'4',
'2',
'14',
'A',
'Subtract 8, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0198',
'medium',
'Solve 5x + 9 = 29.',
'5',
'3',
'29',
'4',
'D',
'Subtract 9, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0199',
'medium',
'Solve 2x + 1 = 11.',
'4',
'11',
'5',
'6',
'C',
'Subtract 1, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0200',
'medium',
'Solve 5x + 2 = 32.',
'32',
'6',
'7',
'5',
'B',
'Subtract 2, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0201',
'medium',
'Solve 2x + 3 = 17.',
'7',
'8',
'6',
'17',
'A',
'Subtract 3, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0202',
'medium',
'Solve 5x + 4 = 44.',
'9',
'7',
'44',
'8',
'D',
'Subtract 4, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0203',
'medium',
'Solve 2x + 5 = 23.',
'8',
'23',
'9',
'10',
'C',
'Subtract 5, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0204',
'medium',
'Solve 5x + 6 = 56.',
'56',
'10',
'11',
'9',
'B',
'Subtract 6, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0205',
'medium',
'Solve 2x + 7 = 29.',
'11',
'12',
'10',
'29',
'A',
'Subtract 7, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0206',
'medium',
'Solve 5x + 8 = 68.',
'13',
'11',
'68',
'12',
'D',
'Subtract 8, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0207',
'medium',
'Solve 2x + 9 = 35.',
'12',
'35',
'13',
'14',
'C',
'Subtract 9, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0208',
'medium',
'Solve 5x + 1 = 71.',
'71',
'14',
'15',
'13',
'B',
'Subtract 1, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0209',
'medium',
'Solve 2x + 2 = 32.',
'15',
'16',
'14',
'32',
'A',
'Subtract 2, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0210',
'medium',
'Solve 5x + 3 = 83.',
'17',
'15',
'83',
'16',
'D',
'Subtract 3, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0211',
'medium',
'Solve 2x + 4 = 8.',
'1',
'8',
'2',
'3',
'C',
'Subtract 4, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0212',
'medium',
'Solve 5x + 5 = 20.',
'20',
'3',
'4',
'2',
'B',
'Subtract 5, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0213',
'medium',
'Solve 2x + 6 = 14.',
'4',
'5',
'3',
'14',
'A',
'Subtract 6, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0214',
'medium',
'Solve 5x + 7 = 32.',
'6',
'4',
'32',
'5',
'D',
'Subtract 7, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0215',
'medium',
'Solve 2x + 8 = 20.',
'5',
'20',
'6',
'7',
'C',
'Subtract 8, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0216',
'medium',
'Solve 5x + 9 = 44.',
'44',
'7',
'8',
'6',
'B',
'Subtract 9, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0217',
'medium',
'Solve 2x + 1 = 17.',
'8',
'9',
'7',
'17',
'A',
'Subtract 1, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0218',
'medium',
'Solve 5x + 2 = 47.',
'10',
'8',
'47',
'9',
'D',
'Subtract 2, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0219',
'medium',
'Solve 2x + 3 = 23.',
'9',
'23',
'10',
'11',
'C',
'Subtract 3, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0220',
'medium',
'Solve 5x + 4 = 59.',
'59',
'11',
'12',
'10',
'B',
'Subtract 4, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0221',
'medium',
'Solve 2x + 5 = 29.',
'12',
'13',
'11',
'29',
'A',
'Subtract 5, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0222',
'medium',
'Solve 5x + 6 = 71.',
'14',
'12',
'71',
'13',
'D',
'Subtract 6, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0223',
'medium',
'Solve 2x + 7 = 35.',
'13',
'35',
'14',
'15',
'C',
'Subtract 7, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0224',
'medium',
'Solve 5x + 8 = 83.',
'83',
'15',
'16',
'14',
'B',
'Subtract 8, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0225',
'medium',
'Solve 2x + 9 = 41.',
'16',
'17',
'15',
'41',
'A',
'Subtract 9, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0226',
'medium',
'Solve 5x + 1 = 11.',
'3',
'1',
'11',
'2',
'D',
'Subtract 1, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0227',
'medium',
'Solve 2x + 2 = 8.',
'2',
'8',
'3',
'4',
'C',
'Subtract 2, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0228',
'medium',
'Solve 5x + 3 = 23.',
'23',
'4',
'5',
'3',
'B',
'Subtract 3, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0229',
'medium',
'Solve 2x + 4 = 14.',
'5',
'6',
'4',
'14',
'A',
'Subtract 4, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0230',
'medium',
'Solve 5x + 5 = 35.',
'7',
'5',
'35',
'6',
'D',
'Subtract 5, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0231',
'medium',
'Solve 2x + 6 = 20.',
'6',
'20',
'7',
'8',
'C',
'Subtract 6, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0232',
'medium',
'Solve 5x + 7 = 47.',
'47',
'8',
'9',
'7',
'B',
'Subtract 7, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0233',
'medium',
'Solve 2x + 8 = 26.',
'9',
'10',
'8',
'26',
'A',
'Subtract 8, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0234',
'medium',
'Solve 5x + 9 = 59.',
'11',
'9',
'59',
'10',
'D',
'Subtract 9, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0235',
'medium',
'Solve 2x + 1 = 23.',
'10',
'23',
'11',
'12',
'C',
'Subtract 1, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0236',
'medium',
'Solve 5x + 2 = 62.',
'62',
'12',
'13',
'11',
'B',
'Subtract 2, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0237',
'medium',
'Solve 2x + 3 = 29.',
'13',
'14',
'12',
'29',
'A',
'Subtract 3, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0238',
'medium',
'Solve 5x + 4 = 74.',
'15',
'13',
'74',
'14',
'D',
'Subtract 4, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0239',
'medium',
'Solve 2x + 5 = 35.',
'14',
'35',
'15',
'16',
'C',
'Subtract 5, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0240',
'medium',
'Solve 5x + 6 = 86.',
'86',
'16',
'17',
'15',
'B',
'Subtract 6, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0241',
'challenge',
'Solve 2x + 7 = 11.',
'2',
'3',
'1',
'11',
'A',
'Subtract 7, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0242',
'challenge',
'Solve 5x + 8 = 23.',
'4',
'2',
'23',
'3',
'D',
'Subtract 8, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0243',
'challenge',
'Solve 2x + 9 = 17.',
'3',
'17',
'4',
'5',
'C',
'Subtract 9, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0244',
'challenge',
'Solve 5x + 1 = 26.',
'26',
'5',
'6',
'4',
'B',
'Subtract 1, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0245',
'challenge',
'Solve 2x + 2 = 14.',
'6',
'7',
'5',
'14',
'A',
'Subtract 2, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0246',
'challenge',
'Solve 5x + 3 = 38.',
'8',
'6',
'38',
'7',
'D',
'Subtract 3, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0247',
'challenge',
'Solve 2x + 4 = 20.',
'7',
'20',
'8',
'9',
'C',
'Subtract 4, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0248',
'challenge',
'Solve 5x + 5 = 50.',
'50',
'9',
'10',
'8',
'B',
'Subtract 5, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0249',
'challenge',
'Solve 2x + 6 = 26.',
'10',
'11',
'9',
'26',
'A',
'Subtract 6, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0250',
'challenge',
'Solve 5x + 7 = 62.',
'12',
'10',
'62',
'11',
'D',
'Subtract 7, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0251',
'challenge',
'Solve 2x + 8 = 32.',
'11',
'32',
'12',
'13',
'C',
'Subtract 8, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0252',
'challenge',
'Solve 5x + 9 = 74.',
'74',
'13',
'14',
'12',
'B',
'Subtract 9, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0253',
'challenge',
'Solve 2x + 1 = 29.',
'14',
'15',
'13',
'29',
'A',
'Subtract 1, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0254',
'challenge',
'Solve 5x + 2 = 77.',
'16',
'14',
'77',
'15',
'D',
'Subtract 2, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0255',
'challenge',
'Solve 2x + 3 = 35.',
'15',
'35',
'16',
'17',
'C',
'Subtract 3, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0256',
'challenge',
'Solve 5x + 4 = 14.',
'14',
'2',
'3',
'1',
'B',
'Subtract 4, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0257',
'challenge',
'Solve 2x + 5 = 11.',
'3',
'4',
'2',
'11',
'A',
'Subtract 5, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0258',
'challenge',
'Solve 5x + 6 = 26.',
'5',
'3',
'26',
'4',
'D',
'Subtract 6, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0259',
'challenge',
'Solve 2x + 7 = 17.',
'4',
'17',
'5',
'6',
'C',
'Subtract 7, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0260',
'challenge',
'Solve 5x + 8 = 38.',
'38',
'6',
'7',
'5',
'B',
'Subtract 8, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0261',
'challenge',
'Solve 2x + 9 = 23.',
'7',
'8',
'6',
'23',
'A',
'Subtract 9, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0262',
'challenge',
'Solve 5x + 1 = 41.',
'9',
'7',
'41',
'8',
'D',
'Subtract 1, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0263',
'challenge',
'Solve 2x + 2 = 20.',
'8',
'20',
'9',
'10',
'C',
'Subtract 2, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0264',
'challenge',
'Solve 5x + 3 = 53.',
'53',
'10',
'11',
'9',
'B',
'Subtract 3, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0265',
'challenge',
'Solve 2x + 4 = 26.',
'11',
'12',
'10',
'26',
'A',
'Subtract 4, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0266',
'challenge',
'Solve 5x + 5 = 65.',
'13',
'11',
'65',
'12',
'D',
'Subtract 5, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0267',
'challenge',
'Solve 2x + 6 = 32.',
'12',
'32',
'13',
'14',
'C',
'Subtract 6, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0268',
'challenge',
'Solve 5x + 7 = 77.',
'77',
'14',
'15',
'13',
'B',
'Subtract 7, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0269',
'challenge',
'Solve 2x + 8 = 38.',
'15',
'16',
'14',
'38',
'A',
'Subtract 8, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0270',
'challenge',
'Solve 5x + 9 = 89.',
'17',
'15',
'89',
'16',
'D',
'Subtract 9, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0271',
'challenge',
'Solve 2x + 1 = 5.',
'1',
'5',
'2',
'3',
'C',
'Subtract 1, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0272',
'challenge',
'Solve 5x + 2 = 17.',
'17',
'3',
'4',
'2',
'B',
'Subtract 2, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0273',
'challenge',
'Solve 2x + 3 = 11.',
'4',
'5',
'3',
'11',
'A',
'Subtract 3, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0274',
'challenge',
'Solve 5x + 4 = 29.',
'6',
'4',
'29',
'5',
'D',
'Subtract 4, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0275',
'challenge',
'Solve 2x + 5 = 17.',
'5',
'17',
'6',
'7',
'C',
'Subtract 5, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0276',
'challenge',
'Solve 5x + 6 = 41.',
'41',
'7',
'8',
'6',
'B',
'Subtract 6, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0277',
'challenge',
'Solve 2x + 7 = 23.',
'8',
'9',
'7',
'23',
'A',
'Subtract 7, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0278',
'challenge',
'Solve 5x + 8 = 53.',
'10',
'8',
'53',
'9',
'D',
'Subtract 8, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0279',
'challenge',
'Solve 2x + 9 = 29.',
'9',
'29',
'10',
'11',
'C',
'Subtract 9, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0280',
'challenge',
'Solve 5x + 1 = 56.',
'56',
'11',
'12',
'10',
'B',
'Subtract 1, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0281',
'challenge',
'Solve 2x + 2 = 26.',
'12',
'13',
'11',
'26',
'A',
'Subtract 2, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0282',
'challenge',
'Solve 5x + 3 = 68.',
'14',
'12',
'68',
'13',
'D',
'Subtract 3, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0283',
'challenge',
'Solve 2x + 4 = 32.',
'13',
'32',
'14',
'15',
'C',
'Subtract 4, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0284',
'challenge',
'Solve 5x + 5 = 80.',
'80',
'15',
'16',
'14',
'B',
'Subtract 5, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0285',
'challenge',
'Solve 2x + 6 = 38.',
'16',
'17',
'15',
'38',
'A',
'Subtract 6, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0286',
'challenge',
'Solve 5x + 7 = 17.',
'3',
'1',
'17',
'2',
'D',
'Subtract 7, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0287',
'challenge',
'Solve 2x + 8 = 14.',
'2',
'14',
'3',
'4',
'C',
'Subtract 8, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0288',
'challenge',
'Solve 5x + 9 = 29.',
'29',
'4',
'5',
'3',
'B',
'Subtract 9, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0289',
'challenge',
'Solve 2x + 1 = 11.',
'5',
'6',
'4',
'11',
'A',
'Subtract 1, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0290',
'challenge',
'Solve 5x + 2 = 32.',
'7',
'5',
'32',
'6',
'D',
'Subtract 2, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0291',
'challenge',
'Solve 2x + 3 = 17.',
'6',
'17',
'7',
'8',
'C',
'Subtract 3, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0292',
'challenge',
'Solve 5x + 4 = 44.',
'44',
'8',
'9',
'7',
'B',
'Subtract 4, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0293',
'challenge',
'Solve 2x + 5 = 23.',
'9',
'10',
'8',
'23',
'A',
'Subtract 5, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0294',
'challenge',
'Solve 5x + 6 = 56.',
'11',
'9',
'56',
'10',
'D',
'Subtract 6, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0295',
'challenge',
'Solve 2x + 7 = 29.',
'10',
'29',
'11',
'12',
'C',
'Subtract 7, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0296',
'challenge',
'Solve 5x + 8 = 68.',
'68',
'12',
'13',
'11',
'B',
'Subtract 8, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0297',
'challenge',
'Solve 2x + 9 = 35.',
'13',
'14',
'12',
'35',
'A',
'Subtract 9, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0298',
'challenge',
'Solve 5x + 1 = 71.',
'15',
'13',
'71',
'14',
'D',
'Subtract 1, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0299',
'challenge',
'Solve 2x + 2 = 32.',
'14',
'32',
'15',
'16',
'C',
'Subtract 2, then divide by 2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_ALGEBRA_0300',
'challenge',
'Solve 5x + 3 = 83.',
'83',
'16',
'17',
'15',
'B',
'Subtract 3, then divide by 5.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0001',
'easy',
'What is lim x→1 of (2x+3)?',
'5',
'2',
'4',
'5 (1)',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0002',
'easy',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0003',
'easy',
'What is lim x→3 of (2x+3)?',
'8',
'9 (1)',
'9',
'6',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0004',
'easy',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0005',
'easy',
'What is lim x→5 of (2x+3)?',
'13',
'10',
'12',
'8',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0006',
'easy',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0007',
'easy',
'What is lim x→7 of (2x+3)?',
'16',
'10',
'17',
'14',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0008',
'easy',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0009',
'easy',
'What is lim x→9 of (2x+3)?',
'21',
'18',
'20',
'12',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0010',
'easy',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0011',
'easy',
'What is lim x→2 of (2x+3)?',
'6',
'5',
'7',
'4',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0012',
'easy',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0013',
'easy',
'What is lim x→4 of (2x+3)?',
'11',
'8',
'10',
'7',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0014',
'easy',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0015',
'easy',
'What is lim x→6 of (2x+3)?',
'14',
'9',
'15',
'12',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0016',
'easy',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0017',
'easy',
'What is lim x→8 of (2x+3)?',
'19',
'16',
'18',
'11',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0018',
'easy',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0019',
'easy',
'What is lim x→1 of (2x+3)?',
'4',
'5 (1)',
'5',
'2',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0020',
'easy',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0021',
'easy',
'What is lim x→3 of (2x+3)?',
'9',
'6',
'8',
'9 (1)',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0022',
'easy',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0023',
'easy',
'What is lim x→5 of (2x+3)?',
'12',
'8',
'13',
'10',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0024',
'easy',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0025',
'easy',
'What is lim x→7 of (2x+3)?',
'17',
'14',
'16',
'10',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0026',
'easy',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0027',
'easy',
'What is lim x→9 of (2x+3)?',
'20',
'12',
'21',
'18',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0028',
'easy',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0029',
'easy',
'What is lim x→2 of (2x+3)?',
'7',
'4',
'6',
'5',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0030',
'easy',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0031',
'easy',
'What is lim x→4 of (2x+3)?',
'10',
'7',
'11',
'8',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0032',
'easy',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0033',
'easy',
'What is lim x→6 of (2x+3)?',
'15',
'12',
'14',
'9',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0034',
'easy',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0035',
'easy',
'What is lim x→8 of (2x+3)?',
'18',
'11',
'19',
'16',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0036',
'easy',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0037',
'easy',
'What is lim x→1 of (2x+3)?',
'5',
'2',
'4',
'5 (1)',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0038',
'easy',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0039',
'easy',
'What is lim x→3 of (2x+3)?',
'8',
'9 (1)',
'9',
'6',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0040',
'easy',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0041',
'easy',
'What is lim x→5 of (2x+3)?',
'13',
'10',
'12',
'8',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0042',
'easy',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0043',
'easy',
'What is lim x→7 of (2x+3)?',
'16',
'10',
'17',
'14',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0044',
'easy',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0045',
'easy',
'What is lim x→9 of (2x+3)?',
'21',
'18',
'20',
'12',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0046',
'easy',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0047',
'easy',
'What is lim x→2 of (2x+3)?',
'6',
'5',
'7',
'4',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0048',
'easy',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0049',
'easy',
'What is lim x→4 of (2x+3)?',
'11',
'8',
'10',
'7',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0050',
'easy',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0051',
'easy',
'What is lim x→6 of (2x+3)?',
'14',
'9',
'15',
'12',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0052',
'easy',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0053',
'easy',
'What is lim x→8 of (2x+3)?',
'19',
'16',
'18',
'11',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0054',
'easy',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0055',
'easy',
'What is lim x→1 of (2x+3)?',
'4',
'5 (1)',
'5',
'2',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0056',
'easy',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0057',
'easy',
'What is lim x→3 of (2x+3)?',
'9',
'6',
'8',
'9 (1)',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0058',
'easy',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0059',
'easy',
'What is lim x→5 of (2x+3)?',
'12',
'8',
'13',
'10',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0060',
'easy',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0061',
'easy',
'What is lim x→7 of (2x+3)?',
'17',
'14',
'16',
'10',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0062',
'easy',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0063',
'easy',
'What is lim x→9 of (2x+3)?',
'20',
'12',
'21',
'18',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0064',
'easy',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0065',
'easy',
'What is lim x→2 of (2x+3)?',
'7',
'4',
'6',
'5',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0066',
'easy',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0067',
'easy',
'What is lim x→4 of (2x+3)?',
'10',
'7',
'11',
'8',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0068',
'easy',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0069',
'easy',
'What is lim x→6 of (2x+3)?',
'15',
'12',
'14',
'9',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0070',
'easy',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0071',
'easy',
'What is lim x→8 of (2x+3)?',
'18',
'11',
'19',
'16',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0072',
'easy',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0073',
'easy',
'What is lim x→1 of (2x+3)?',
'5',
'2',
'4',
'5 (1)',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0074',
'easy',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0075',
'easy',
'What is lim x→3 of (2x+3)?',
'8',
'9 (1)',
'9',
'6',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0076',
'easy',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0077',
'easy',
'What is lim x→5 of (2x+3)?',
'13',
'10',
'12',
'8',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0078',
'easy',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0079',
'easy',
'What is lim x→7 of (2x+3)?',
'16',
'10',
'17',
'14',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0080',
'easy',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0081',
'easy',
'What is lim x→9 of (2x+3)?',
'21',
'18',
'20',
'12',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0082',
'easy',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0083',
'easy',
'What is lim x→2 of (2x+3)?',
'6',
'5',
'7',
'4',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0084',
'easy',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0085',
'easy',
'What is lim x→4 of (2x+3)?',
'11',
'8',
'10',
'7',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0086',
'easy',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0087',
'easy',
'What is lim x→6 of (2x+3)?',
'14',
'9',
'15',
'12',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0088',
'easy',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0089',
'easy',
'What is lim x→8 of (2x+3)?',
'19',
'16',
'18',
'11',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0090',
'easy',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0091',
'easy',
'What is lim x→1 of (2x+3)?',
'4',
'5 (1)',
'5',
'2',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0092',
'easy',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0093',
'easy',
'What is lim x→3 of (2x+3)?',
'9',
'6',
'8',
'9 (1)',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0094',
'easy',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0095',
'easy',
'What is lim x→5 of (2x+3)?',
'12',
'8',
'13',
'10',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0096',
'easy',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0097',
'easy',
'What is lim x→7 of (2x+3)?',
'17',
'14',
'16',
'10',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0098',
'easy',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0099',
'easy',
'What is lim x→9 of (2x+3)?',
'20',
'12',
'21',
'18',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0100',
'easy',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0101',
'easy',
'What is lim x→2 of (2x+3)?',
'7',
'4',
'6',
'5',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0102',
'easy',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0103',
'easy',
'What is lim x→4 of (2x+3)?',
'10',
'7',
'11',
'8',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0104',
'easy',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0105',
'easy',
'What is lim x→6 of (2x+3)?',
'15',
'12',
'14',
'9',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0106',
'medium',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0107',
'medium',
'What is lim x→8 of (2x+3)?',
'18',
'11',
'19',
'16',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0108',
'medium',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0109',
'medium',
'What is lim x→1 of (2x+3)?',
'5',
'2',
'4',
'5 (1)',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0110',
'medium',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0111',
'medium',
'What is lim x→3 of (2x+3)?',
'8',
'9 (1)',
'9',
'6',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0112',
'medium',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0113',
'medium',
'What is lim x→5 of (2x+3)?',
'13',
'10',
'12',
'8',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0114',
'medium',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0115',
'medium',
'What is lim x→7 of (2x+3)?',
'16',
'10',
'17',
'14',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0116',
'medium',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0117',
'medium',
'What is lim x→9 of (2x+3)?',
'21',
'18',
'20',
'12',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0118',
'medium',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0119',
'medium',
'What is lim x→2 of (2x+3)?',
'6',
'5',
'7',
'4',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0120',
'medium',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0121',
'medium',
'What is lim x→4 of (2x+3)?',
'11',
'8',
'10',
'7',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0122',
'medium',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0123',
'medium',
'What is lim x→6 of (2x+3)?',
'14',
'9',
'15',
'12',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0124',
'medium',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0125',
'medium',
'What is lim x→8 of (2x+3)?',
'19',
'16',
'18',
'11',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0126',
'medium',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0127',
'medium',
'What is lim x→1 of (2x+3)?',
'4',
'5 (1)',
'5',
'2',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0128',
'medium',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0129',
'medium',
'What is lim x→3 of (2x+3)?',
'9',
'6',
'8',
'9 (1)',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0130',
'medium',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0131',
'medium',
'What is lim x→5 of (2x+3)?',
'12',
'8',
'13',
'10',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0132',
'medium',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0133',
'medium',
'What is lim x→7 of (2x+3)?',
'17',
'14',
'16',
'10',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0134',
'medium',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0135',
'medium',
'What is lim x→9 of (2x+3)?',
'20',
'12',
'21',
'18',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0136',
'medium',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0137',
'medium',
'What is lim x→2 of (2x+3)?',
'7',
'4',
'6',
'5',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0138',
'medium',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0139',
'medium',
'What is lim x→4 of (2x+3)?',
'10',
'7',
'11',
'8',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0140',
'medium',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0141',
'medium',
'What is lim x→6 of (2x+3)?',
'15',
'12',
'14',
'9',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0142',
'medium',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0143',
'medium',
'What is lim x→8 of (2x+3)?',
'18',
'11',
'19',
'16',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0144',
'medium',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0145',
'medium',
'What is lim x→1 of (2x+3)?',
'5',
'2',
'4',
'5 (1)',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0146',
'medium',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0147',
'medium',
'What is lim x→3 of (2x+3)?',
'8',
'9 (1)',
'9',
'6',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0148',
'medium',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0149',
'medium',
'What is lim x→5 of (2x+3)?',
'13',
'10',
'12',
'8',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0150',
'medium',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0151',
'medium',
'What is lim x→7 of (2x+3)?',
'16',
'10',
'17',
'14',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0152',
'medium',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0153',
'medium',
'What is lim x→9 of (2x+3)?',
'21',
'18',
'20',
'12',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0154',
'medium',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0155',
'medium',
'What is lim x→2 of (2x+3)?',
'6',
'5',
'7',
'4',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0156',
'medium',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0157',
'medium',
'What is lim x→4 of (2x+3)?',
'11',
'8',
'10',
'7',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0158',
'medium',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0159',
'medium',
'What is lim x→6 of (2x+3)?',
'14',
'9',
'15',
'12',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0160',
'medium',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0161',
'medium',
'What is lim x→8 of (2x+3)?',
'19',
'16',
'18',
'11',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0162',
'medium',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0163',
'medium',
'What is lim x→1 of (2x+3)?',
'4',
'5 (1)',
'5',
'2',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0164',
'medium',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0165',
'medium',
'What is lim x→3 of (2x+3)?',
'9',
'6',
'8',
'9 (1)',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0166',
'medium',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0167',
'medium',
'What is lim x→5 of (2x+3)?',
'12',
'8',
'13',
'10',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0168',
'medium',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0169',
'medium',
'What is lim x→7 of (2x+3)?',
'17',
'14',
'16',
'10',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0170',
'medium',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0171',
'medium',
'What is lim x→9 of (2x+3)?',
'20',
'12',
'21',
'18',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0172',
'medium',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0173',
'medium',
'What is lim x→2 of (2x+3)?',
'7',
'4',
'6',
'5',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0174',
'medium',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0175',
'medium',
'What is lim x→4 of (2x+3)?',
'10',
'7',
'11',
'8',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0176',
'medium',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0177',
'medium',
'What is lim x→6 of (2x+3)?',
'15',
'12',
'14',
'9',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0178',
'medium',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0179',
'medium',
'What is lim x→8 of (2x+3)?',
'18',
'11',
'19',
'16',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0180',
'medium',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0181',
'medium',
'What is lim x→1 of (2x+3)?',
'5',
'2',
'4',
'5 (1)',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0182',
'medium',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0183',
'medium',
'What is lim x→3 of (2x+3)?',
'8',
'9 (1)',
'9',
'6',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0184',
'medium',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0185',
'medium',
'What is lim x→5 of (2x+3)?',
'13',
'10',
'12',
'8',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0186',
'medium',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0187',
'medium',
'What is lim x→7 of (2x+3)?',
'16',
'10',
'17',
'14',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0188',
'medium',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0189',
'medium',
'What is lim x→9 of (2x+3)?',
'21',
'18',
'20',
'12',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0190',
'medium',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0191',
'medium',
'What is lim x→2 of (2x+3)?',
'6',
'5',
'7',
'4',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0192',
'medium',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0193',
'medium',
'What is lim x→4 of (2x+3)?',
'11',
'8',
'10',
'7',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0194',
'medium',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0195',
'medium',
'What is lim x→6 of (2x+3)?',
'14',
'9',
'15',
'12',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0196',
'medium',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0197',
'medium',
'What is lim x→8 of (2x+3)?',
'19',
'16',
'18',
'11',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0198',
'medium',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0199',
'medium',
'What is lim x→1 of (2x+3)?',
'4',
'5 (1)',
'5',
'2',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0200',
'medium',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0201',
'medium',
'What is lim x→3 of (2x+3)?',
'9',
'6',
'8',
'9 (1)',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0202',
'medium',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0203',
'medium',
'What is lim x→5 of (2x+3)?',
'12',
'8',
'13',
'10',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0204',
'medium',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0205',
'medium',
'What is lim x→7 of (2x+3)?',
'17',
'14',
'16',
'10',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0206',
'medium',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0207',
'medium',
'What is lim x→9 of (2x+3)?',
'20',
'12',
'21',
'18',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0208',
'medium',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0209',
'medium',
'What is lim x→2 of (2x+3)?',
'7',
'4',
'6',
'5',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0210',
'medium',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0211',
'medium',
'What is lim x→4 of (2x+3)?',
'10',
'7',
'11',
'8',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0212',
'medium',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0213',
'medium',
'What is lim x→6 of (2x+3)?',
'15',
'12',
'14',
'9',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0214',
'medium',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0215',
'medium',
'What is lim x→8 of (2x+3)?',
'18',
'11',
'19',
'16',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0216',
'medium',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0217',
'medium',
'What is lim x→1 of (2x+3)?',
'5',
'2',
'4',
'5 (1)',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0218',
'medium',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0219',
'medium',
'What is lim x→3 of (2x+3)?',
'8',
'9 (1)',
'9',
'6',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0220',
'medium',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0221',
'medium',
'What is lim x→5 of (2x+3)?',
'13',
'10',
'12',
'8',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0222',
'medium',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0223',
'medium',
'What is lim x→7 of (2x+3)?',
'16',
'10',
'17',
'14',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0224',
'medium',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0225',
'medium',
'What is lim x→9 of (2x+3)?',
'21',
'18',
'20',
'12',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0226',
'medium',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0227',
'medium',
'What is lim x→2 of (2x+3)?',
'6',
'5',
'7',
'4',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0228',
'medium',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0229',
'medium',
'What is lim x→4 of (2x+3)?',
'11',
'8',
'10',
'7',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0230',
'medium',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0231',
'medium',
'What is lim x→6 of (2x+3)?',
'14',
'9',
'15',
'12',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0232',
'medium',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0233',
'medium',
'What is lim x→8 of (2x+3)?',
'19',
'16',
'18',
'11',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0234',
'medium',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0235',
'medium',
'What is lim x→1 of (2x+3)?',
'4',
'5 (1)',
'5',
'2',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0236',
'medium',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0237',
'medium',
'What is lim x→3 of (2x+3)?',
'9',
'6',
'8',
'9 (1)',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0238',
'medium',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0239',
'medium',
'What is lim x→5 of (2x+3)?',
'12',
'8',
'13',
'10',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0240',
'medium',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0241',
'challenge',
'What is lim x→7 of (2x+3)?',
'17',
'14',
'16',
'10',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0242',
'challenge',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0243',
'challenge',
'What is lim x→9 of (2x+3)?',
'20',
'12',
'21',
'18',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0244',
'challenge',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0245',
'challenge',
'What is lim x→2 of (2x+3)?',
'7',
'4',
'6',
'5',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0246',
'challenge',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0247',
'challenge',
'What is lim x→4 of (2x+3)?',
'10',
'7',
'11',
'8',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0248',
'challenge',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0249',
'challenge',
'What is lim x→6 of (2x+3)?',
'15',
'12',
'14',
'9',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0250',
'challenge',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0251',
'challenge',
'What is lim x→8 of (2x+3)?',
'18',
'11',
'19',
'16',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0252',
'challenge',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0253',
'challenge',
'What is lim x→1 of (2x+3)?',
'5',
'2',
'4',
'5 (1)',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0254',
'challenge',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0255',
'challenge',
'What is lim x→3 of (2x+3)?',
'8',
'9 (1)',
'9',
'6',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0256',
'challenge',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0257',
'challenge',
'What is lim x→5 of (2x+3)?',
'13',
'10',
'12',
'8',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0258',
'challenge',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0259',
'challenge',
'What is lim x→7 of (2x+3)?',
'16',
'10',
'17',
'14',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0260',
'challenge',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0261',
'challenge',
'What is lim x→9 of (2x+3)?',
'21',
'18',
'20',
'12',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0262',
'challenge',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0263',
'challenge',
'What is lim x→2 of (2x+3)?',
'6',
'5',
'7',
'4',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0264',
'challenge',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0265',
'challenge',
'What is lim x→4 of (2x+3)?',
'11',
'8',
'10',
'7',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0266',
'challenge',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0267',
'challenge',
'What is lim x→6 of (2x+3)?',
'14',
'9',
'15',
'12',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0268',
'challenge',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0269',
'challenge',
'What is lim x→8 of (2x+3)?',
'19',
'16',
'18',
'11',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0270',
'challenge',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0271',
'challenge',
'What is lim x→1 of (2x+3)?',
'4',
'5 (1)',
'5',
'2',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0272',
'challenge',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0273',
'challenge',
'What is lim x→3 of (2x+3)?',
'9',
'6',
'8',
'9 (1)',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0274',
'challenge',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0275',
'challenge',
'What is lim x→5 of (2x+3)?',
'12',
'8',
'13',
'10',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0276',
'challenge',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0277',
'challenge',
'What is lim x→7 of (2x+3)?',
'17',
'14',
'16',
'10',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0278',
'challenge',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0279',
'challenge',
'What is lim x→9 of (2x+3)?',
'20',
'12',
'21',
'18',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0280',
'challenge',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0281',
'challenge',
'What is lim x→2 of (2x+3)?',
'7',
'4',
'6',
'5',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0282',
'challenge',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0283',
'challenge',
'What is lim x→4 of (2x+3)?',
'10',
'7',
'11',
'8',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0284',
'challenge',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0285',
'challenge',
'What is lim x→6 of (2x+3)?',
'15',
'12',
'14',
'9',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0286',
'challenge',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0287',
'challenge',
'What is lim x→8 of (2x+3)?',
'18',
'11',
'19',
'16',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0288',
'challenge',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0289',
'challenge',
'What is lim x→1 of (2x+3)?',
'5',
'2',
'4',
'5 (1)',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0290',
'challenge',
'What is d/dx of x^3?',
'x^2',
'2x^3',
'3x^3',
'3x^2',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0291',
'challenge',
'What is lim x→3 of (2x+3)?',
'8',
'9 (1)',
'9',
'6',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0292',
'challenge',
'What is d/dx of x^5?',
'5x^5',
'5x^4',
'x^4',
'4x^5',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0293',
'challenge',
'What is lim x→5 of (2x+3)?',
'13',
'10',
'12',
'8',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0294',
'challenge',
'What is d/dx of x^7?',
'x^6',
'6x^7',
'7x^7',
'7x^6',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0295',
'challenge',
'What is lim x→7 of (2x+3)?',
'16',
'10',
'17',
'14',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0296',
'challenge',
'What is d/dx of x^3?',
'3x^3',
'3x^2',
'x^2',
'2x^3',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0297',
'challenge',
'What is lim x→9 of (2x+3)?',
'21',
'18',
'20',
'12',
'A',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0298',
'challenge',
'What is d/dx of x^5?',
'x^4',
'4x^5',
'5x^5',
'5x^4',
'D',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0299',
'challenge',
'What is lim x→2 of (2x+3)?',
'6',
'5',
'7',
'4',
'C',
'Substitute directly for this polynomial.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_CALCULUS_0300',
'challenge',
'What is d/dx of x^7?',
'7x^7',
'7x^6',
'x^6',
'6x^7',
'B',
'Use the power rule.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='CALCULUS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0001',
'easy',
'What is sin(0°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'A',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0002',
'easy',
'What is sin(30°)?',
'0',
'√2/2',
'√3/2',
'1/2',
'D',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0003',
'easy',
'What is sin(45°)?',
'1/2',
'√3/2',
'√2/2',
'0',
'C',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0004',
'easy',
'What is sin(60°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'B',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0005',
'easy',
'What is sin(90°)?',
'1',
'0',
'1/2',
'√2/2',
'A',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0006',
'easy',
'What is sin(0°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'D',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0007',
'easy',
'What is sin(30°)?',
'√2/2',
'√3/2',
'1/2',
'0',
'C',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0008',
'easy',
'What is sin(45°)?',
'√3/2',
'√2/2',
'0',
'1/2',
'B',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0009',
'easy',
'What is sin(60°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'A',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0010',
'easy',
'What is sin(90°)?',
'0',
'1/2',
'√2/2',
'1',
'D',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0011',
'easy',
'What is sin(0°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'C',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0012',
'easy',
'What is sin(30°)?',
'√3/2',
'1/2',
'0',
'√2/2',
'B',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0013',
'easy',
'What is sin(45°)?',
'√2/2',
'0',
'1/2',
'√3/2',
'A',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0014',
'easy',
'What is sin(60°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'D',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0015',
'easy',
'What is sin(90°)?',
'1/2',
'√2/2',
'1',
'0',
'C',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0016',
'easy',
'What is sin(0°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'B',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0017',
'easy',
'What is sin(30°)?',
'1/2',
'0',
'√2/2',
'√3/2',
'A',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0018',
'easy',
'What is sin(45°)?',
'0',
'1/2',
'√3/2',
'√2/2',
'D',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0019',
'easy',
'What is sin(60°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'C',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0020',
'easy',
'What is sin(90°)?',
'√2/2',
'1',
'0',
'1/2',
'B',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0021',
'easy',
'What is sin(0°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'A',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0022',
'easy',
'What is sin(30°)?',
'0',
'√2/2',
'√3/2',
'1/2',
'D',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0023',
'easy',
'What is sin(45°)?',
'1/2',
'√3/2',
'√2/2',
'0',
'C',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0024',
'easy',
'What is sin(60°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'B',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0025',
'easy',
'What is sin(90°)?',
'1',
'0',
'1/2',
'√2/2',
'A',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0026',
'easy',
'What is sin(0°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'D',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0027',
'easy',
'What is sin(30°)?',
'√2/2',
'√3/2',
'1/2',
'0',
'C',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0028',
'easy',
'What is sin(45°)?',
'√3/2',
'√2/2',
'0',
'1/2',
'B',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0029',
'easy',
'What is sin(60°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'A',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0030',
'easy',
'What is sin(90°)?',
'0',
'1/2',
'√2/2',
'1',
'D',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0031',
'easy',
'What is sin(0°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'C',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0032',
'easy',
'What is sin(30°)?',
'√3/2',
'1/2',
'0',
'√2/2',
'B',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0033',
'easy',
'What is sin(45°)?',
'√2/2',
'0',
'1/2',
'√3/2',
'A',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0034',
'easy',
'What is sin(60°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'D',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0035',
'easy',
'What is sin(90°)?',
'1/2',
'√2/2',
'1',
'0',
'C',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0036',
'easy',
'What is sin(0°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'B',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0037',
'easy',
'What is sin(30°)?',
'1/2',
'0',
'√2/2',
'√3/2',
'A',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0038',
'easy',
'What is sin(45°)?',
'0',
'1/2',
'√3/2',
'√2/2',
'D',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0039',
'easy',
'What is sin(60°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'C',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0040',
'easy',
'What is sin(90°)?',
'√2/2',
'1',
'0',
'1/2',
'B',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0041',
'easy',
'What is sin(0°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'A',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0042',
'easy',
'What is sin(30°)?',
'0',
'√2/2',
'√3/2',
'1/2',
'D',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0043',
'easy',
'What is sin(45°)?',
'1/2',
'√3/2',
'√2/2',
'0',
'C',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0044',
'easy',
'What is sin(60°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'B',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0045',
'easy',
'What is sin(90°)?',
'1',
'0',
'1/2',
'√2/2',
'A',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0046',
'easy',
'What is sin(0°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'D',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0047',
'easy',
'What is sin(30°)?',
'√2/2',
'√3/2',
'1/2',
'0',
'C',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0048',
'easy',
'What is sin(45°)?',
'√3/2',
'√2/2',
'0',
'1/2',
'B',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0049',
'easy',
'What is sin(60°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'A',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0050',
'easy',
'What is sin(90°)?',
'0',
'1/2',
'√2/2',
'1',
'D',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0051',
'easy',
'What is sin(0°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'C',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0052',
'easy',
'What is sin(30°)?',
'√3/2',
'1/2',
'0',
'√2/2',
'B',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0053',
'easy',
'What is sin(45°)?',
'√2/2',
'0',
'1/2',
'√3/2',
'A',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0054',
'easy',
'What is sin(60°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'D',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0055',
'easy',
'What is sin(90°)?',
'1/2',
'√2/2',
'1',
'0',
'C',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0056',
'easy',
'What is sin(0°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'B',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0057',
'easy',
'What is sin(30°)?',
'1/2',
'0',
'√2/2',
'√3/2',
'A',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0058',
'easy',
'What is sin(45°)?',
'0',
'1/2',
'√3/2',
'√2/2',
'D',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0059',
'easy',
'What is sin(60°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'C',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0060',
'easy',
'What is sin(90°)?',
'√2/2',
'1',
'0',
'1/2',
'B',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0061',
'easy',
'What is sin(0°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'A',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0062',
'easy',
'What is sin(30°)?',
'0',
'√2/2',
'√3/2',
'1/2',
'D',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0063',
'easy',
'What is sin(45°)?',
'1/2',
'√3/2',
'√2/2',
'0',
'C',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0064',
'easy',
'What is sin(60°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'B',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0065',
'easy',
'What is sin(90°)?',
'1',
'0',
'1/2',
'√2/2',
'A',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0066',
'easy',
'What is sin(0°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'D',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0067',
'easy',
'What is sin(30°)?',
'√2/2',
'√3/2',
'1/2',
'0',
'C',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0068',
'easy',
'What is sin(45°)?',
'√3/2',
'√2/2',
'0',
'1/2',
'B',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0069',
'easy',
'What is sin(60°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'A',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0070',
'easy',
'What is sin(90°)?',
'0',
'1/2',
'√2/2',
'1',
'D',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0071',
'easy',
'What is sin(0°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'C',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0072',
'easy',
'What is sin(30°)?',
'√3/2',
'1/2',
'0',
'√2/2',
'B',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0073',
'easy',
'What is sin(45°)?',
'√2/2',
'0',
'1/2',
'√3/2',
'A',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0074',
'easy',
'What is sin(60°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'D',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0075',
'easy',
'What is sin(90°)?',
'1/2',
'√2/2',
'1',
'0',
'C',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0076',
'easy',
'What is sin(0°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'B',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0077',
'easy',
'What is sin(30°)?',
'1/2',
'0',
'√2/2',
'√3/2',
'A',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0078',
'easy',
'What is sin(45°)?',
'0',
'1/2',
'√3/2',
'√2/2',
'D',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0079',
'easy',
'What is sin(60°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'C',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0080',
'easy',
'What is sin(90°)?',
'√2/2',
'1',
'0',
'1/2',
'B',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0081',
'easy',
'What is sin(0°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'A',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0082',
'easy',
'What is sin(30°)?',
'0',
'√2/2',
'√3/2',
'1/2',
'D',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0083',
'easy',
'What is sin(45°)?',
'1/2',
'√3/2',
'√2/2',
'0',
'C',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0084',
'easy',
'What is sin(60°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'B',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0085',
'easy',
'What is sin(90°)?',
'1',
'0',
'1/2',
'√2/2',
'A',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0086',
'easy',
'What is sin(0°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'D',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0087',
'easy',
'What is sin(30°)?',
'√2/2',
'√3/2',
'1/2',
'0',
'C',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0088',
'easy',
'What is sin(45°)?',
'√3/2',
'√2/2',
'0',
'1/2',
'B',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0089',
'easy',
'What is sin(60°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'A',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0090',
'easy',
'What is sin(90°)?',
'0',
'1/2',
'√2/2',
'1',
'D',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0091',
'easy',
'What is sin(0°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'C',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0092',
'easy',
'What is sin(30°)?',
'√3/2',
'1/2',
'0',
'√2/2',
'B',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0093',
'easy',
'What is sin(45°)?',
'√2/2',
'0',
'1/2',
'√3/2',
'A',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0094',
'easy',
'What is sin(60°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'D',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0095',
'easy',
'What is sin(90°)?',
'1/2',
'√2/2',
'1',
'0',
'C',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0096',
'easy',
'What is sin(0°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'B',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0097',
'easy',
'What is sin(30°)?',
'1/2',
'0',
'√2/2',
'√3/2',
'A',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0098',
'easy',
'What is sin(45°)?',
'0',
'1/2',
'√3/2',
'√2/2',
'D',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0099',
'easy',
'What is sin(60°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'C',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0100',
'easy',
'What is sin(90°)?',
'√2/2',
'1',
'0',
'1/2',
'B',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0101',
'easy',
'What is sin(0°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'A',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0102',
'easy',
'What is sin(30°)?',
'0',
'√2/2',
'√3/2',
'1/2',
'D',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0103',
'easy',
'What is sin(45°)?',
'1/2',
'√3/2',
'√2/2',
'0',
'C',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0104',
'easy',
'What is sin(60°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'B',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0105',
'easy',
'What is sin(90°)?',
'1',
'0',
'1/2',
'√2/2',
'A',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0106',
'medium',
'What is sin(0°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'D',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0107',
'medium',
'What is sin(30°)?',
'√2/2',
'√3/2',
'1/2',
'0',
'C',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0108',
'medium',
'What is sin(45°)?',
'√3/2',
'√2/2',
'0',
'1/2',
'B',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0109',
'medium',
'What is sin(60°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'A',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0110',
'medium',
'What is sin(90°)?',
'0',
'1/2',
'√2/2',
'1',
'D',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0111',
'medium',
'What is sin(0°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'C',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0112',
'medium',
'What is sin(30°)?',
'√3/2',
'1/2',
'0',
'√2/2',
'B',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0113',
'medium',
'What is sin(45°)?',
'√2/2',
'0',
'1/2',
'√3/2',
'A',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0114',
'medium',
'What is sin(60°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'D',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0115',
'medium',
'What is sin(90°)?',
'1/2',
'√2/2',
'1',
'0',
'C',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0116',
'medium',
'What is sin(0°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'B',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0117',
'medium',
'What is sin(30°)?',
'1/2',
'0',
'√2/2',
'√3/2',
'A',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0118',
'medium',
'What is sin(45°)?',
'0',
'1/2',
'√3/2',
'√2/2',
'D',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0119',
'medium',
'What is sin(60°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'C',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0120',
'medium',
'What is sin(90°)?',
'√2/2',
'1',
'0',
'1/2',
'B',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0121',
'medium',
'What is sin(0°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'A',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0122',
'medium',
'What is sin(30°)?',
'0',
'√2/2',
'√3/2',
'1/2',
'D',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0123',
'medium',
'What is sin(45°)?',
'1/2',
'√3/2',
'√2/2',
'0',
'C',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0124',
'medium',
'What is sin(60°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'B',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0125',
'medium',
'What is sin(90°)?',
'1',
'0',
'1/2',
'√2/2',
'A',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0126',
'medium',
'What is sin(0°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'D',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0127',
'medium',
'What is sin(30°)?',
'√2/2',
'√3/2',
'1/2',
'0',
'C',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0128',
'medium',
'What is sin(45°)?',
'√3/2',
'√2/2',
'0',
'1/2',
'B',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0129',
'medium',
'What is sin(60°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'A',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0130',
'medium',
'What is sin(90°)?',
'0',
'1/2',
'√2/2',
'1',
'D',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0131',
'medium',
'What is sin(0°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'C',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0132',
'medium',
'What is sin(30°)?',
'√3/2',
'1/2',
'0',
'√2/2',
'B',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0133',
'medium',
'What is sin(45°)?',
'√2/2',
'0',
'1/2',
'√3/2',
'A',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0134',
'medium',
'What is sin(60°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'D',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0135',
'medium',
'What is sin(90°)?',
'1/2',
'√2/2',
'1',
'0',
'C',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0136',
'medium',
'What is sin(0°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'B',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0137',
'medium',
'What is sin(30°)?',
'1/2',
'0',
'√2/2',
'√3/2',
'A',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0138',
'medium',
'What is sin(45°)?',
'0',
'1/2',
'√3/2',
'√2/2',
'D',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0139',
'medium',
'What is sin(60°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'C',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0140',
'medium',
'What is sin(90°)?',
'√2/2',
'1',
'0',
'1/2',
'B',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0141',
'medium',
'What is sin(0°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'A',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0142',
'medium',
'What is sin(30°)?',
'0',
'√2/2',
'√3/2',
'1/2',
'D',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0143',
'medium',
'What is sin(45°)?',
'1/2',
'√3/2',
'√2/2',
'0',
'C',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0144',
'medium',
'What is sin(60°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'B',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0145',
'medium',
'What is sin(90°)?',
'1',
'0',
'1/2',
'√2/2',
'A',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0146',
'medium',
'What is sin(0°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'D',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0147',
'medium',
'What is sin(30°)?',
'√2/2',
'√3/2',
'1/2',
'0',
'C',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0148',
'medium',
'What is sin(45°)?',
'√3/2',
'√2/2',
'0',
'1/2',
'B',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0149',
'medium',
'What is sin(60°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'A',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0150',
'medium',
'What is sin(90°)?',
'0',
'1/2',
'√2/2',
'1',
'D',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0151',
'medium',
'What is sin(0°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'C',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0152',
'medium',
'What is sin(30°)?',
'√3/2',
'1/2',
'0',
'√2/2',
'B',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0153',
'medium',
'What is sin(45°)?',
'√2/2',
'0',
'1/2',
'√3/2',
'A',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0154',
'medium',
'What is sin(60°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'D',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0155',
'medium',
'What is sin(90°)?',
'1/2',
'√2/2',
'1',
'0',
'C',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0156',
'medium',
'What is sin(0°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'B',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0157',
'medium',
'What is sin(30°)?',
'1/2',
'0',
'√2/2',
'√3/2',
'A',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0158',
'medium',
'What is sin(45°)?',
'0',
'1/2',
'√3/2',
'√2/2',
'D',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0159',
'medium',
'What is sin(60°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'C',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0160',
'medium',
'What is sin(90°)?',
'√2/2',
'1',
'0',
'1/2',
'B',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0161',
'medium',
'What is sin(0°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'A',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0162',
'medium',
'What is sin(30°)?',
'0',
'√2/2',
'√3/2',
'1/2',
'D',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0163',
'medium',
'What is sin(45°)?',
'1/2',
'√3/2',
'√2/2',
'0',
'C',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0164',
'medium',
'What is sin(60°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'B',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0165',
'medium',
'What is sin(90°)?',
'1',
'0',
'1/2',
'√2/2',
'A',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0166',
'medium',
'What is sin(0°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'D',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0167',
'medium',
'What is sin(30°)?',
'√2/2',
'√3/2',
'1/2',
'0',
'C',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0168',
'medium',
'What is sin(45°)?',
'√3/2',
'√2/2',
'0',
'1/2',
'B',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0169',
'medium',
'What is sin(60°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'A',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0170',
'medium',
'What is sin(90°)?',
'0',
'1/2',
'√2/2',
'1',
'D',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0171',
'medium',
'What is sin(0°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'C',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0172',
'medium',
'What is sin(30°)?',
'√3/2',
'1/2',
'0',
'√2/2',
'B',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0173',
'medium',
'What is sin(45°)?',
'√2/2',
'0',
'1/2',
'√3/2',
'A',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0174',
'medium',
'What is sin(60°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'D',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0175',
'medium',
'What is sin(90°)?',
'1/2',
'√2/2',
'1',
'0',
'C',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0176',
'medium',
'What is sin(0°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'B',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0177',
'medium',
'What is sin(30°)?',
'1/2',
'0',
'√2/2',
'√3/2',
'A',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0178',
'medium',
'What is sin(45°)?',
'0',
'1/2',
'√3/2',
'√2/2',
'D',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0179',
'medium',
'What is sin(60°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'C',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0180',
'medium',
'What is sin(90°)?',
'√2/2',
'1',
'0',
'1/2',
'B',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0181',
'medium',
'What is sin(0°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'A',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0182',
'medium',
'What is sin(30°)?',
'0',
'√2/2',
'√3/2',
'1/2',
'D',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0183',
'medium',
'What is sin(45°)?',
'1/2',
'√3/2',
'√2/2',
'0',
'C',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0184',
'medium',
'What is sin(60°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'B',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0185',
'medium',
'What is sin(90°)?',
'1',
'0',
'1/2',
'√2/2',
'A',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0186',
'medium',
'What is sin(0°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'D',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0187',
'medium',
'What is sin(30°)?',
'√2/2',
'√3/2',
'1/2',
'0',
'C',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0188',
'medium',
'What is sin(45°)?',
'√3/2',
'√2/2',
'0',
'1/2',
'B',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0189',
'medium',
'What is sin(60°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'A',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0190',
'medium',
'What is sin(90°)?',
'0',
'1/2',
'√2/2',
'1',
'D',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0191',
'medium',
'What is sin(0°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'C',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0192',
'medium',
'What is sin(30°)?',
'√3/2',
'1/2',
'0',
'√2/2',
'B',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0193',
'medium',
'What is sin(45°)?',
'√2/2',
'0',
'1/2',
'√3/2',
'A',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0194',
'medium',
'What is sin(60°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'D',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0195',
'medium',
'What is sin(90°)?',
'1/2',
'√2/2',
'1',
'0',
'C',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0196',
'medium',
'What is sin(0°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'B',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0197',
'medium',
'What is sin(30°)?',
'1/2',
'0',
'√2/2',
'√3/2',
'A',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0198',
'medium',
'What is sin(45°)?',
'0',
'1/2',
'√3/2',
'√2/2',
'D',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0199',
'medium',
'What is sin(60°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'C',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0200',
'medium',
'What is sin(90°)?',
'√2/2',
'1',
'0',
'1/2',
'B',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0201',
'medium',
'What is sin(0°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'A',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0202',
'medium',
'What is sin(30°)?',
'0',
'√2/2',
'√3/2',
'1/2',
'D',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0203',
'medium',
'What is sin(45°)?',
'1/2',
'√3/2',
'√2/2',
'0',
'C',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0204',
'medium',
'What is sin(60°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'B',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0205',
'medium',
'What is sin(90°)?',
'1',
'0',
'1/2',
'√2/2',
'A',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0206',
'medium',
'What is sin(0°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'D',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0207',
'medium',
'What is sin(30°)?',
'√2/2',
'√3/2',
'1/2',
'0',
'C',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0208',
'medium',
'What is sin(45°)?',
'√3/2',
'√2/2',
'0',
'1/2',
'B',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0209',
'medium',
'What is sin(60°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'A',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0210',
'medium',
'What is sin(90°)?',
'0',
'1/2',
'√2/2',
'1',
'D',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0211',
'medium',
'What is sin(0°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'C',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0212',
'medium',
'What is sin(30°)?',
'√3/2',
'1/2',
'0',
'√2/2',
'B',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0213',
'medium',
'What is sin(45°)?',
'√2/2',
'0',
'1/2',
'√3/2',
'A',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0214',
'medium',
'What is sin(60°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'D',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0215',
'medium',
'What is sin(90°)?',
'1/2',
'√2/2',
'1',
'0',
'C',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0216',
'medium',
'What is sin(0°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'B',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0217',
'medium',
'What is sin(30°)?',
'1/2',
'0',
'√2/2',
'√3/2',
'A',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0218',
'medium',
'What is sin(45°)?',
'0',
'1/2',
'√3/2',
'√2/2',
'D',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0219',
'medium',
'What is sin(60°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'C',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0220',
'medium',
'What is sin(90°)?',
'√2/2',
'1',
'0',
'1/2',
'B',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0221',
'medium',
'What is sin(0°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'A',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0222',
'medium',
'What is sin(30°)?',
'0',
'√2/2',
'√3/2',
'1/2',
'D',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0223',
'medium',
'What is sin(45°)?',
'1/2',
'√3/2',
'√2/2',
'0',
'C',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0224',
'medium',
'What is sin(60°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'B',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0225',
'medium',
'What is sin(90°)?',
'1',
'0',
'1/2',
'√2/2',
'A',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0226',
'medium',
'What is sin(0°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'D',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0227',
'medium',
'What is sin(30°)?',
'√2/2',
'√3/2',
'1/2',
'0',
'C',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0228',
'medium',
'What is sin(45°)?',
'√3/2',
'√2/2',
'0',
'1/2',
'B',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0229',
'medium',
'What is sin(60°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'A',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0230',
'medium',
'What is sin(90°)?',
'0',
'1/2',
'√2/2',
'1',
'D',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0231',
'medium',
'What is sin(0°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'C',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0232',
'medium',
'What is sin(30°)?',
'√3/2',
'1/2',
'0',
'√2/2',
'B',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0233',
'medium',
'What is sin(45°)?',
'√2/2',
'0',
'1/2',
'√3/2',
'A',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0234',
'medium',
'What is sin(60°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'D',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0235',
'medium',
'What is sin(90°)?',
'1/2',
'√2/2',
'1',
'0',
'C',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0236',
'medium',
'What is sin(0°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'B',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0237',
'medium',
'What is sin(30°)?',
'1/2',
'0',
'√2/2',
'√3/2',
'A',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0238',
'medium',
'What is sin(45°)?',
'0',
'1/2',
'√3/2',
'√2/2',
'D',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0239',
'medium',
'What is sin(60°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'C',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0240',
'medium',
'What is sin(90°)?',
'√2/2',
'1',
'0',
'1/2',
'B',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0241',
'challenge',
'What is sin(0°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'A',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0242',
'challenge',
'What is sin(30°)?',
'0',
'√2/2',
'√3/2',
'1/2',
'D',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0243',
'challenge',
'What is sin(45°)?',
'1/2',
'√3/2',
'√2/2',
'0',
'C',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0244',
'challenge',
'What is sin(60°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'B',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0245',
'challenge',
'What is sin(90°)?',
'1',
'0',
'1/2',
'√2/2',
'A',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0246',
'challenge',
'What is sin(0°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'D',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0247',
'challenge',
'What is sin(30°)?',
'√2/2',
'√3/2',
'1/2',
'0',
'C',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0248',
'challenge',
'What is sin(45°)?',
'√3/2',
'√2/2',
'0',
'1/2',
'B',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0249',
'challenge',
'What is sin(60°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'A',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0250',
'challenge',
'What is sin(90°)?',
'0',
'1/2',
'√2/2',
'1',
'D',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0251',
'challenge',
'What is sin(0°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'C',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0252',
'challenge',
'What is sin(30°)?',
'√3/2',
'1/2',
'0',
'√2/2',
'B',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0253',
'challenge',
'What is sin(45°)?',
'√2/2',
'0',
'1/2',
'√3/2',
'A',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0254',
'challenge',
'What is sin(60°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'D',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0255',
'challenge',
'What is sin(90°)?',
'1/2',
'√2/2',
'1',
'0',
'C',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0256',
'challenge',
'What is sin(0°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'B',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0257',
'challenge',
'What is sin(30°)?',
'1/2',
'0',
'√2/2',
'√3/2',
'A',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0258',
'challenge',
'What is sin(45°)?',
'0',
'1/2',
'√3/2',
'√2/2',
'D',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0259',
'challenge',
'What is sin(60°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'C',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0260',
'challenge',
'What is sin(90°)?',
'√2/2',
'1',
'0',
'1/2',
'B',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0261',
'challenge',
'What is sin(0°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'A',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0262',
'challenge',
'What is sin(30°)?',
'0',
'√2/2',
'√3/2',
'1/2',
'D',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0263',
'challenge',
'What is sin(45°)?',
'1/2',
'√3/2',
'√2/2',
'0',
'C',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0264',
'challenge',
'What is sin(60°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'B',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0265',
'challenge',
'What is sin(90°)?',
'1',
'0',
'1/2',
'√2/2',
'A',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0266',
'challenge',
'What is sin(0°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'D',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0267',
'challenge',
'What is sin(30°)?',
'√2/2',
'√3/2',
'1/2',
'0',
'C',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0268',
'challenge',
'What is sin(45°)?',
'√3/2',
'√2/2',
'0',
'1/2',
'B',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0269',
'challenge',
'What is sin(60°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'A',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0270',
'challenge',
'What is sin(90°)?',
'0',
'1/2',
'√2/2',
'1',
'D',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0271',
'challenge',
'What is sin(0°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'C',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0272',
'challenge',
'What is sin(30°)?',
'√3/2',
'1/2',
'0',
'√2/2',
'B',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0273',
'challenge',
'What is sin(45°)?',
'√2/2',
'0',
'1/2',
'√3/2',
'A',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0274',
'challenge',
'What is sin(60°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'D',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0275',
'challenge',
'What is sin(90°)?',
'1/2',
'√2/2',
'1',
'0',
'C',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0276',
'challenge',
'What is sin(0°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'B',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0277',
'challenge',
'What is sin(30°)?',
'1/2',
'0',
'√2/2',
'√3/2',
'A',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0278',
'challenge',
'What is sin(45°)?',
'0',
'1/2',
'√3/2',
'√2/2',
'D',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0279',
'challenge',
'What is sin(60°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'C',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0280',
'challenge',
'What is sin(90°)?',
'√2/2',
'1',
'0',
'1/2',
'B',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0281',
'challenge',
'What is sin(0°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'A',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0282',
'challenge',
'What is sin(30°)?',
'0',
'√2/2',
'√3/2',
'1/2',
'D',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0283',
'challenge',
'What is sin(45°)?',
'1/2',
'√3/2',
'√2/2',
'0',
'C',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0284',
'challenge',
'What is sin(60°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'B',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0285',
'challenge',
'What is sin(90°)?',
'1',
'0',
'1/2',
'√2/2',
'A',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0286',
'challenge',
'What is sin(0°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'D',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0287',
'challenge',
'What is sin(30°)?',
'√2/2',
'√3/2',
'1/2',
'0',
'C',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0288',
'challenge',
'What is sin(45°)?',
'√3/2',
'√2/2',
'0',
'1/2',
'B',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0289',
'challenge',
'What is sin(60°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'A',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0290',
'challenge',
'What is sin(90°)?',
'0',
'1/2',
'√2/2',
'1',
'D',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0291',
'challenge',
'What is sin(0°)?',
'√2/2',
'√3/2',
'0',
'1/2',
'C',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0292',
'challenge',
'What is sin(30°)?',
'√3/2',
'1/2',
'0',
'√2/2',
'B',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0293',
'challenge',
'What is sin(45°)?',
'√2/2',
'0',
'1/2',
'√3/2',
'A',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0294',
'challenge',
'What is sin(60°)?',
'0',
'1/2',
'√2/2',
'√3/2',
'D',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0295',
'challenge',
'What is sin(90°)?',
'1/2',
'√2/2',
'1',
'0',
'C',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0296',
'challenge',
'What is sin(0°)?',
'√3/2',
'0',
'1/2',
'√2/2',
'B',
'sin(0°)=0.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0297',
'challenge',
'What is sin(30°)?',
'1/2',
'0',
'√2/2',
'√3/2',
'A',
'sin(30°)=1/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0298',
'challenge',
'What is sin(45°)?',
'0',
'1/2',
'√3/2',
'√2/2',
'D',
'sin(45°)=√2/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0299',
'challenge',
'What is sin(60°)?',
'1/2',
'√2/2',
'√3/2',
'0',
'C',
'sin(60°)=√3/2.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_TRIG_0300',
'challenge',
'What is sin(90°)?',
'√2/2',
'1',
'0',
'1/2',
'B',
'sin(90°)=1.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='TRIG';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0001',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0002',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0003',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0004',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0005',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0006',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0007',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0008',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0009',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0010',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0011',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0012',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0013',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0014',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0015',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0016',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0017',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0018',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0019',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0020',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0021',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0022',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0023',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0024',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0025',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0026',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0027',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0028',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0029',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0030',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0031',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0032',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0033',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0034',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0035',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0036',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0037',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0038',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0039',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0040',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0041',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0042',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0043',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0044',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0045',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0046',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0047',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0048',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0049',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0050',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0051',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0052',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0053',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0054',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0055',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0056',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0057',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0058',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0059',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0060',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0061',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0062',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0063',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0064',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0065',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0066',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0067',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0068',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0069',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0070',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0071',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0072',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0073',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0074',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0075',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0076',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0077',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0078',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0079',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0080',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0081',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0082',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0083',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0084',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0085',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0086',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0087',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0088',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0089',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0090',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0091',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0092',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0093',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0094',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0095',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0096',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0097',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0098',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0099',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0100',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0101',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0102',
'easy',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0103',
'easy',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0104',
'easy',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0105',
'easy',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0106',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0107',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0108',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0109',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0110',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0111',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0112',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0113',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0114',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0115',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0116',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0117',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0118',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0119',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0120',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0121',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0122',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0123',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0124',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0125',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0126',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0127',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0128',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0129',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0130',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0131',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0132',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0133',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0134',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0135',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0136',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0137',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0138',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0139',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0140',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0141',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0142',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0143',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0144',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0145',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0146',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0147',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0148',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0149',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0150',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0151',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0152',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0153',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0154',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0155',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0156',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0157',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0158',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0159',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0160',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0161',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0162',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0163',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0164',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0165',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0166',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0167',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0168',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0169',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0170',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0171',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0172',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0173',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0174',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0175',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0176',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0177',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0178',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0179',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0180',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0181',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0182',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0183',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0184',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0185',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0186',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0187',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0188',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0189',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0190',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0191',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0192',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0193',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0194',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0195',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0196',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0197',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0198',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0199',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0200',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0201',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0202',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0203',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0204',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0205',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0206',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0207',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0208',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0209',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0210',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0211',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0212',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0213',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0214',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0215',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0216',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0217',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0218',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0219',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0220',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0221',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0222',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0223',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0224',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0225',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0226',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0227',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0228',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0229',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0230',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0231',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0232',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0233',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0234',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0235',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0236',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0237',
'medium',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0238',
'medium',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0239',
'medium',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0240',
'medium',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0241',
'challenge',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0242',
'challenge',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0243',
'challenge',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0244',
'challenge',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0245',
'challenge',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0246',
'challenge',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0247',
'challenge',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0248',
'challenge',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0249',
'challenge',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0250',
'challenge',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0251',
'challenge',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0252',
'challenge',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0253',
'challenge',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0254',
'challenge',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0255',
'challenge',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0256',
'challenge',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0257',
'challenge',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0258',
'challenge',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0259',
'challenge',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0260',
'challenge',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0261',
'challenge',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0262',
'challenge',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0263',
'challenge',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0264',
'challenge',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0265',
'challenge',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0266',
'challenge',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0267',
'challenge',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0268',
'challenge',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0269',
'challenge',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0270',
'challenge',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0271',
'challenge',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0272',
'challenge',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0273',
'challenge',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0274',
'challenge',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0275',
'challenge',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0276',
'challenge',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0277',
'challenge',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0278',
'challenge',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0279',
'challenge',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0280',
'challenge',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0281',
'challenge',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0282',
'challenge',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0283',
'challenge',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0284',
'challenge',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0285',
'challenge',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0286',
'challenge',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0287',
'challenge',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0288',
'challenge',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0289',
'challenge',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0290',
'challenge',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0291',
'challenge',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0292',
'challenge',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0293',
'challenge',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0294',
'challenge',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0295',
'challenge',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0296',
'challenge',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0297',
'challenge',
'What is log base 2 of 4?',
'2',
'4',
'3',
'2 (1)',
'A',
'2^2=4.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0298',
'challenge',
'What is log base 3 of 27?',
'27',
'4',
'3 (1)',
'3',
'D',
'3^3=27.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0299',
'challenge',
'What is log base 4 of 256?',
'5',
'4 (1)',
'4',
'256',
'C',
'4^4=256.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_MATH_LOGS_0300',
'challenge',
'What is log base 5 of 3125?',
'5 (1)',
'5',
'3125',
'6',
'B',
'5^5=3125.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='LOGS';

