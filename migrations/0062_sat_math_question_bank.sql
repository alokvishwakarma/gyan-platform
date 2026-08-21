-- GENERATED ORIGINAL PRACTICE BANK
PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO education_subjects
(country_code, grade_code, subject_code, subject_name, enabled, sort_order)
VALUES ('US','PROGRAM_SAT','MATH','SAT Math',1,10);

INSERT OR IGNORE INTO education_topics
(subject_id, topic_code, topic_name, enabled, sort_order)
SELECT id,'MATH','Math',1,10
FROM education_subjects
WHERE country_code='US' AND grade_code='PROGRAM_SAT' AND subject_code='MATH';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'ALGEBRA','Algebra',1,10
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_SAT' AND s.subject_code='MATH'
  AND t.topic_code='MATH';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'ADVANCED','Advanced Math',1,20
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_SAT' AND s.subject_code='MATH'
  AND t.topic_code='MATH';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'GEOMETRY','Geometry',1,30
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_SAT' AND s.subject_code='MATH'
  AND t.topic_code='MATH';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'DATA','Data Analysis',1,40
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US' AND s.grade_code='PROGRAM_SAT' AND s.subject_code='MATH'
  AND t.topic_code='MATH';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0001',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0002',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0003',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0004',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0005',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0006',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0007',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0008',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0009',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0010',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0011',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0012',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0013',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0014',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0015',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0016',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0017',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0018',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0019',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0020',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0021',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0022',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0023',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0024',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0025',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0026',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0027',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0028',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0029',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0030',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0031',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0032',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0033',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0034',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0035',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0036',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0037',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0038',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0039',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0040',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0041',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0042',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0043',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0044',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0045',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0046',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0047',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0048',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0049',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0050',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0051',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0052',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0053',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0054',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0055',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0056',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0057',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0058',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0059',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0060',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0061',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0062',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0063',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0064',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0065',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0066',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0067',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0068',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0069',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0070',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0071',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0072',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0073',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0074',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0075',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0076',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0077',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0078',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0079',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0080',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0081',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0082',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0083',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0084',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0085',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0086',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0087',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0088',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0089',
'medium',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0090',
'medium',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0091',
'medium',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0092',
'medium',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0093',
'medium',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0094',
'medium',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0095',
'medium',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0096',
'medium',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0097',
'medium',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0098',
'medium',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0099',
'medium',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0100',
'medium',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0101',
'medium',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0102',
'medium',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0103',
'medium',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0104',
'medium',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0105',
'medium',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0106',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0107',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0108',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0109',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0110',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0111',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0112',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0113',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0114',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0115',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0116',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0117',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0118',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0119',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0120',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0121',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0122',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0123',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0124',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0125',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0126',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0127',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0128',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0129',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0130',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0131',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0132',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0133',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0134',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0135',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0136',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0137',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0138',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0139',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0140',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0141',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0142',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0143',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0144',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0145',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0146',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0147',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0148',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0149',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0150',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0151',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0152',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0153',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0154',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0155',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0156',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0157',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0158',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0159',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0160',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0161',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0162',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0163',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0164',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0165',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0166',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0167',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0168',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0169',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0170',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0171',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0172',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0173',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0174',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0175',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0176',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0177',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0178',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0179',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0180',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0181',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0182',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0183',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0184',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0185',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0186',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0187',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0188',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0189',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0190',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0191',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0192',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0193',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0194',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0195',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0196',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0197',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0198',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0199',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0200',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0201',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0202',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0203',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0204',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0205',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0206',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0207',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0208',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0209',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0210',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0211',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0212',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0213',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0214',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0215',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0216',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0217',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0218',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0219',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0220',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0221',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0222',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0223',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0224',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0225',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0226',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0227',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0228',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0229',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0230',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0231',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0232',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0233',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0234',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0235',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0236',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0237',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0238',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0239',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0240',
'challenge',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0241',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0242',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0243',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0244',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0245',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0246',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0247',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0248',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0249',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ALGEBRA_0250',
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
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ALGEBRA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0001',
'easy',
'What is one solution of x²=1?',
'1',
'2',
'0',
'1 (1)',
'A',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0002',
'easy',
'What is one solution of x²=4?',
'4',
'3',
'0',
'2',
'D',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0003',
'easy',
'What is one solution of x²=9?',
'4',
'0',
'3',
'9',
'C',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0004',
'easy',
'What is one solution of x²=16?',
'0',
'4',
'16',
'5',
'B',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0005',
'easy',
'What is one solution of x²=25?',
'5',
'25',
'6',
'0',
'A',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0006',
'easy',
'What is one solution of x²=36?',
'36',
'7',
'0',
'6',
'D',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0007',
'easy',
'What is one solution of x²=49?',
'8',
'0',
'7',
'49',
'C',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0008',
'easy',
'What is one solution of x²=64?',
'0',
'8',
'64',
'9',
'B',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0009',
'easy',
'What is one solution of x²=81?',
'9',
'81',
'10',
'0',
'A',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0010',
'easy',
'What is one solution of x²=100?',
'100',
'11',
'0',
'10',
'D',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0011',
'easy',
'What is one solution of x²=1?',
'0',
'1 (1)',
'1',
'2',
'C',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0012',
'easy',
'What is one solution of x²=4?',
'0',
'2',
'4',
'3',
'B',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0013',
'easy',
'What is one solution of x²=9?',
'3',
'9',
'4',
'0',
'A',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0014',
'easy',
'What is one solution of x²=16?',
'16',
'5',
'0',
'4',
'D',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0015',
'easy',
'What is one solution of x²=25?',
'6',
'0',
'5',
'25',
'C',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0016',
'easy',
'What is one solution of x²=36?',
'0',
'6',
'36',
'7',
'B',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0017',
'easy',
'What is one solution of x²=49?',
'7',
'49',
'8',
'0',
'A',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0018',
'easy',
'What is one solution of x²=64?',
'64',
'9',
'0',
'8',
'D',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0019',
'easy',
'What is one solution of x²=81?',
'10',
'0',
'9',
'81',
'C',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0020',
'easy',
'What is one solution of x²=100?',
'0',
'10',
'100',
'11',
'B',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0021',
'easy',
'What is one solution of x²=1?',
'1',
'2',
'0',
'1 (1)',
'A',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0022',
'easy',
'What is one solution of x²=4?',
'4',
'3',
'0',
'2',
'D',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0023',
'easy',
'What is one solution of x²=9?',
'4',
'0',
'3',
'9',
'C',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0024',
'easy',
'What is one solution of x²=16?',
'0',
'4',
'16',
'5',
'B',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0025',
'easy',
'What is one solution of x²=25?',
'5',
'25',
'6',
'0',
'A',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0026',
'easy',
'What is one solution of x²=36?',
'36',
'7',
'0',
'6',
'D',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0027',
'easy',
'What is one solution of x²=49?',
'8',
'0',
'7',
'49',
'C',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0028',
'easy',
'What is one solution of x²=64?',
'0',
'8',
'64',
'9',
'B',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0029',
'easy',
'What is one solution of x²=81?',
'9',
'81',
'10',
'0',
'A',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0030',
'easy',
'What is one solution of x²=100?',
'100',
'11',
'0',
'10',
'D',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0031',
'easy',
'What is one solution of x²=1?',
'0',
'1 (1)',
'1',
'2',
'C',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0032',
'easy',
'What is one solution of x²=4?',
'0',
'2',
'4',
'3',
'B',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0033',
'easy',
'What is one solution of x²=9?',
'3',
'9',
'4',
'0',
'A',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0034',
'easy',
'What is one solution of x²=16?',
'16',
'5',
'0',
'4',
'D',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0035',
'easy',
'What is one solution of x²=25?',
'6',
'0',
'5',
'25',
'C',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0036',
'easy',
'What is one solution of x²=36?',
'0',
'6',
'36',
'7',
'B',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0037',
'easy',
'What is one solution of x²=49?',
'7',
'49',
'8',
'0',
'A',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0038',
'easy',
'What is one solution of x²=64?',
'64',
'9',
'0',
'8',
'D',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0039',
'easy',
'What is one solution of x²=81?',
'10',
'0',
'9',
'81',
'C',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0040',
'easy',
'What is one solution of x²=100?',
'0',
'10',
'100',
'11',
'B',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0041',
'easy',
'What is one solution of x²=1?',
'1',
'2',
'0',
'1 (1)',
'A',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0042',
'easy',
'What is one solution of x²=4?',
'4',
'3',
'0',
'2',
'D',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0043',
'easy',
'What is one solution of x²=9?',
'4',
'0',
'3',
'9',
'C',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0044',
'easy',
'What is one solution of x²=16?',
'0',
'4',
'16',
'5',
'B',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0045',
'easy',
'What is one solution of x²=25?',
'5',
'25',
'6',
'0',
'A',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0046',
'easy',
'What is one solution of x²=36?',
'36',
'7',
'0',
'6',
'D',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0047',
'easy',
'What is one solution of x²=49?',
'8',
'0',
'7',
'49',
'C',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0048',
'easy',
'What is one solution of x²=64?',
'0',
'8',
'64',
'9',
'B',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0049',
'easy',
'What is one solution of x²=81?',
'9',
'81',
'10',
'0',
'A',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0050',
'easy',
'What is one solution of x²=100?',
'100',
'11',
'0',
'10',
'D',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0051',
'easy',
'What is one solution of x²=1?',
'0',
'1 (1)',
'1',
'2',
'C',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0052',
'easy',
'What is one solution of x²=4?',
'0',
'2',
'4',
'3',
'B',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0053',
'easy',
'What is one solution of x²=9?',
'3',
'9',
'4',
'0',
'A',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0054',
'easy',
'What is one solution of x²=16?',
'16',
'5',
'0',
'4',
'D',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0055',
'easy',
'What is one solution of x²=25?',
'6',
'0',
'5',
'25',
'C',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0056',
'easy',
'What is one solution of x²=36?',
'0',
'6',
'36',
'7',
'B',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0057',
'easy',
'What is one solution of x²=49?',
'7',
'49',
'8',
'0',
'A',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0058',
'easy',
'What is one solution of x²=64?',
'64',
'9',
'0',
'8',
'D',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0059',
'easy',
'What is one solution of x²=81?',
'10',
'0',
'9',
'81',
'C',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0060',
'easy',
'What is one solution of x²=100?',
'0',
'10',
'100',
'11',
'B',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0061',
'easy',
'What is one solution of x²=1?',
'1',
'2',
'0',
'1 (1)',
'A',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0062',
'easy',
'What is one solution of x²=4?',
'4',
'3',
'0',
'2',
'D',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0063',
'easy',
'What is one solution of x²=9?',
'4',
'0',
'3',
'9',
'C',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0064',
'easy',
'What is one solution of x²=16?',
'0',
'4',
'16',
'5',
'B',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0065',
'easy',
'What is one solution of x²=25?',
'5',
'25',
'6',
'0',
'A',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0066',
'easy',
'What is one solution of x²=36?',
'36',
'7',
'0',
'6',
'D',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0067',
'easy',
'What is one solution of x²=49?',
'8',
'0',
'7',
'49',
'C',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0068',
'easy',
'What is one solution of x²=64?',
'0',
'8',
'64',
'9',
'B',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0069',
'easy',
'What is one solution of x²=81?',
'9',
'81',
'10',
'0',
'A',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0070',
'easy',
'What is one solution of x²=100?',
'100',
'11',
'0',
'10',
'D',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0071',
'easy',
'What is one solution of x²=1?',
'0',
'1 (1)',
'1',
'2',
'C',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0072',
'easy',
'What is one solution of x²=4?',
'0',
'2',
'4',
'3',
'B',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0073',
'easy',
'What is one solution of x²=9?',
'3',
'9',
'4',
'0',
'A',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0074',
'easy',
'What is one solution of x²=16?',
'16',
'5',
'0',
'4',
'D',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0075',
'easy',
'What is one solution of x²=25?',
'6',
'0',
'5',
'25',
'C',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0076',
'easy',
'What is one solution of x²=36?',
'0',
'6',
'36',
'7',
'B',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0077',
'easy',
'What is one solution of x²=49?',
'7',
'49',
'8',
'0',
'A',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0078',
'easy',
'What is one solution of x²=64?',
'64',
'9',
'0',
'8',
'D',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0079',
'easy',
'What is one solution of x²=81?',
'10',
'0',
'9',
'81',
'C',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0080',
'easy',
'What is one solution of x²=100?',
'0',
'10',
'100',
'11',
'B',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0081',
'easy',
'What is one solution of x²=1?',
'1',
'2',
'0',
'1 (1)',
'A',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0082',
'easy',
'What is one solution of x²=4?',
'4',
'3',
'0',
'2',
'D',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0083',
'easy',
'What is one solution of x²=9?',
'4',
'0',
'3',
'9',
'C',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0084',
'easy',
'What is one solution of x²=16?',
'0',
'4',
'16',
'5',
'B',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0085',
'easy',
'What is one solution of x²=25?',
'5',
'25',
'6',
'0',
'A',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0086',
'easy',
'What is one solution of x²=36?',
'36',
'7',
'0',
'6',
'D',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0087',
'easy',
'What is one solution of x²=49?',
'8',
'0',
'7',
'49',
'C',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0088',
'easy',
'What is one solution of x²=64?',
'0',
'8',
'64',
'9',
'B',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0089',
'medium',
'What is one solution of x²=81?',
'9',
'81',
'10',
'0',
'A',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0090',
'medium',
'What is one solution of x²=100?',
'100',
'11',
'0',
'10',
'D',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0091',
'medium',
'What is one solution of x²=1?',
'0',
'1 (1)',
'1',
'2',
'C',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0092',
'medium',
'What is one solution of x²=4?',
'0',
'2',
'4',
'3',
'B',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0093',
'medium',
'What is one solution of x²=9?',
'3',
'9',
'4',
'0',
'A',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0094',
'medium',
'What is one solution of x²=16?',
'16',
'5',
'0',
'4',
'D',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0095',
'medium',
'What is one solution of x²=25?',
'6',
'0',
'5',
'25',
'C',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0096',
'medium',
'What is one solution of x²=36?',
'0',
'6',
'36',
'7',
'B',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0097',
'medium',
'What is one solution of x²=49?',
'7',
'49',
'8',
'0',
'A',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0098',
'medium',
'What is one solution of x²=64?',
'64',
'9',
'0',
'8',
'D',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0099',
'medium',
'What is one solution of x²=81?',
'10',
'0',
'9',
'81',
'C',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0100',
'medium',
'What is one solution of x²=100?',
'0',
'10',
'100',
'11',
'B',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0101',
'medium',
'What is one solution of x²=1?',
'1',
'2',
'0',
'1 (1)',
'A',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0102',
'medium',
'What is one solution of x²=4?',
'4',
'3',
'0',
'2',
'D',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0103',
'medium',
'What is one solution of x²=9?',
'4',
'0',
'3',
'9',
'C',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0104',
'medium',
'What is one solution of x²=16?',
'0',
'4',
'16',
'5',
'B',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0105',
'medium',
'What is one solution of x²=25?',
'5',
'25',
'6',
'0',
'A',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0106',
'medium',
'What is one solution of x²=36?',
'36',
'7',
'0',
'6',
'D',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0107',
'medium',
'What is one solution of x²=49?',
'8',
'0',
'7',
'49',
'C',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0108',
'medium',
'What is one solution of x²=64?',
'0',
'8',
'64',
'9',
'B',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0109',
'medium',
'What is one solution of x²=81?',
'9',
'81',
'10',
'0',
'A',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0110',
'medium',
'What is one solution of x²=100?',
'100',
'11',
'0',
'10',
'D',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0111',
'medium',
'What is one solution of x²=1?',
'0',
'1 (1)',
'1',
'2',
'C',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0112',
'medium',
'What is one solution of x²=4?',
'0',
'2',
'4',
'3',
'B',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0113',
'medium',
'What is one solution of x²=9?',
'3',
'9',
'4',
'0',
'A',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0114',
'medium',
'What is one solution of x²=16?',
'16',
'5',
'0',
'4',
'D',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0115',
'medium',
'What is one solution of x²=25?',
'6',
'0',
'5',
'25',
'C',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0116',
'medium',
'What is one solution of x²=36?',
'0',
'6',
'36',
'7',
'B',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0117',
'medium',
'What is one solution of x²=49?',
'7',
'49',
'8',
'0',
'A',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0118',
'medium',
'What is one solution of x²=64?',
'64',
'9',
'0',
'8',
'D',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0119',
'medium',
'What is one solution of x²=81?',
'10',
'0',
'9',
'81',
'C',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0120',
'medium',
'What is one solution of x²=100?',
'0',
'10',
'100',
'11',
'B',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0121',
'medium',
'What is one solution of x²=1?',
'1',
'2',
'0',
'1 (1)',
'A',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0122',
'medium',
'What is one solution of x²=4?',
'4',
'3',
'0',
'2',
'D',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0123',
'medium',
'What is one solution of x²=9?',
'4',
'0',
'3',
'9',
'C',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0124',
'medium',
'What is one solution of x²=16?',
'0',
'4',
'16',
'5',
'B',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0125',
'medium',
'What is one solution of x²=25?',
'5',
'25',
'6',
'0',
'A',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0126',
'medium',
'What is one solution of x²=36?',
'36',
'7',
'0',
'6',
'D',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0127',
'medium',
'What is one solution of x²=49?',
'8',
'0',
'7',
'49',
'C',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0128',
'medium',
'What is one solution of x²=64?',
'0',
'8',
'64',
'9',
'B',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0129',
'medium',
'What is one solution of x²=81?',
'9',
'81',
'10',
'0',
'A',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0130',
'medium',
'What is one solution of x²=100?',
'100',
'11',
'0',
'10',
'D',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0131',
'medium',
'What is one solution of x²=1?',
'0',
'1 (1)',
'1',
'2',
'C',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0132',
'medium',
'What is one solution of x²=4?',
'0',
'2',
'4',
'3',
'B',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0133',
'medium',
'What is one solution of x²=9?',
'3',
'9',
'4',
'0',
'A',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0134',
'medium',
'What is one solution of x²=16?',
'16',
'5',
'0',
'4',
'D',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0135',
'medium',
'What is one solution of x²=25?',
'6',
'0',
'5',
'25',
'C',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0136',
'medium',
'What is one solution of x²=36?',
'0',
'6',
'36',
'7',
'B',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0137',
'medium',
'What is one solution of x²=49?',
'7',
'49',
'8',
'0',
'A',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0138',
'medium',
'What is one solution of x²=64?',
'64',
'9',
'0',
'8',
'D',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0139',
'medium',
'What is one solution of x²=81?',
'10',
'0',
'9',
'81',
'C',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0140',
'medium',
'What is one solution of x²=100?',
'0',
'10',
'100',
'11',
'B',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0141',
'medium',
'What is one solution of x²=1?',
'1',
'2',
'0',
'1 (1)',
'A',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0142',
'medium',
'What is one solution of x²=4?',
'4',
'3',
'0',
'2',
'D',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0143',
'medium',
'What is one solution of x²=9?',
'4',
'0',
'3',
'9',
'C',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0144',
'medium',
'What is one solution of x²=16?',
'0',
'4',
'16',
'5',
'B',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0145',
'medium',
'What is one solution of x²=25?',
'5',
'25',
'6',
'0',
'A',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0146',
'medium',
'What is one solution of x²=36?',
'36',
'7',
'0',
'6',
'D',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0147',
'medium',
'What is one solution of x²=49?',
'8',
'0',
'7',
'49',
'C',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0148',
'medium',
'What is one solution of x²=64?',
'0',
'8',
'64',
'9',
'B',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0149',
'medium',
'What is one solution of x²=81?',
'9',
'81',
'10',
'0',
'A',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0150',
'medium',
'What is one solution of x²=100?',
'100',
'11',
'0',
'10',
'D',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0151',
'medium',
'What is one solution of x²=1?',
'0',
'1 (1)',
'1',
'2',
'C',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0152',
'medium',
'What is one solution of x²=4?',
'0',
'2',
'4',
'3',
'B',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0153',
'medium',
'What is one solution of x²=9?',
'3',
'9',
'4',
'0',
'A',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0154',
'medium',
'What is one solution of x²=16?',
'16',
'5',
'0',
'4',
'D',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0155',
'medium',
'What is one solution of x²=25?',
'6',
'0',
'5',
'25',
'C',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0156',
'medium',
'What is one solution of x²=36?',
'0',
'6',
'36',
'7',
'B',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0157',
'medium',
'What is one solution of x²=49?',
'7',
'49',
'8',
'0',
'A',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0158',
'medium',
'What is one solution of x²=64?',
'64',
'9',
'0',
'8',
'D',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0159',
'medium',
'What is one solution of x²=81?',
'10',
'0',
'9',
'81',
'C',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0160',
'medium',
'What is one solution of x²=100?',
'0',
'10',
'100',
'11',
'B',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0161',
'medium',
'What is one solution of x²=1?',
'1',
'2',
'0',
'1 (1)',
'A',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0162',
'medium',
'What is one solution of x²=4?',
'4',
'3',
'0',
'2',
'D',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0163',
'medium',
'What is one solution of x²=9?',
'4',
'0',
'3',
'9',
'C',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0164',
'medium',
'What is one solution of x²=16?',
'0',
'4',
'16',
'5',
'B',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0165',
'medium',
'What is one solution of x²=25?',
'5',
'25',
'6',
'0',
'A',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0166',
'medium',
'What is one solution of x²=36?',
'36',
'7',
'0',
'6',
'D',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0167',
'medium',
'What is one solution of x²=49?',
'8',
'0',
'7',
'49',
'C',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0168',
'medium',
'What is one solution of x²=64?',
'0',
'8',
'64',
'9',
'B',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0169',
'medium',
'What is one solution of x²=81?',
'9',
'81',
'10',
'0',
'A',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0170',
'medium',
'What is one solution of x²=100?',
'100',
'11',
'0',
'10',
'D',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0171',
'medium',
'What is one solution of x²=1?',
'0',
'1 (1)',
'1',
'2',
'C',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0172',
'medium',
'What is one solution of x²=4?',
'0',
'2',
'4',
'3',
'B',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0173',
'medium',
'What is one solution of x²=9?',
'3',
'9',
'4',
'0',
'A',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0174',
'medium',
'What is one solution of x²=16?',
'16',
'5',
'0',
'4',
'D',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0175',
'medium',
'What is one solution of x²=25?',
'6',
'0',
'5',
'25',
'C',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0176',
'medium',
'What is one solution of x²=36?',
'0',
'6',
'36',
'7',
'B',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0177',
'medium',
'What is one solution of x²=49?',
'7',
'49',
'8',
'0',
'A',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0178',
'medium',
'What is one solution of x²=64?',
'64',
'9',
'0',
'8',
'D',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0179',
'medium',
'What is one solution of x²=81?',
'10',
'0',
'9',
'81',
'C',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0180',
'medium',
'What is one solution of x²=100?',
'0',
'10',
'100',
'11',
'B',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0181',
'medium',
'What is one solution of x²=1?',
'1',
'2',
'0',
'1 (1)',
'A',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0182',
'medium',
'What is one solution of x²=4?',
'4',
'3',
'0',
'2',
'D',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0183',
'medium',
'What is one solution of x²=9?',
'4',
'0',
'3',
'9',
'C',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0184',
'medium',
'What is one solution of x²=16?',
'0',
'4',
'16',
'5',
'B',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0185',
'medium',
'What is one solution of x²=25?',
'5',
'25',
'6',
'0',
'A',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0186',
'medium',
'What is one solution of x²=36?',
'36',
'7',
'0',
'6',
'D',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0187',
'medium',
'What is one solution of x²=49?',
'8',
'0',
'7',
'49',
'C',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0188',
'medium',
'What is one solution of x²=64?',
'0',
'8',
'64',
'9',
'B',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0189',
'medium',
'What is one solution of x²=81?',
'9',
'81',
'10',
'0',
'A',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0190',
'medium',
'What is one solution of x²=100?',
'100',
'11',
'0',
'10',
'D',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0191',
'medium',
'What is one solution of x²=1?',
'0',
'1 (1)',
'1',
'2',
'C',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0192',
'medium',
'What is one solution of x²=4?',
'0',
'2',
'4',
'3',
'B',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0193',
'medium',
'What is one solution of x²=9?',
'3',
'9',
'4',
'0',
'A',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0194',
'medium',
'What is one solution of x²=16?',
'16',
'5',
'0',
'4',
'D',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0195',
'medium',
'What is one solution of x²=25?',
'6',
'0',
'5',
'25',
'C',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0196',
'medium',
'What is one solution of x²=36?',
'0',
'6',
'36',
'7',
'B',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0197',
'medium',
'What is one solution of x²=49?',
'7',
'49',
'8',
'0',
'A',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0198',
'medium',
'What is one solution of x²=64?',
'64',
'9',
'0',
'8',
'D',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0199',
'medium',
'What is one solution of x²=81?',
'10',
'0',
'9',
'81',
'C',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0200',
'medium',
'What is one solution of x²=100?',
'0',
'10',
'100',
'11',
'B',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0201',
'challenge',
'What is one solution of x²=1?',
'1',
'2',
'0',
'1 (1)',
'A',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0202',
'challenge',
'What is one solution of x²=4?',
'4',
'3',
'0',
'2',
'D',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0203',
'challenge',
'What is one solution of x²=9?',
'4',
'0',
'3',
'9',
'C',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0204',
'challenge',
'What is one solution of x²=16?',
'0',
'4',
'16',
'5',
'B',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0205',
'challenge',
'What is one solution of x²=25?',
'5',
'25',
'6',
'0',
'A',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0206',
'challenge',
'What is one solution of x²=36?',
'36',
'7',
'0',
'6',
'D',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0207',
'challenge',
'What is one solution of x²=49?',
'8',
'0',
'7',
'49',
'C',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0208',
'challenge',
'What is one solution of x²=64?',
'0',
'8',
'64',
'9',
'B',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0209',
'challenge',
'What is one solution of x²=81?',
'9',
'81',
'10',
'0',
'A',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0210',
'challenge',
'What is one solution of x²=100?',
'100',
'11',
'0',
'10',
'D',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0211',
'challenge',
'What is one solution of x²=1?',
'0',
'1 (1)',
'1',
'2',
'C',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0212',
'challenge',
'What is one solution of x²=4?',
'0',
'2',
'4',
'3',
'B',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0213',
'challenge',
'What is one solution of x²=9?',
'3',
'9',
'4',
'0',
'A',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0214',
'challenge',
'What is one solution of x²=16?',
'16',
'5',
'0',
'4',
'D',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0215',
'challenge',
'What is one solution of x²=25?',
'6',
'0',
'5',
'25',
'C',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0216',
'challenge',
'What is one solution of x²=36?',
'0',
'6',
'36',
'7',
'B',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0217',
'challenge',
'What is one solution of x²=49?',
'7',
'49',
'8',
'0',
'A',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0218',
'challenge',
'What is one solution of x²=64?',
'64',
'9',
'0',
'8',
'D',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0219',
'challenge',
'What is one solution of x²=81?',
'10',
'0',
'9',
'81',
'C',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0220',
'challenge',
'What is one solution of x²=100?',
'0',
'10',
'100',
'11',
'B',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0221',
'challenge',
'What is one solution of x²=1?',
'1',
'2',
'0',
'1 (1)',
'A',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0222',
'challenge',
'What is one solution of x²=4?',
'4',
'3',
'0',
'2',
'D',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0223',
'challenge',
'What is one solution of x²=9?',
'4',
'0',
'3',
'9',
'C',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0224',
'challenge',
'What is one solution of x²=16?',
'0',
'4',
'16',
'5',
'B',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0225',
'challenge',
'What is one solution of x²=25?',
'5',
'25',
'6',
'0',
'A',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0226',
'challenge',
'What is one solution of x²=36?',
'36',
'7',
'0',
'6',
'D',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0227',
'challenge',
'What is one solution of x²=49?',
'8',
'0',
'7',
'49',
'C',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0228',
'challenge',
'What is one solution of x²=64?',
'0',
'8',
'64',
'9',
'B',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0229',
'challenge',
'What is one solution of x²=81?',
'9',
'81',
'10',
'0',
'A',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0230',
'challenge',
'What is one solution of x²=100?',
'100',
'11',
'0',
'10',
'D',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0231',
'challenge',
'What is one solution of x²=1?',
'0',
'1 (1)',
'1',
'2',
'C',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0232',
'challenge',
'What is one solution of x²=4?',
'0',
'2',
'4',
'3',
'B',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0233',
'challenge',
'What is one solution of x²=9?',
'3',
'9',
'4',
'0',
'A',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0234',
'challenge',
'What is one solution of x²=16?',
'16',
'5',
'0',
'4',
'D',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0235',
'challenge',
'What is one solution of x²=25?',
'6',
'0',
'5',
'25',
'C',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0236',
'challenge',
'What is one solution of x²=36?',
'0',
'6',
'36',
'7',
'B',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0237',
'challenge',
'What is one solution of x²=49?',
'7',
'49',
'8',
'0',
'A',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0238',
'challenge',
'What is one solution of x²=64?',
'64',
'9',
'0',
'8',
'D',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0239',
'challenge',
'What is one solution of x²=81?',
'10',
'0',
'9',
'81',
'C',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0240',
'challenge',
'What is one solution of x²=100?',
'0',
'10',
'100',
'11',
'B',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0241',
'challenge',
'What is one solution of x²=1?',
'1',
'2',
'0',
'1 (1)',
'A',
'x=±1; 1 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0242',
'challenge',
'What is one solution of x²=4?',
'4',
'3',
'0',
'2',
'D',
'x=±2; 2 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0243',
'challenge',
'What is one solution of x²=9?',
'4',
'0',
'3',
'9',
'C',
'x=±3; 3 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0244',
'challenge',
'What is one solution of x²=16?',
'0',
'4',
'16',
'5',
'B',
'x=±4; 4 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0245',
'challenge',
'What is one solution of x²=25?',
'5',
'25',
'6',
'0',
'A',
'x=±5; 5 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0246',
'challenge',
'What is one solution of x²=36?',
'36',
'7',
'0',
'6',
'D',
'x=±6; 6 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0247',
'challenge',
'What is one solution of x²=49?',
'8',
'0',
'7',
'49',
'C',
'x=±7; 7 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0248',
'challenge',
'What is one solution of x²=64?',
'0',
'8',
'64',
'9',
'B',
'x=±8; 8 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0249',
'challenge',
'What is one solution of x²=81?',
'9',
'81',
'10',
'0',
'A',
'x=±9; 9 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_ADVANCED_0250',
'challenge',
'What is one solution of x²=100?',
'100',
'11',
'0',
'10',
'D',
'x=±10; 10 is one solution.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='ADVANCED';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0001',
'easy',
'A rectangle is 2 by 2. What is its area?',
'4',
'8',
'5',
'4 (1)',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0002',
'easy',
'A rectangle is 3 by 4. What is its area?',
'14',
'7',
'13',
'12',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0003',
'easy',
'A rectangle is 4 by 6. What is its area?',
'10',
'25',
'24',
'20',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0004',
'easy',
'A rectangle is 5 by 8. What is its area?',
'41',
'40',
'26',
'13',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0005',
'easy',
'A rectangle is 6 by 10. What is its area?',
'60',
'32',
'16',
'61',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0006',
'easy',
'A rectangle is 7 by 12. What is its area?',
'38',
'19',
'85',
'84',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0007',
'easy',
'A rectangle is 8 by 2. What is its area?',
'10',
'17',
'16',
'20',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0008',
'easy',
'A rectangle is 9 by 4. What is its area?',
'37',
'36',
'26',
'13',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0009',
'easy',
'A rectangle is 10 by 6. What is its area?',
'60',
'32',
'16',
'61',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0010',
'easy',
'A rectangle is 11 by 8. What is its area?',
'38',
'19',
'89',
'88',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0011',
'easy',
'A rectangle is 12 by 10. What is its area?',
'22',
'121',
'120',
'44',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0012',
'easy',
'A rectangle is 13 by 12. What is its area?',
'157',
'156',
'50',
'25',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0013',
'easy',
'A rectangle is 14 by 2. What is its area?',
'28',
'32',
'16',
'29',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0014',
'easy',
'A rectangle is 15 by 4. What is its area?',
'38',
'19',
'61',
'60',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0015',
'easy',
'A rectangle is 16 by 6. What is its area?',
'22',
'97',
'96',
'44',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0016',
'easy',
'A rectangle is 2 by 8. What is its area?',
'17',
'16',
'20',
'10',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0017',
'easy',
'A rectangle is 3 by 10. What is its area?',
'30',
'26',
'13',
'31',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0018',
'easy',
'A rectangle is 4 by 12. What is its area?',
'32',
'16',
'49',
'48',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0019',
'easy',
'A rectangle is 5 by 2. What is its area?',
'7',
'11',
'10',
'14',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0020',
'easy',
'A rectangle is 6 by 4. What is its area?',
'25',
'24',
'20',
'10',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0021',
'easy',
'A rectangle is 7 by 6. What is its area?',
'42',
'26',
'13',
'43',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0022',
'easy',
'A rectangle is 8 by 8. What is its area?',
'32',
'16',
'65',
'64',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0023',
'easy',
'A rectangle is 9 by 10. What is its area?',
'19',
'91',
'90',
'38',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0024',
'easy',
'A rectangle is 10 by 12. What is its area?',
'121',
'120',
'44',
'22',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0025',
'easy',
'A rectangle is 11 by 2. What is its area?',
'22',
'26',
'13',
'23',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0026',
'easy',
'A rectangle is 12 by 4. What is its area?',
'32',
'16',
'49',
'48',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0027',
'easy',
'A rectangle is 13 by 6. What is its area?',
'19',
'79',
'78',
'38',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0028',
'easy',
'A rectangle is 14 by 8. What is its area?',
'113',
'112',
'44',
'22',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0029',
'easy',
'A rectangle is 15 by 10. What is its area?',
'150',
'50',
'25',
'151',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0030',
'easy',
'A rectangle is 16 by 12. What is its area?',
'56',
'28',
'193',
'192',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0031',
'easy',
'A rectangle is 2 by 2. What is its area?',
'5',
'4 (1)',
'4',
'8',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0032',
'easy',
'A rectangle is 3 by 4. What is its area?',
'13',
'12',
'14',
'7',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0033',
'easy',
'A rectangle is 4 by 6. What is its area?',
'24',
'20',
'10',
'25',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0034',
'easy',
'A rectangle is 5 by 8. What is its area?',
'26',
'13',
'41',
'40',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0035',
'easy',
'A rectangle is 6 by 10. What is its area?',
'16',
'61',
'60',
'32',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0036',
'easy',
'A rectangle is 7 by 12. What is its area?',
'85',
'84',
'38',
'19',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0037',
'easy',
'A rectangle is 8 by 2. What is its area?',
'16',
'20',
'10',
'17',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0038',
'easy',
'A rectangle is 9 by 4. What is its area?',
'26',
'13',
'37',
'36',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0039',
'easy',
'A rectangle is 10 by 6. What is its area?',
'16',
'61',
'60',
'32',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0040',
'easy',
'A rectangle is 11 by 8. What is its area?',
'89',
'88',
'38',
'19',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0041',
'easy',
'A rectangle is 12 by 10. What is its area?',
'120',
'44',
'22',
'121',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0042',
'easy',
'A rectangle is 13 by 12. What is its area?',
'50',
'25',
'157',
'156',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0043',
'easy',
'A rectangle is 14 by 2. What is its area?',
'16',
'29',
'28',
'32',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0044',
'easy',
'A rectangle is 15 by 4. What is its area?',
'61',
'60',
'38',
'19',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0045',
'easy',
'A rectangle is 16 by 6. What is its area?',
'96',
'44',
'22',
'97',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0046',
'easy',
'A rectangle is 2 by 8. What is its area?',
'20',
'10',
'17',
'16',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0047',
'easy',
'A rectangle is 3 by 10. What is its area?',
'13',
'31',
'30',
'26',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0048',
'easy',
'A rectangle is 4 by 12. What is its area?',
'49',
'48',
'32',
'16',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0049',
'easy',
'A rectangle is 5 by 2. What is its area?',
'10',
'14',
'7',
'11',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0050',
'easy',
'A rectangle is 6 by 4. What is its area?',
'20',
'10',
'25',
'24',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0051',
'easy',
'A rectangle is 7 by 6. What is its area?',
'13',
'43',
'42',
'26',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0052',
'easy',
'A rectangle is 8 by 8. What is its area?',
'65',
'64',
'32',
'16',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0053',
'easy',
'A rectangle is 9 by 10. What is its area?',
'90',
'38',
'19',
'91',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0054',
'easy',
'A rectangle is 10 by 12. What is its area?',
'44',
'22',
'121',
'120',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0055',
'easy',
'A rectangle is 11 by 2. What is its area?',
'13',
'23',
'22',
'26',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0056',
'easy',
'A rectangle is 12 by 4. What is its area?',
'49',
'48',
'32',
'16',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0057',
'easy',
'A rectangle is 13 by 6. What is its area?',
'78',
'38',
'19',
'79',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0058',
'easy',
'A rectangle is 14 by 8. What is its area?',
'44',
'22',
'113',
'112',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0059',
'easy',
'A rectangle is 15 by 10. What is its area?',
'25',
'151',
'150',
'50',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0060',
'easy',
'A rectangle is 16 by 12. What is its area?',
'193',
'192',
'56',
'28',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0061',
'easy',
'A rectangle is 2 by 2. What is its area?',
'4',
'8',
'5',
'4 (1)',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0062',
'easy',
'A rectangle is 3 by 4. What is its area?',
'14',
'7',
'13',
'12',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0063',
'easy',
'A rectangle is 4 by 6. What is its area?',
'10',
'25',
'24',
'20',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0064',
'easy',
'A rectangle is 5 by 8. What is its area?',
'41',
'40',
'26',
'13',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0065',
'easy',
'A rectangle is 6 by 10. What is its area?',
'60',
'32',
'16',
'61',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0066',
'easy',
'A rectangle is 7 by 12. What is its area?',
'38',
'19',
'85',
'84',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0067',
'easy',
'A rectangle is 8 by 2. What is its area?',
'10',
'17',
'16',
'20',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0068',
'easy',
'A rectangle is 9 by 4. What is its area?',
'37',
'36',
'26',
'13',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0069',
'easy',
'A rectangle is 10 by 6. What is its area?',
'60',
'32',
'16',
'61',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0070',
'easy',
'A rectangle is 11 by 8. What is its area?',
'38',
'19',
'89',
'88',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0071',
'easy',
'A rectangle is 12 by 10. What is its area?',
'22',
'121',
'120',
'44',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0072',
'easy',
'A rectangle is 13 by 12. What is its area?',
'157',
'156',
'50',
'25',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0073',
'easy',
'A rectangle is 14 by 2. What is its area?',
'28',
'32',
'16',
'29',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0074',
'easy',
'A rectangle is 15 by 4. What is its area?',
'38',
'19',
'61',
'60',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0075',
'easy',
'A rectangle is 16 by 6. What is its area?',
'22',
'97',
'96',
'44',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0076',
'easy',
'A rectangle is 2 by 8. What is its area?',
'17',
'16',
'20',
'10',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0077',
'easy',
'A rectangle is 3 by 10. What is its area?',
'30',
'26',
'13',
'31',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0078',
'easy',
'A rectangle is 4 by 12. What is its area?',
'32',
'16',
'49',
'48',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0079',
'easy',
'A rectangle is 5 by 2. What is its area?',
'7',
'11',
'10',
'14',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0080',
'easy',
'A rectangle is 6 by 4. What is its area?',
'25',
'24',
'20',
'10',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0081',
'easy',
'A rectangle is 7 by 6. What is its area?',
'42',
'26',
'13',
'43',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0082',
'easy',
'A rectangle is 8 by 8. What is its area?',
'32',
'16',
'65',
'64',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0083',
'easy',
'A rectangle is 9 by 10. What is its area?',
'19',
'91',
'90',
'38',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0084',
'easy',
'A rectangle is 10 by 12. What is its area?',
'121',
'120',
'44',
'22',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0085',
'easy',
'A rectangle is 11 by 2. What is its area?',
'22',
'26',
'13',
'23',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0086',
'easy',
'A rectangle is 12 by 4. What is its area?',
'32',
'16',
'49',
'48',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0087',
'easy',
'A rectangle is 13 by 6. What is its area?',
'19',
'79',
'78',
'38',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0088',
'easy',
'A rectangle is 14 by 8. What is its area?',
'113',
'112',
'44',
'22',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0089',
'medium',
'A rectangle is 15 by 10. What is its area?',
'150',
'50',
'25',
'151',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0090',
'medium',
'A rectangle is 16 by 12. What is its area?',
'56',
'28',
'193',
'192',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0091',
'medium',
'A rectangle is 2 by 2. What is its area?',
'5',
'4 (1)',
'4',
'8',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0092',
'medium',
'A rectangle is 3 by 4. What is its area?',
'13',
'12',
'14',
'7',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0093',
'medium',
'A rectangle is 4 by 6. What is its area?',
'24',
'20',
'10',
'25',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0094',
'medium',
'A rectangle is 5 by 8. What is its area?',
'26',
'13',
'41',
'40',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0095',
'medium',
'A rectangle is 6 by 10. What is its area?',
'16',
'61',
'60',
'32',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0096',
'medium',
'A rectangle is 7 by 12. What is its area?',
'85',
'84',
'38',
'19',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0097',
'medium',
'A rectangle is 8 by 2. What is its area?',
'16',
'20',
'10',
'17',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0098',
'medium',
'A rectangle is 9 by 4. What is its area?',
'26',
'13',
'37',
'36',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0099',
'medium',
'A rectangle is 10 by 6. What is its area?',
'16',
'61',
'60',
'32',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0100',
'medium',
'A rectangle is 11 by 8. What is its area?',
'89',
'88',
'38',
'19',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0101',
'medium',
'A rectangle is 12 by 10. What is its area?',
'120',
'44',
'22',
'121',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0102',
'medium',
'A rectangle is 13 by 12. What is its area?',
'50',
'25',
'157',
'156',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0103',
'medium',
'A rectangle is 14 by 2. What is its area?',
'16',
'29',
'28',
'32',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0104',
'medium',
'A rectangle is 15 by 4. What is its area?',
'61',
'60',
'38',
'19',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0105',
'medium',
'A rectangle is 16 by 6. What is its area?',
'96',
'44',
'22',
'97',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0106',
'medium',
'A rectangle is 2 by 8. What is its area?',
'20',
'10',
'17',
'16',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0107',
'medium',
'A rectangle is 3 by 10. What is its area?',
'13',
'31',
'30',
'26',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0108',
'medium',
'A rectangle is 4 by 12. What is its area?',
'49',
'48',
'32',
'16',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0109',
'medium',
'A rectangle is 5 by 2. What is its area?',
'10',
'14',
'7',
'11',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0110',
'medium',
'A rectangle is 6 by 4. What is its area?',
'20',
'10',
'25',
'24',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0111',
'medium',
'A rectangle is 7 by 6. What is its area?',
'13',
'43',
'42',
'26',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0112',
'medium',
'A rectangle is 8 by 8. What is its area?',
'65',
'64',
'32',
'16',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0113',
'medium',
'A rectangle is 9 by 10. What is its area?',
'90',
'38',
'19',
'91',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0114',
'medium',
'A rectangle is 10 by 12. What is its area?',
'44',
'22',
'121',
'120',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0115',
'medium',
'A rectangle is 11 by 2. What is its area?',
'13',
'23',
'22',
'26',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0116',
'medium',
'A rectangle is 12 by 4. What is its area?',
'49',
'48',
'32',
'16',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0117',
'medium',
'A rectangle is 13 by 6. What is its area?',
'78',
'38',
'19',
'79',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0118',
'medium',
'A rectangle is 14 by 8. What is its area?',
'44',
'22',
'113',
'112',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0119',
'medium',
'A rectangle is 15 by 10. What is its area?',
'25',
'151',
'150',
'50',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0120',
'medium',
'A rectangle is 16 by 12. What is its area?',
'193',
'192',
'56',
'28',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0121',
'medium',
'A rectangle is 2 by 2. What is its area?',
'4',
'8',
'5',
'4 (1)',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0122',
'medium',
'A rectangle is 3 by 4. What is its area?',
'14',
'7',
'13',
'12',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0123',
'medium',
'A rectangle is 4 by 6. What is its area?',
'10',
'25',
'24',
'20',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0124',
'medium',
'A rectangle is 5 by 8. What is its area?',
'41',
'40',
'26',
'13',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0125',
'medium',
'A rectangle is 6 by 10. What is its area?',
'60',
'32',
'16',
'61',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0126',
'medium',
'A rectangle is 7 by 12. What is its area?',
'38',
'19',
'85',
'84',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0127',
'medium',
'A rectangle is 8 by 2. What is its area?',
'10',
'17',
'16',
'20',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0128',
'medium',
'A rectangle is 9 by 4. What is its area?',
'37',
'36',
'26',
'13',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0129',
'medium',
'A rectangle is 10 by 6. What is its area?',
'60',
'32',
'16',
'61',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0130',
'medium',
'A rectangle is 11 by 8. What is its area?',
'38',
'19',
'89',
'88',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0131',
'medium',
'A rectangle is 12 by 10. What is its area?',
'22',
'121',
'120',
'44',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0132',
'medium',
'A rectangle is 13 by 12. What is its area?',
'157',
'156',
'50',
'25',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0133',
'medium',
'A rectangle is 14 by 2. What is its area?',
'28',
'32',
'16',
'29',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0134',
'medium',
'A rectangle is 15 by 4. What is its area?',
'38',
'19',
'61',
'60',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0135',
'medium',
'A rectangle is 16 by 6. What is its area?',
'22',
'97',
'96',
'44',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0136',
'medium',
'A rectangle is 2 by 8. What is its area?',
'17',
'16',
'20',
'10',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0137',
'medium',
'A rectangle is 3 by 10. What is its area?',
'30',
'26',
'13',
'31',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0138',
'medium',
'A rectangle is 4 by 12. What is its area?',
'32',
'16',
'49',
'48',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0139',
'medium',
'A rectangle is 5 by 2. What is its area?',
'7',
'11',
'10',
'14',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0140',
'medium',
'A rectangle is 6 by 4. What is its area?',
'25',
'24',
'20',
'10',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0141',
'medium',
'A rectangle is 7 by 6. What is its area?',
'42',
'26',
'13',
'43',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0142',
'medium',
'A rectangle is 8 by 8. What is its area?',
'32',
'16',
'65',
'64',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0143',
'medium',
'A rectangle is 9 by 10. What is its area?',
'19',
'91',
'90',
'38',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0144',
'medium',
'A rectangle is 10 by 12. What is its area?',
'121',
'120',
'44',
'22',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0145',
'medium',
'A rectangle is 11 by 2. What is its area?',
'22',
'26',
'13',
'23',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0146',
'medium',
'A rectangle is 12 by 4. What is its area?',
'32',
'16',
'49',
'48',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0147',
'medium',
'A rectangle is 13 by 6. What is its area?',
'19',
'79',
'78',
'38',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0148',
'medium',
'A rectangle is 14 by 8. What is its area?',
'113',
'112',
'44',
'22',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0149',
'medium',
'A rectangle is 15 by 10. What is its area?',
'150',
'50',
'25',
'151',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0150',
'medium',
'A rectangle is 16 by 12. What is its area?',
'56',
'28',
'193',
'192',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0151',
'medium',
'A rectangle is 2 by 2. What is its area?',
'5',
'4 (1)',
'4',
'8',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0152',
'medium',
'A rectangle is 3 by 4. What is its area?',
'13',
'12',
'14',
'7',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0153',
'medium',
'A rectangle is 4 by 6. What is its area?',
'24',
'20',
'10',
'25',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0154',
'medium',
'A rectangle is 5 by 8. What is its area?',
'26',
'13',
'41',
'40',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0155',
'medium',
'A rectangle is 6 by 10. What is its area?',
'16',
'61',
'60',
'32',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0156',
'medium',
'A rectangle is 7 by 12. What is its area?',
'85',
'84',
'38',
'19',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0157',
'medium',
'A rectangle is 8 by 2. What is its area?',
'16',
'20',
'10',
'17',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0158',
'medium',
'A rectangle is 9 by 4. What is its area?',
'26',
'13',
'37',
'36',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0159',
'medium',
'A rectangle is 10 by 6. What is its area?',
'16',
'61',
'60',
'32',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0160',
'medium',
'A rectangle is 11 by 8. What is its area?',
'89',
'88',
'38',
'19',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0161',
'medium',
'A rectangle is 12 by 10. What is its area?',
'120',
'44',
'22',
'121',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0162',
'medium',
'A rectangle is 13 by 12. What is its area?',
'50',
'25',
'157',
'156',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0163',
'medium',
'A rectangle is 14 by 2. What is its area?',
'16',
'29',
'28',
'32',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0164',
'medium',
'A rectangle is 15 by 4. What is its area?',
'61',
'60',
'38',
'19',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0165',
'medium',
'A rectangle is 16 by 6. What is its area?',
'96',
'44',
'22',
'97',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0166',
'medium',
'A rectangle is 2 by 8. What is its area?',
'20',
'10',
'17',
'16',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0167',
'medium',
'A rectangle is 3 by 10. What is its area?',
'13',
'31',
'30',
'26',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0168',
'medium',
'A rectangle is 4 by 12. What is its area?',
'49',
'48',
'32',
'16',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0169',
'medium',
'A rectangle is 5 by 2. What is its area?',
'10',
'14',
'7',
'11',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0170',
'medium',
'A rectangle is 6 by 4. What is its area?',
'20',
'10',
'25',
'24',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0171',
'medium',
'A rectangle is 7 by 6. What is its area?',
'13',
'43',
'42',
'26',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0172',
'medium',
'A rectangle is 8 by 8. What is its area?',
'65',
'64',
'32',
'16',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0173',
'medium',
'A rectangle is 9 by 10. What is its area?',
'90',
'38',
'19',
'91',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0174',
'medium',
'A rectangle is 10 by 12. What is its area?',
'44',
'22',
'121',
'120',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0175',
'medium',
'A rectangle is 11 by 2. What is its area?',
'13',
'23',
'22',
'26',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0176',
'medium',
'A rectangle is 12 by 4. What is its area?',
'49',
'48',
'32',
'16',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0177',
'medium',
'A rectangle is 13 by 6. What is its area?',
'78',
'38',
'19',
'79',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0178',
'medium',
'A rectangle is 14 by 8. What is its area?',
'44',
'22',
'113',
'112',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0179',
'medium',
'A rectangle is 15 by 10. What is its area?',
'25',
'151',
'150',
'50',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0180',
'medium',
'A rectangle is 16 by 12. What is its area?',
'193',
'192',
'56',
'28',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0181',
'medium',
'A rectangle is 2 by 2. What is its area?',
'4',
'8',
'5',
'4 (1)',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0182',
'medium',
'A rectangle is 3 by 4. What is its area?',
'14',
'7',
'13',
'12',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0183',
'medium',
'A rectangle is 4 by 6. What is its area?',
'10',
'25',
'24',
'20',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0184',
'medium',
'A rectangle is 5 by 8. What is its area?',
'41',
'40',
'26',
'13',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0185',
'medium',
'A rectangle is 6 by 10. What is its area?',
'60',
'32',
'16',
'61',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0186',
'medium',
'A rectangle is 7 by 12. What is its area?',
'38',
'19',
'85',
'84',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0187',
'medium',
'A rectangle is 8 by 2. What is its area?',
'10',
'17',
'16',
'20',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0188',
'medium',
'A rectangle is 9 by 4. What is its area?',
'37',
'36',
'26',
'13',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0189',
'medium',
'A rectangle is 10 by 6. What is its area?',
'60',
'32',
'16',
'61',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0190',
'medium',
'A rectangle is 11 by 8. What is its area?',
'38',
'19',
'89',
'88',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0191',
'medium',
'A rectangle is 12 by 10. What is its area?',
'22',
'121',
'120',
'44',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0192',
'medium',
'A rectangle is 13 by 12. What is its area?',
'157',
'156',
'50',
'25',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0193',
'medium',
'A rectangle is 14 by 2. What is its area?',
'28',
'32',
'16',
'29',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0194',
'medium',
'A rectangle is 15 by 4. What is its area?',
'38',
'19',
'61',
'60',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0195',
'medium',
'A rectangle is 16 by 6. What is its area?',
'22',
'97',
'96',
'44',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0196',
'medium',
'A rectangle is 2 by 8. What is its area?',
'17',
'16',
'20',
'10',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0197',
'medium',
'A rectangle is 3 by 10. What is its area?',
'30',
'26',
'13',
'31',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0198',
'medium',
'A rectangle is 4 by 12. What is its area?',
'32',
'16',
'49',
'48',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0199',
'medium',
'A rectangle is 5 by 2. What is its area?',
'7',
'11',
'10',
'14',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0200',
'medium',
'A rectangle is 6 by 4. What is its area?',
'25',
'24',
'20',
'10',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0201',
'challenge',
'A rectangle is 7 by 6. What is its area?',
'42',
'26',
'13',
'43',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0202',
'challenge',
'A rectangle is 8 by 8. What is its area?',
'32',
'16',
'65',
'64',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0203',
'challenge',
'A rectangle is 9 by 10. What is its area?',
'19',
'91',
'90',
'38',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0204',
'challenge',
'A rectangle is 10 by 12. What is its area?',
'121',
'120',
'44',
'22',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0205',
'challenge',
'A rectangle is 11 by 2. What is its area?',
'22',
'26',
'13',
'23',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0206',
'challenge',
'A rectangle is 12 by 4. What is its area?',
'32',
'16',
'49',
'48',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0207',
'challenge',
'A rectangle is 13 by 6. What is its area?',
'19',
'79',
'78',
'38',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0208',
'challenge',
'A rectangle is 14 by 8. What is its area?',
'113',
'112',
'44',
'22',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0209',
'challenge',
'A rectangle is 15 by 10. What is its area?',
'150',
'50',
'25',
'151',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0210',
'challenge',
'A rectangle is 16 by 12. What is its area?',
'56',
'28',
'193',
'192',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0211',
'challenge',
'A rectangle is 2 by 2. What is its area?',
'5',
'4 (1)',
'4',
'8',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0212',
'challenge',
'A rectangle is 3 by 4. What is its area?',
'13',
'12',
'14',
'7',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0213',
'challenge',
'A rectangle is 4 by 6. What is its area?',
'24',
'20',
'10',
'25',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0214',
'challenge',
'A rectangle is 5 by 8. What is its area?',
'26',
'13',
'41',
'40',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0215',
'challenge',
'A rectangle is 6 by 10. What is its area?',
'16',
'61',
'60',
'32',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0216',
'challenge',
'A rectangle is 7 by 12. What is its area?',
'85',
'84',
'38',
'19',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0217',
'challenge',
'A rectangle is 8 by 2. What is its area?',
'16',
'20',
'10',
'17',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0218',
'challenge',
'A rectangle is 9 by 4. What is its area?',
'26',
'13',
'37',
'36',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0219',
'challenge',
'A rectangle is 10 by 6. What is its area?',
'16',
'61',
'60',
'32',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0220',
'challenge',
'A rectangle is 11 by 8. What is its area?',
'89',
'88',
'38',
'19',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0221',
'challenge',
'A rectangle is 12 by 10. What is its area?',
'120',
'44',
'22',
'121',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0222',
'challenge',
'A rectangle is 13 by 12. What is its area?',
'50',
'25',
'157',
'156',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0223',
'challenge',
'A rectangle is 14 by 2. What is its area?',
'16',
'29',
'28',
'32',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0224',
'challenge',
'A rectangle is 15 by 4. What is its area?',
'61',
'60',
'38',
'19',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0225',
'challenge',
'A rectangle is 16 by 6. What is its area?',
'96',
'44',
'22',
'97',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0226',
'challenge',
'A rectangle is 2 by 8. What is its area?',
'20',
'10',
'17',
'16',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0227',
'challenge',
'A rectangle is 3 by 10. What is its area?',
'13',
'31',
'30',
'26',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0228',
'challenge',
'A rectangle is 4 by 12. What is its area?',
'49',
'48',
'32',
'16',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0229',
'challenge',
'A rectangle is 5 by 2. What is its area?',
'10',
'14',
'7',
'11',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0230',
'challenge',
'A rectangle is 6 by 4. What is its area?',
'20',
'10',
'25',
'24',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0231',
'challenge',
'A rectangle is 7 by 6. What is its area?',
'13',
'43',
'42',
'26',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0232',
'challenge',
'A rectangle is 8 by 8. What is its area?',
'65',
'64',
'32',
'16',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0233',
'challenge',
'A rectangle is 9 by 10. What is its area?',
'90',
'38',
'19',
'91',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0234',
'challenge',
'A rectangle is 10 by 12. What is its area?',
'44',
'22',
'121',
'120',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0235',
'challenge',
'A rectangle is 11 by 2. What is its area?',
'13',
'23',
'22',
'26',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0236',
'challenge',
'A rectangle is 12 by 4. What is its area?',
'49',
'48',
'32',
'16',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0237',
'challenge',
'A rectangle is 13 by 6. What is its area?',
'78',
'38',
'19',
'79',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0238',
'challenge',
'A rectangle is 14 by 8. What is its area?',
'44',
'22',
'113',
'112',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0239',
'challenge',
'A rectangle is 15 by 10. What is its area?',
'25',
'151',
'150',
'50',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0240',
'challenge',
'A rectangle is 16 by 12. What is its area?',
'193',
'192',
'56',
'28',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0241',
'challenge',
'A rectangle is 2 by 2. What is its area?',
'4',
'8',
'5',
'4 (1)',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0242',
'challenge',
'A rectangle is 3 by 4. What is its area?',
'14',
'7',
'13',
'12',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0243',
'challenge',
'A rectangle is 4 by 6. What is its area?',
'10',
'25',
'24',
'20',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0244',
'challenge',
'A rectangle is 5 by 8. What is its area?',
'41',
'40',
'26',
'13',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0245',
'challenge',
'A rectangle is 6 by 10. What is its area?',
'60',
'32',
'16',
'61',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0246',
'challenge',
'A rectangle is 7 by 12. What is its area?',
'38',
'19',
'85',
'84',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0247',
'challenge',
'A rectangle is 8 by 2. What is its area?',
'10',
'17',
'16',
'20',
'C',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0248',
'challenge',
'A rectangle is 9 by 4. What is its area?',
'37',
'36',
'26',
'13',
'B',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0249',
'challenge',
'A rectangle is 10 by 6. What is its area?',
'60',
'32',
'16',
'61',
'A',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_GEOMETRY_0250',
'challenge',
'A rectangle is 11 by 8. What is its area?',
'38',
'19',
'89',
'88',
'D',
'Area = length × width.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='GEOMETRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0001',
'easy',
'A bag has 1 red and 2 blue marbles. What is P(red)?',
'1/3',
'2/3',
'1/2',
'3/1',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0002',
'easy',
'A bag has 2 red and 4 blue marbles. What is P(red)?',
'4/6',
'2/4',
'6/2',
'2/6',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0003',
'easy',
'A bag has 3 red and 6 blue marbles. What is P(red)?',
'3/6',
'9/3',
'3/9',
'6/9',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0004',
'easy',
'A bag has 4 red and 2 blue marbles. What is P(red)?',
'6/4',
'4/6',
'2/6',
'4/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0005',
'easy',
'A bag has 5 red and 4 blue marbles. What is P(red)?',
'5/9',
'4/9',
'5/4',
'9/5',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0006',
'easy',
'A bag has 1 red and 6 blue marbles. What is P(red)?',
'6/7',
'1/6',
'7/1',
'1/7',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0007',
'easy',
'A bag has 2 red and 2 blue marbles. What is P(red)?',
'4/2',
'2/4 (1)',
'2/4',
'2/2',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0008',
'easy',
'A bag has 3 red and 4 blue marbles. What is P(red)?',
'7/3',
'3/7',
'4/7',
'3/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0009',
'easy',
'A bag has 4 red and 6 blue marbles. What is P(red)?',
'4/10',
'6/10',
'4/6',
'10/4',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0010',
'easy',
'A bag has 5 red and 2 blue marbles. What is P(red)?',
'2/7',
'5/2',
'7/5',
'5/7',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0011',
'easy',
'A bag has 1 red and 4 blue marbles. What is P(red)?',
'1/4',
'5/1',
'1/5',
'4/5',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0012',
'easy',
'A bag has 2 red and 6 blue marbles. What is P(red)?',
'8/2',
'2/8',
'6/8',
'2/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0013',
'easy',
'A bag has 3 red and 2 blue marbles. What is P(red)?',
'3/5',
'2/5',
'3/2',
'5/3',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0014',
'easy',
'A bag has 4 red and 4 blue marbles. What is P(red)?',
'4/4',
'8/4',
'4/8 (1)',
'4/8',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0015',
'easy',
'A bag has 5 red and 6 blue marbles. What is P(red)?',
'5/6',
'11/5',
'5/11',
'6/11',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0016',
'easy',
'A bag has 1 red and 2 blue marbles. What is P(red)?',
'3/1',
'1/3',
'2/3',
'1/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0017',
'easy',
'A bag has 2 red and 4 blue marbles. What is P(red)?',
'2/6',
'4/6',
'2/4',
'6/2',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0018',
'easy',
'A bag has 3 red and 6 blue marbles. What is P(red)?',
'6/9',
'3/6',
'9/3',
'3/9',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0019',
'easy',
'A bag has 4 red and 2 blue marbles. What is P(red)?',
'4/2',
'6/4',
'4/6',
'2/6',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0020',
'easy',
'A bag has 5 red and 4 blue marbles. What is P(red)?',
'9/5',
'5/9',
'4/9',
'5/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0021',
'easy',
'A bag has 1 red and 6 blue marbles. What is P(red)?',
'1/7',
'6/7',
'1/6',
'7/1',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0022',
'easy',
'A bag has 2 red and 2 blue marbles. What is P(red)?',
'2/2',
'4/2',
'2/4 (1)',
'2/4',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0023',
'easy',
'A bag has 3 red and 4 blue marbles. What is P(red)?',
'3/4',
'7/3',
'3/7',
'4/7',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0024',
'easy',
'A bag has 4 red and 6 blue marbles. What is P(red)?',
'10/4',
'4/10',
'6/10',
'4/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0025',
'easy',
'A bag has 5 red and 2 blue marbles. What is P(red)?',
'5/7',
'2/7',
'5/2',
'7/5',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0026',
'easy',
'A bag has 1 red and 4 blue marbles. What is P(red)?',
'4/5',
'1/4',
'5/1',
'1/5',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0027',
'easy',
'A bag has 2 red and 6 blue marbles. What is P(red)?',
'2/6',
'8/2',
'2/8',
'6/8',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0028',
'easy',
'A bag has 3 red and 2 blue marbles. What is P(red)?',
'5/3',
'3/5',
'2/5',
'3/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0029',
'easy',
'A bag has 4 red and 4 blue marbles. What is P(red)?',
'4/8',
'4/4',
'8/4',
'4/8 (1)',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0030',
'easy',
'A bag has 5 red and 6 blue marbles. What is P(red)?',
'6/11',
'5/6',
'11/5',
'5/11',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0031',
'easy',
'A bag has 1 red and 2 blue marbles. What is P(red)?',
'1/2',
'3/1',
'1/3',
'2/3',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0032',
'easy',
'A bag has 2 red and 4 blue marbles. What is P(red)?',
'6/2',
'2/6',
'4/6',
'2/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0033',
'easy',
'A bag has 3 red and 6 blue marbles. What is P(red)?',
'3/9',
'6/9',
'3/6',
'9/3',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0034',
'easy',
'A bag has 4 red and 2 blue marbles. What is P(red)?',
'2/6',
'4/2',
'6/4',
'4/6',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0035',
'easy',
'A bag has 5 red and 4 blue marbles. What is P(red)?',
'5/4',
'9/5',
'5/9',
'4/9',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0036',
'easy',
'A bag has 1 red and 6 blue marbles. What is P(red)?',
'7/1',
'1/7',
'6/7',
'1/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0037',
'easy',
'A bag has 2 red and 2 blue marbles. What is P(red)?',
'2/4',
'2/2',
'4/2',
'2/4 (1)',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0038',
'easy',
'A bag has 3 red and 4 blue marbles. What is P(red)?',
'4/7',
'3/4',
'7/3',
'3/7',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0039',
'easy',
'A bag has 4 red and 6 blue marbles. What is P(red)?',
'4/6',
'10/4',
'4/10',
'6/10',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0040',
'easy',
'A bag has 5 red and 2 blue marbles. What is P(red)?',
'7/5',
'5/7',
'2/7',
'5/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0041',
'easy',
'A bag has 1 red and 4 blue marbles. What is P(red)?',
'1/5',
'4/5',
'1/4',
'5/1',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0042',
'easy',
'A bag has 2 red and 6 blue marbles. What is P(red)?',
'6/8',
'2/6',
'8/2',
'2/8',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0043',
'easy',
'A bag has 3 red and 2 blue marbles. What is P(red)?',
'3/2',
'5/3',
'3/5',
'2/5',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0044',
'easy',
'A bag has 4 red and 4 blue marbles. What is P(red)?',
'4/8 (1)',
'4/8',
'4/4',
'8/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0045',
'easy',
'A bag has 5 red and 6 blue marbles. What is P(red)?',
'5/11',
'6/11',
'5/6',
'11/5',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0046',
'easy',
'A bag has 1 red and 2 blue marbles. What is P(red)?',
'2/3',
'1/2',
'3/1',
'1/3',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0047',
'easy',
'A bag has 2 red and 4 blue marbles. What is P(red)?',
'2/4',
'6/2',
'2/6',
'4/6',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0048',
'easy',
'A bag has 3 red and 6 blue marbles. What is P(red)?',
'9/3',
'3/9',
'6/9',
'3/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0049',
'easy',
'A bag has 4 red and 2 blue marbles. What is P(red)?',
'4/6',
'2/6',
'4/2',
'6/4',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0050',
'easy',
'A bag has 5 red and 4 blue marbles. What is P(red)?',
'4/9',
'5/4',
'9/5',
'5/9',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0051',
'easy',
'A bag has 1 red and 6 blue marbles. What is P(red)?',
'1/6',
'7/1',
'1/7',
'6/7',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0052',
'easy',
'A bag has 2 red and 2 blue marbles. What is P(red)?',
'2/4 (1)',
'2/4',
'2/2',
'4/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0053',
'easy',
'A bag has 3 red and 4 blue marbles. What is P(red)?',
'3/7',
'4/7',
'3/4',
'7/3',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0054',
'easy',
'A bag has 4 red and 6 blue marbles. What is P(red)?',
'6/10',
'4/6',
'10/4',
'4/10',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0055',
'easy',
'A bag has 5 red and 2 blue marbles. What is P(red)?',
'5/2',
'7/5',
'5/7',
'2/7',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0056',
'easy',
'A bag has 1 red and 4 blue marbles. What is P(red)?',
'5/1',
'1/5',
'4/5',
'1/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0057',
'easy',
'A bag has 2 red and 6 blue marbles. What is P(red)?',
'2/8',
'6/8',
'2/6',
'8/2',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0058',
'easy',
'A bag has 3 red and 2 blue marbles. What is P(red)?',
'2/5',
'3/2',
'5/3',
'3/5',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0059',
'easy',
'A bag has 4 red and 4 blue marbles. What is P(red)?',
'8/4',
'4/8 (1)',
'4/8',
'4/4',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0060',
'easy',
'A bag has 5 red and 6 blue marbles. What is P(red)?',
'11/5',
'5/11',
'6/11',
'5/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0061',
'easy',
'A bag has 1 red and 2 blue marbles. What is P(red)?',
'1/3',
'2/3',
'1/2',
'3/1',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0062',
'easy',
'A bag has 2 red and 4 blue marbles. What is P(red)?',
'4/6',
'2/4',
'6/2',
'2/6',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0063',
'easy',
'A bag has 3 red and 6 blue marbles. What is P(red)?',
'3/6',
'9/3',
'3/9',
'6/9',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0064',
'easy',
'A bag has 4 red and 2 blue marbles. What is P(red)?',
'6/4',
'4/6',
'2/6',
'4/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0065',
'easy',
'A bag has 5 red and 4 blue marbles. What is P(red)?',
'5/9',
'4/9',
'5/4',
'9/5',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0066',
'easy',
'A bag has 1 red and 6 blue marbles. What is P(red)?',
'6/7',
'1/6',
'7/1',
'1/7',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0067',
'easy',
'A bag has 2 red and 2 blue marbles. What is P(red)?',
'4/2',
'2/4 (1)',
'2/4',
'2/2',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0068',
'easy',
'A bag has 3 red and 4 blue marbles. What is P(red)?',
'7/3',
'3/7',
'4/7',
'3/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0069',
'easy',
'A bag has 4 red and 6 blue marbles. What is P(red)?',
'4/10',
'6/10',
'4/6',
'10/4',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0070',
'easy',
'A bag has 5 red and 2 blue marbles. What is P(red)?',
'2/7',
'5/2',
'7/5',
'5/7',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0071',
'easy',
'A bag has 1 red and 4 blue marbles. What is P(red)?',
'1/4',
'5/1',
'1/5',
'4/5',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0072',
'easy',
'A bag has 2 red and 6 blue marbles. What is P(red)?',
'8/2',
'2/8',
'6/8',
'2/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0073',
'easy',
'A bag has 3 red and 2 blue marbles. What is P(red)?',
'3/5',
'2/5',
'3/2',
'5/3',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0074',
'easy',
'A bag has 4 red and 4 blue marbles. What is P(red)?',
'4/4',
'8/4',
'4/8 (1)',
'4/8',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0075',
'easy',
'A bag has 5 red and 6 blue marbles. What is P(red)?',
'5/6',
'11/5',
'5/11',
'6/11',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0076',
'easy',
'A bag has 1 red and 2 blue marbles. What is P(red)?',
'3/1',
'1/3',
'2/3',
'1/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0077',
'easy',
'A bag has 2 red and 4 blue marbles. What is P(red)?',
'2/6',
'4/6',
'2/4',
'6/2',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0078',
'easy',
'A bag has 3 red and 6 blue marbles. What is P(red)?',
'6/9',
'3/6',
'9/3',
'3/9',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0079',
'easy',
'A bag has 4 red and 2 blue marbles. What is P(red)?',
'4/2',
'6/4',
'4/6',
'2/6',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0080',
'easy',
'A bag has 5 red and 4 blue marbles. What is P(red)?',
'9/5',
'5/9',
'4/9',
'5/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0081',
'easy',
'A bag has 1 red and 6 blue marbles. What is P(red)?',
'1/7',
'6/7',
'1/6',
'7/1',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0082',
'easy',
'A bag has 2 red and 2 blue marbles. What is P(red)?',
'2/2',
'4/2',
'2/4 (1)',
'2/4',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0083',
'easy',
'A bag has 3 red and 4 blue marbles. What is P(red)?',
'3/4',
'7/3',
'3/7',
'4/7',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0084',
'easy',
'A bag has 4 red and 6 blue marbles. What is P(red)?',
'10/4',
'4/10',
'6/10',
'4/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0085',
'easy',
'A bag has 5 red and 2 blue marbles. What is P(red)?',
'5/7',
'2/7',
'5/2',
'7/5',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0086',
'easy',
'A bag has 1 red and 4 blue marbles. What is P(red)?',
'4/5',
'1/4',
'5/1',
'1/5',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0087',
'easy',
'A bag has 2 red and 6 blue marbles. What is P(red)?',
'2/6',
'8/2',
'2/8',
'6/8',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0088',
'easy',
'A bag has 3 red and 2 blue marbles. What is P(red)?',
'5/3',
'3/5',
'2/5',
'3/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0089',
'medium',
'A bag has 4 red and 4 blue marbles. What is P(red)?',
'4/8',
'4/4',
'8/4',
'4/8 (1)',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0090',
'medium',
'A bag has 5 red and 6 blue marbles. What is P(red)?',
'6/11',
'5/6',
'11/5',
'5/11',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0091',
'medium',
'A bag has 1 red and 2 blue marbles. What is P(red)?',
'1/2',
'3/1',
'1/3',
'2/3',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0092',
'medium',
'A bag has 2 red and 4 blue marbles. What is P(red)?',
'6/2',
'2/6',
'4/6',
'2/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0093',
'medium',
'A bag has 3 red and 6 blue marbles. What is P(red)?',
'3/9',
'6/9',
'3/6',
'9/3',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0094',
'medium',
'A bag has 4 red and 2 blue marbles. What is P(red)?',
'2/6',
'4/2',
'6/4',
'4/6',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0095',
'medium',
'A bag has 5 red and 4 blue marbles. What is P(red)?',
'5/4',
'9/5',
'5/9',
'4/9',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0096',
'medium',
'A bag has 1 red and 6 blue marbles. What is P(red)?',
'7/1',
'1/7',
'6/7',
'1/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0097',
'medium',
'A bag has 2 red and 2 blue marbles. What is P(red)?',
'2/4',
'2/2',
'4/2',
'2/4 (1)',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0098',
'medium',
'A bag has 3 red and 4 blue marbles. What is P(red)?',
'4/7',
'3/4',
'7/3',
'3/7',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0099',
'medium',
'A bag has 4 red and 6 blue marbles. What is P(red)?',
'4/6',
'10/4',
'4/10',
'6/10',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0100',
'medium',
'A bag has 5 red and 2 blue marbles. What is P(red)?',
'7/5',
'5/7',
'2/7',
'5/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0101',
'medium',
'A bag has 1 red and 4 blue marbles. What is P(red)?',
'1/5',
'4/5',
'1/4',
'5/1',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0102',
'medium',
'A bag has 2 red and 6 blue marbles. What is P(red)?',
'6/8',
'2/6',
'8/2',
'2/8',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0103',
'medium',
'A bag has 3 red and 2 blue marbles. What is P(red)?',
'3/2',
'5/3',
'3/5',
'2/5',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0104',
'medium',
'A bag has 4 red and 4 blue marbles. What is P(red)?',
'4/8 (1)',
'4/8',
'4/4',
'8/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0105',
'medium',
'A bag has 5 red and 6 blue marbles. What is P(red)?',
'5/11',
'6/11',
'5/6',
'11/5',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0106',
'medium',
'A bag has 1 red and 2 blue marbles. What is P(red)?',
'2/3',
'1/2',
'3/1',
'1/3',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0107',
'medium',
'A bag has 2 red and 4 blue marbles. What is P(red)?',
'2/4',
'6/2',
'2/6',
'4/6',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0108',
'medium',
'A bag has 3 red and 6 blue marbles. What is P(red)?',
'9/3',
'3/9',
'6/9',
'3/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0109',
'medium',
'A bag has 4 red and 2 blue marbles. What is P(red)?',
'4/6',
'2/6',
'4/2',
'6/4',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0110',
'medium',
'A bag has 5 red and 4 blue marbles. What is P(red)?',
'4/9',
'5/4',
'9/5',
'5/9',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0111',
'medium',
'A bag has 1 red and 6 blue marbles. What is P(red)?',
'1/6',
'7/1',
'1/7',
'6/7',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0112',
'medium',
'A bag has 2 red and 2 blue marbles. What is P(red)?',
'2/4 (1)',
'2/4',
'2/2',
'4/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0113',
'medium',
'A bag has 3 red and 4 blue marbles. What is P(red)?',
'3/7',
'4/7',
'3/4',
'7/3',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0114',
'medium',
'A bag has 4 red and 6 blue marbles. What is P(red)?',
'6/10',
'4/6',
'10/4',
'4/10',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0115',
'medium',
'A bag has 5 red and 2 blue marbles. What is P(red)?',
'5/2',
'7/5',
'5/7',
'2/7',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0116',
'medium',
'A bag has 1 red and 4 blue marbles. What is P(red)?',
'5/1',
'1/5',
'4/5',
'1/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0117',
'medium',
'A bag has 2 red and 6 blue marbles. What is P(red)?',
'2/8',
'6/8',
'2/6',
'8/2',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0118',
'medium',
'A bag has 3 red and 2 blue marbles. What is P(red)?',
'2/5',
'3/2',
'5/3',
'3/5',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0119',
'medium',
'A bag has 4 red and 4 blue marbles. What is P(red)?',
'8/4',
'4/8 (1)',
'4/8',
'4/4',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0120',
'medium',
'A bag has 5 red and 6 blue marbles. What is P(red)?',
'11/5',
'5/11',
'6/11',
'5/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0121',
'medium',
'A bag has 1 red and 2 blue marbles. What is P(red)?',
'1/3',
'2/3',
'1/2',
'3/1',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0122',
'medium',
'A bag has 2 red and 4 blue marbles. What is P(red)?',
'4/6',
'2/4',
'6/2',
'2/6',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0123',
'medium',
'A bag has 3 red and 6 blue marbles. What is P(red)?',
'3/6',
'9/3',
'3/9',
'6/9',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0124',
'medium',
'A bag has 4 red and 2 blue marbles. What is P(red)?',
'6/4',
'4/6',
'2/6',
'4/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0125',
'medium',
'A bag has 5 red and 4 blue marbles. What is P(red)?',
'5/9',
'4/9',
'5/4',
'9/5',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0126',
'medium',
'A bag has 1 red and 6 blue marbles. What is P(red)?',
'6/7',
'1/6',
'7/1',
'1/7',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0127',
'medium',
'A bag has 2 red and 2 blue marbles. What is P(red)?',
'4/2',
'2/4 (1)',
'2/4',
'2/2',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0128',
'medium',
'A bag has 3 red and 4 blue marbles. What is P(red)?',
'7/3',
'3/7',
'4/7',
'3/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0129',
'medium',
'A bag has 4 red and 6 blue marbles. What is P(red)?',
'4/10',
'6/10',
'4/6',
'10/4',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0130',
'medium',
'A bag has 5 red and 2 blue marbles. What is P(red)?',
'2/7',
'5/2',
'7/5',
'5/7',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0131',
'medium',
'A bag has 1 red and 4 blue marbles. What is P(red)?',
'1/4',
'5/1',
'1/5',
'4/5',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0132',
'medium',
'A bag has 2 red and 6 blue marbles. What is P(red)?',
'8/2',
'2/8',
'6/8',
'2/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0133',
'medium',
'A bag has 3 red and 2 blue marbles. What is P(red)?',
'3/5',
'2/5',
'3/2',
'5/3',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0134',
'medium',
'A bag has 4 red and 4 blue marbles. What is P(red)?',
'4/4',
'8/4',
'4/8 (1)',
'4/8',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0135',
'medium',
'A bag has 5 red and 6 blue marbles. What is P(red)?',
'5/6',
'11/5',
'5/11',
'6/11',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0136',
'medium',
'A bag has 1 red and 2 blue marbles. What is P(red)?',
'3/1',
'1/3',
'2/3',
'1/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0137',
'medium',
'A bag has 2 red and 4 blue marbles. What is P(red)?',
'2/6',
'4/6',
'2/4',
'6/2',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0138',
'medium',
'A bag has 3 red and 6 blue marbles. What is P(red)?',
'6/9',
'3/6',
'9/3',
'3/9',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0139',
'medium',
'A bag has 4 red and 2 blue marbles. What is P(red)?',
'4/2',
'6/4',
'4/6',
'2/6',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0140',
'medium',
'A bag has 5 red and 4 blue marbles. What is P(red)?',
'9/5',
'5/9',
'4/9',
'5/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0141',
'medium',
'A bag has 1 red and 6 blue marbles. What is P(red)?',
'1/7',
'6/7',
'1/6',
'7/1',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0142',
'medium',
'A bag has 2 red and 2 blue marbles. What is P(red)?',
'2/2',
'4/2',
'2/4 (1)',
'2/4',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0143',
'medium',
'A bag has 3 red and 4 blue marbles. What is P(red)?',
'3/4',
'7/3',
'3/7',
'4/7',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0144',
'medium',
'A bag has 4 red and 6 blue marbles. What is P(red)?',
'10/4',
'4/10',
'6/10',
'4/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0145',
'medium',
'A bag has 5 red and 2 blue marbles. What is P(red)?',
'5/7',
'2/7',
'5/2',
'7/5',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0146',
'medium',
'A bag has 1 red and 4 blue marbles. What is P(red)?',
'4/5',
'1/4',
'5/1',
'1/5',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0147',
'medium',
'A bag has 2 red and 6 blue marbles. What is P(red)?',
'2/6',
'8/2',
'2/8',
'6/8',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0148',
'medium',
'A bag has 3 red and 2 blue marbles. What is P(red)?',
'5/3',
'3/5',
'2/5',
'3/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0149',
'medium',
'A bag has 4 red and 4 blue marbles. What is P(red)?',
'4/8',
'4/4',
'8/4',
'4/8 (1)',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0150',
'medium',
'A bag has 5 red and 6 blue marbles. What is P(red)?',
'6/11',
'5/6',
'11/5',
'5/11',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0151',
'medium',
'A bag has 1 red and 2 blue marbles. What is P(red)?',
'1/2',
'3/1',
'1/3',
'2/3',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0152',
'medium',
'A bag has 2 red and 4 blue marbles. What is P(red)?',
'6/2',
'2/6',
'4/6',
'2/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0153',
'medium',
'A bag has 3 red and 6 blue marbles. What is P(red)?',
'3/9',
'6/9',
'3/6',
'9/3',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0154',
'medium',
'A bag has 4 red and 2 blue marbles. What is P(red)?',
'2/6',
'4/2',
'6/4',
'4/6',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0155',
'medium',
'A bag has 5 red and 4 blue marbles. What is P(red)?',
'5/4',
'9/5',
'5/9',
'4/9',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0156',
'medium',
'A bag has 1 red and 6 blue marbles. What is P(red)?',
'7/1',
'1/7',
'6/7',
'1/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0157',
'medium',
'A bag has 2 red and 2 blue marbles. What is P(red)?',
'2/4',
'2/2',
'4/2',
'2/4 (1)',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0158',
'medium',
'A bag has 3 red and 4 blue marbles. What is P(red)?',
'4/7',
'3/4',
'7/3',
'3/7',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0159',
'medium',
'A bag has 4 red and 6 blue marbles. What is P(red)?',
'4/6',
'10/4',
'4/10',
'6/10',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0160',
'medium',
'A bag has 5 red and 2 blue marbles. What is P(red)?',
'7/5',
'5/7',
'2/7',
'5/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0161',
'medium',
'A bag has 1 red and 4 blue marbles. What is P(red)?',
'1/5',
'4/5',
'1/4',
'5/1',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0162',
'medium',
'A bag has 2 red and 6 blue marbles. What is P(red)?',
'6/8',
'2/6',
'8/2',
'2/8',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0163',
'medium',
'A bag has 3 red and 2 blue marbles. What is P(red)?',
'3/2',
'5/3',
'3/5',
'2/5',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0164',
'medium',
'A bag has 4 red and 4 blue marbles. What is P(red)?',
'4/8 (1)',
'4/8',
'4/4',
'8/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0165',
'medium',
'A bag has 5 red and 6 blue marbles. What is P(red)?',
'5/11',
'6/11',
'5/6',
'11/5',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0166',
'medium',
'A bag has 1 red and 2 blue marbles. What is P(red)?',
'2/3',
'1/2',
'3/1',
'1/3',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0167',
'medium',
'A bag has 2 red and 4 blue marbles. What is P(red)?',
'2/4',
'6/2',
'2/6',
'4/6',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0168',
'medium',
'A bag has 3 red and 6 blue marbles. What is P(red)?',
'9/3',
'3/9',
'6/9',
'3/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0169',
'medium',
'A bag has 4 red and 2 blue marbles. What is P(red)?',
'4/6',
'2/6',
'4/2',
'6/4',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0170',
'medium',
'A bag has 5 red and 4 blue marbles. What is P(red)?',
'4/9',
'5/4',
'9/5',
'5/9',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0171',
'medium',
'A bag has 1 red and 6 blue marbles. What is P(red)?',
'1/6',
'7/1',
'1/7',
'6/7',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0172',
'medium',
'A bag has 2 red and 2 blue marbles. What is P(red)?',
'2/4 (1)',
'2/4',
'2/2',
'4/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0173',
'medium',
'A bag has 3 red and 4 blue marbles. What is P(red)?',
'3/7',
'4/7',
'3/4',
'7/3',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0174',
'medium',
'A bag has 4 red and 6 blue marbles. What is P(red)?',
'6/10',
'4/6',
'10/4',
'4/10',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0175',
'medium',
'A bag has 5 red and 2 blue marbles. What is P(red)?',
'5/2',
'7/5',
'5/7',
'2/7',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0176',
'medium',
'A bag has 1 red and 4 blue marbles. What is P(red)?',
'5/1',
'1/5',
'4/5',
'1/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0177',
'medium',
'A bag has 2 red and 6 blue marbles. What is P(red)?',
'2/8',
'6/8',
'2/6',
'8/2',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0178',
'medium',
'A bag has 3 red and 2 blue marbles. What is P(red)?',
'2/5',
'3/2',
'5/3',
'3/5',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0179',
'medium',
'A bag has 4 red and 4 blue marbles. What is P(red)?',
'8/4',
'4/8 (1)',
'4/8',
'4/4',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0180',
'medium',
'A bag has 5 red and 6 blue marbles. What is P(red)?',
'11/5',
'5/11',
'6/11',
'5/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0181',
'medium',
'A bag has 1 red and 2 blue marbles. What is P(red)?',
'1/3',
'2/3',
'1/2',
'3/1',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0182',
'medium',
'A bag has 2 red and 4 blue marbles. What is P(red)?',
'4/6',
'2/4',
'6/2',
'2/6',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0183',
'medium',
'A bag has 3 red and 6 blue marbles. What is P(red)?',
'3/6',
'9/3',
'3/9',
'6/9',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0184',
'medium',
'A bag has 4 red and 2 blue marbles. What is P(red)?',
'6/4',
'4/6',
'2/6',
'4/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0185',
'medium',
'A bag has 5 red and 4 blue marbles. What is P(red)?',
'5/9',
'4/9',
'5/4',
'9/5',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0186',
'medium',
'A bag has 1 red and 6 blue marbles. What is P(red)?',
'6/7',
'1/6',
'7/1',
'1/7',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0187',
'medium',
'A bag has 2 red and 2 blue marbles. What is P(red)?',
'4/2',
'2/4 (1)',
'2/4',
'2/2',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0188',
'medium',
'A bag has 3 red and 4 blue marbles. What is P(red)?',
'7/3',
'3/7',
'4/7',
'3/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0189',
'medium',
'A bag has 4 red and 6 blue marbles. What is P(red)?',
'4/10',
'6/10',
'4/6',
'10/4',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0190',
'medium',
'A bag has 5 red and 2 blue marbles. What is P(red)?',
'2/7',
'5/2',
'7/5',
'5/7',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0191',
'medium',
'A bag has 1 red and 4 blue marbles. What is P(red)?',
'1/4',
'5/1',
'1/5',
'4/5',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0192',
'medium',
'A bag has 2 red and 6 blue marbles. What is P(red)?',
'8/2',
'2/8',
'6/8',
'2/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0193',
'medium',
'A bag has 3 red and 2 blue marbles. What is P(red)?',
'3/5',
'2/5',
'3/2',
'5/3',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0194',
'medium',
'A bag has 4 red and 4 blue marbles. What is P(red)?',
'4/4',
'8/4',
'4/8 (1)',
'4/8',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0195',
'medium',
'A bag has 5 red and 6 blue marbles. What is P(red)?',
'5/6',
'11/5',
'5/11',
'6/11',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0196',
'medium',
'A bag has 1 red and 2 blue marbles. What is P(red)?',
'3/1',
'1/3',
'2/3',
'1/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0197',
'medium',
'A bag has 2 red and 4 blue marbles. What is P(red)?',
'2/6',
'4/6',
'2/4',
'6/2',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0198',
'medium',
'A bag has 3 red and 6 blue marbles. What is P(red)?',
'6/9',
'3/6',
'9/3',
'3/9',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0199',
'medium',
'A bag has 4 red and 2 blue marbles. What is P(red)?',
'4/2',
'6/4',
'4/6',
'2/6',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0200',
'medium',
'A bag has 5 red and 4 blue marbles. What is P(red)?',
'9/5',
'5/9',
'4/9',
'5/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0201',
'challenge',
'A bag has 1 red and 6 blue marbles. What is P(red)?',
'1/7',
'6/7',
'1/6',
'7/1',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0202',
'challenge',
'A bag has 2 red and 2 blue marbles. What is P(red)?',
'2/2',
'4/2',
'2/4 (1)',
'2/4',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0203',
'challenge',
'A bag has 3 red and 4 blue marbles. What is P(red)?',
'3/4',
'7/3',
'3/7',
'4/7',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0204',
'challenge',
'A bag has 4 red and 6 blue marbles. What is P(red)?',
'10/4',
'4/10',
'6/10',
'4/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0205',
'challenge',
'A bag has 5 red and 2 blue marbles. What is P(red)?',
'5/7',
'2/7',
'5/2',
'7/5',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0206',
'challenge',
'A bag has 1 red and 4 blue marbles. What is P(red)?',
'4/5',
'1/4',
'5/1',
'1/5',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0207',
'challenge',
'A bag has 2 red and 6 blue marbles. What is P(red)?',
'2/6',
'8/2',
'2/8',
'6/8',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0208',
'challenge',
'A bag has 3 red and 2 blue marbles. What is P(red)?',
'5/3',
'3/5',
'2/5',
'3/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0209',
'challenge',
'A bag has 4 red and 4 blue marbles. What is P(red)?',
'4/8',
'4/4',
'8/4',
'4/8 (1)',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0210',
'challenge',
'A bag has 5 red and 6 blue marbles. What is P(red)?',
'6/11',
'5/6',
'11/5',
'5/11',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0211',
'challenge',
'A bag has 1 red and 2 blue marbles. What is P(red)?',
'1/2',
'3/1',
'1/3',
'2/3',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0212',
'challenge',
'A bag has 2 red and 4 blue marbles. What is P(red)?',
'6/2',
'2/6',
'4/6',
'2/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0213',
'challenge',
'A bag has 3 red and 6 blue marbles. What is P(red)?',
'3/9',
'6/9',
'3/6',
'9/3',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0214',
'challenge',
'A bag has 4 red and 2 blue marbles. What is P(red)?',
'2/6',
'4/2',
'6/4',
'4/6',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0215',
'challenge',
'A bag has 5 red and 4 blue marbles. What is P(red)?',
'5/4',
'9/5',
'5/9',
'4/9',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0216',
'challenge',
'A bag has 1 red and 6 blue marbles. What is P(red)?',
'7/1',
'1/7',
'6/7',
'1/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0217',
'challenge',
'A bag has 2 red and 2 blue marbles. What is P(red)?',
'2/4',
'2/2',
'4/2',
'2/4 (1)',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0218',
'challenge',
'A bag has 3 red and 4 blue marbles. What is P(red)?',
'4/7',
'3/4',
'7/3',
'3/7',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0219',
'challenge',
'A bag has 4 red and 6 blue marbles. What is P(red)?',
'4/6',
'10/4',
'4/10',
'6/10',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0220',
'challenge',
'A bag has 5 red and 2 blue marbles. What is P(red)?',
'7/5',
'5/7',
'2/7',
'5/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0221',
'challenge',
'A bag has 1 red and 4 blue marbles. What is P(red)?',
'1/5',
'4/5',
'1/4',
'5/1',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0222',
'challenge',
'A bag has 2 red and 6 blue marbles. What is P(red)?',
'6/8',
'2/6',
'8/2',
'2/8',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0223',
'challenge',
'A bag has 3 red and 2 blue marbles. What is P(red)?',
'3/2',
'5/3',
'3/5',
'2/5',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0224',
'challenge',
'A bag has 4 red and 4 blue marbles. What is P(red)?',
'4/8 (1)',
'4/8',
'4/4',
'8/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0225',
'challenge',
'A bag has 5 red and 6 blue marbles. What is P(red)?',
'5/11',
'6/11',
'5/6',
'11/5',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0226',
'challenge',
'A bag has 1 red and 2 blue marbles. What is P(red)?',
'2/3',
'1/2',
'3/1',
'1/3',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0227',
'challenge',
'A bag has 2 red and 4 blue marbles. What is P(red)?',
'2/4',
'6/2',
'2/6',
'4/6',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0228',
'challenge',
'A bag has 3 red and 6 blue marbles. What is P(red)?',
'9/3',
'3/9',
'6/9',
'3/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0229',
'challenge',
'A bag has 4 red and 2 blue marbles. What is P(red)?',
'4/6',
'2/6',
'4/2',
'6/4',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0230',
'challenge',
'A bag has 5 red and 4 blue marbles. What is P(red)?',
'4/9',
'5/4',
'9/5',
'5/9',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0231',
'challenge',
'A bag has 1 red and 6 blue marbles. What is P(red)?',
'1/6',
'7/1',
'1/7',
'6/7',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0232',
'challenge',
'A bag has 2 red and 2 blue marbles. What is P(red)?',
'2/4 (1)',
'2/4',
'2/2',
'4/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0233',
'challenge',
'A bag has 3 red and 4 blue marbles. What is P(red)?',
'3/7',
'4/7',
'3/4',
'7/3',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0234',
'challenge',
'A bag has 4 red and 6 blue marbles. What is P(red)?',
'6/10',
'4/6',
'10/4',
'4/10',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0235',
'challenge',
'A bag has 5 red and 2 blue marbles. What is P(red)?',
'5/2',
'7/5',
'5/7',
'2/7',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0236',
'challenge',
'A bag has 1 red and 4 blue marbles. What is P(red)?',
'5/1',
'1/5',
'4/5',
'1/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0237',
'challenge',
'A bag has 2 red and 6 blue marbles. What is P(red)?',
'2/8',
'6/8',
'2/6',
'8/2',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0238',
'challenge',
'A bag has 3 red and 2 blue marbles. What is P(red)?',
'2/5',
'3/2',
'5/3',
'3/5',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0239',
'challenge',
'A bag has 4 red and 4 blue marbles. What is P(red)?',
'8/4',
'4/8 (1)',
'4/8',
'4/4',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0240',
'challenge',
'A bag has 5 red and 6 blue marbles. What is P(red)?',
'11/5',
'5/11',
'6/11',
'5/6',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0241',
'challenge',
'A bag has 1 red and 2 blue marbles. What is P(red)?',
'1/3',
'2/3',
'1/2',
'3/1',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0242',
'challenge',
'A bag has 2 red and 4 blue marbles. What is P(red)?',
'4/6',
'2/4',
'6/2',
'2/6',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0243',
'challenge',
'A bag has 3 red and 6 blue marbles. What is P(red)?',
'3/6',
'9/3',
'3/9',
'6/9',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0244',
'challenge',
'A bag has 4 red and 2 blue marbles. What is P(red)?',
'6/4',
'4/6',
'2/6',
'4/2',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0245',
'challenge',
'A bag has 5 red and 4 blue marbles. What is P(red)?',
'5/9',
'4/9',
'5/4',
'9/5',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0246',
'challenge',
'A bag has 1 red and 6 blue marbles. What is P(red)?',
'6/7',
'1/6',
'7/1',
'1/7',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0247',
'challenge',
'A bag has 2 red and 2 blue marbles. What is P(red)?',
'4/2',
'2/4 (1)',
'2/4',
'2/2',
'C',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0248',
'challenge',
'A bag has 3 red and 4 blue marbles. What is P(red)?',
'7/3',
'3/7',
'4/7',
'3/4',
'B',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0249',
'challenge',
'A bag has 4 red and 6 blue marbles. What is P(red)?',
'4/10',
'6/10',
'4/6',
'10/4',
'A',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'US_PROGRAM_SAT_MATH_DATA_0250',
'challenge',
'A bag has 5 red and 2 blue marbles. What is P(red)?',
'2/7',
'5/2',
'7/5',
'5/7',
'D',
'Probability = favorable outcomes / total outcomes.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='US'
  AND s.grade_code='PROGRAM_SAT'
  AND s.subject_code='MATH'
  AND t.topic_code='MATH'
  AND st.subtopic_code='DATA';

