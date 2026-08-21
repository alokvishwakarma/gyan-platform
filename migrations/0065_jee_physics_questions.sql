-- GENERATED ORIGINAL PRACTICE BANK
PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO education_subjects
(country_code, grade_code, subject_code, subject_name, enabled, sort_order)
VALUES ('IN','PROGRAM_JEE','PHYSICS','JEE Physics',1,10);

INSERT OR IGNORE INTO education_topics
(subject_id, topic_code, topic_name, enabled, sort_order)
SELECT id,'PHYSICS','Physics',1,10
FROM education_subjects
WHERE country_code='IN' AND grade_code='PROGRAM_JEE' AND subject_code='PHYSICS';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'KINEMATICS','Kinematics',1,10
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'MECHANICS','Mechanics',1,20
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'WAVES','Waves',1,30
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'ELECTRICITY','Electricity',1,40
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0001',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'4',
'3',
'2',
'6',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0002',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'7',
'16',
'22',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0003',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'14',
'10',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0004',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'42',
'37',
'9',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0005',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'9',
'7',
'3',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0006',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'11',
'20',
'34',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0007',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'23',
'15',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0008',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'26',
'17',
'13',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0009',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'14',
'11',
'4',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0010',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'15',
'24',
'46',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0011',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'12',
'10',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0012',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'18',
'15',
'7',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0013',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'9',
'5',
'13',
'9 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0014',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'9',
'28',
'38',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0015',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'14',
'8',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0016',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'30',
'23',
'11',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0017',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'14',
'9',
'6',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0018',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'13',
'32',
'50',
'41',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0019',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'23',
'13',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0020',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'42',
'31',
'15',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0021',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'9',
'3',
'7',
'11',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0022',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'7',
'8',
'14',
'11',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0023',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'12',
'8',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0024',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'34',
'29',
'9',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0025',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'14',
'7',
'8',
'20',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0026',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'11',
'12',
'26',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0027',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'21',
'13',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0028',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'46',
'37',
'13',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0029',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'12',
'11',
'2',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0030',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'15',
'16',
'38',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0031',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'10',
'8',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0032',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'38',
'35',
'7',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0033',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'7',
'5',
'3',
'11',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0034',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'9',
'20',
'30',
'25',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0035',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'19',
'13 (1)',
'13',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0036',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'22',
'15',
'11',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0037',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'12',
'9',
'4',
'20',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0038',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'13',
'24',
'42',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0039',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'28',
'18',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0040',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'34',
'23',
'15',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0041',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'7',
'3',
'5',
'9',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0042',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'7',
'28',
'34',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0043',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'10',
'6',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0044',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'26',
'21',
'9',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0045',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'12',
'7',
'6',
'18',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0046',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'11',
'32',
'46',
'39',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0047',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'19',
'11',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0048',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'38',
'29',
'13',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0049',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'17',
'11',
'7',
'27',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0050',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'15',
'8',
'30',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0051',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'8',
'6',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0052',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'30',
'27',
'7',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0053',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'12',
'5',
'8',
'16',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0054',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'9',
'12',
'22',
'17',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0055',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'17',
'11',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0056',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'42',
'35',
'11',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0057',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'10',
'9',
'2',
'18',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0058',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'13',
'16',
'34',
'25',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0059',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'26',
'16',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0060',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'54',
'43',
'15',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0061',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'5',
'3',
'7',
'5 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0062',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'7',
'20',
'26',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0063',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'15',
'11',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0064',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'18',
'13',
'9',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0065',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'10',
'7',
'4',
'16',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0066',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'11',
'24',
'38',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0067',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'24',
'16',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0068',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'30',
'21',
'13',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0069',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'15',
'11',
'5',
'25',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0070',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'15',
'28',
'50',
'39',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0071',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'6',
'4',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0072',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'22',
'19',
'7',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0073',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'10',
'5',
'6',
'14',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0074',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'9',
'32',
'42',
'37',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0075',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'15',
'9',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0076',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'34',
'27',
'11',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0077',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'15',
'9',
'7',
'23',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0078',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'13',
'8',
'26',
'17',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0079',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'24',
'14',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0080',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'46',
'35',
'15',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0081',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'10',
'3',
'8',
'12',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0082',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'7',
'12',
'18',
'15',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0083',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'13',
'9 (1)',
'9',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0084',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'38',
'33',
'9',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0085',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'8',
'7',
'2',
'14',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0086',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'11',
'16',
'30',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0087',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'22',
'14',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0088',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'50',
'41',
'13',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0089',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'13',
'11',
'3',
'23',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0090',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'15',
'20',
'42',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0091',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'11',
'9',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0092',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'14',
'11',
'7',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0093',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'8',
'5',
'4',
'12',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0094',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'9',
'24',
'34',
'29',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0095',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'20',
'14',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0096',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'26',
'19',
'11',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0097',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'13',
'9',
'5',
'21',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0098',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'13',
'28',
'46',
'37',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0099',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'22',
'12',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0100',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'38',
'27',
'15',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0101',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'8',
'3',
'6',
'10',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0102',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'7',
'32',
'38',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0103',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'11',
'7',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0104',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'30',
'25',
'9',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0105',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'13',
'7',
'19',
'13 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0106',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'11',
'8',
'22',
'15',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0107',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'20',
'12',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0108',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'42',
'33',
'13',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0109',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'18',
'11',
'8',
'28',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0110',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'15',
'12',
'34',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0111',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'9',
'7',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0112',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'34',
'31',
'7',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0113',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'6',
'5',
'2',
'10',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0114',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'9',
'16',
'26',
'21',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0115',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'18',
'12',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0116',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'46',
'39',
'11',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0117',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'11',
'9',
'3',
'19',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0118',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'13',
'20',
'38',
'29',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0119',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'27',
'17',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0120',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'30',
'19',
'15',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0121',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'6',
'3',
'4',
'8',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0122',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'7',
'24',
'30',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0123',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'16',
'12',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0124',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'22',
'17',
'9',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0125',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'11',
'7',
'5',
'17',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0126',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'11',
'28',
'42',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0127',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'18',
'10',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0128',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'34',
'25',
'13',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0129',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'16',
'11',
'6',
'26',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0130',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'15',
'32',
'54',
'43',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0131',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'7',
'5 (1)',
'5',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0132',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'26',
'23',
'7',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0133',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'11',
'5',
'7',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0134',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'9',
'8',
'18',
'13',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0135',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'16',
'10',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0136',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'38',
'31',
'11',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0137',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'16',
'9',
'8',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0138',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'13',
'12',
'30',
'21',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0139',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'25',
'15',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0140',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'50',
'39',
'15',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0141',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'4',
'3',
'2',
'6',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0142',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'7',
'16',
'22',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0143',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'14',
'10',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0144',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'42',
'37',
'9',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0145',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'9',
'7',
'3',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0146',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'11',
'20',
'34',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0147',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'23',
'15',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0148',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'26',
'17',
'13',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0149',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'14',
'11',
'4',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0150',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'15',
'24',
'46',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0151',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'12',
'10',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0152',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'18',
'15',
'7',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0153',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'9',
'5',
'13',
'9 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0154',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'9',
'28',
'38',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0155',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'14',
'8',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0156',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'30',
'23',
'11',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0157',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'14',
'9',
'6',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0158',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'13',
'32',
'50',
'41',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0159',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'23',
'13',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0160',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'42',
'31',
'15',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0161',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'9',
'3',
'7',
'11',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0162',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'7',
'8',
'14',
'11',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0163',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'12',
'8',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0164',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'34',
'29',
'9',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0165',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'14',
'7',
'8',
'20',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0166',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'11',
'12',
'26',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0167',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'21',
'13',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0168',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'46',
'37',
'13',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0169',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'12',
'11',
'2',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0170',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'15',
'16',
'38',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0171',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'10',
'8',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0172',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'38',
'35',
'7',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0173',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'7',
'5',
'3',
'11',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0174',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'9',
'20',
'30',
'25',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0175',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'19',
'13 (1)',
'13',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0176',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'22',
'15',
'11',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0177',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'12',
'9',
'4',
'20',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0178',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'13',
'24',
'42',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0179',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'28',
'18',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0180',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'34',
'23',
'15',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0181',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'7',
'3',
'5',
'9',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0182',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'7',
'28',
'34',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0183',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'10',
'6',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0184',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'26',
'21',
'9',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0185',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'12',
'7',
'6',
'18',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0186',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'11',
'32',
'46',
'39',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0187',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'19',
'11',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0188',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'38',
'29',
'13',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0189',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'17',
'11',
'7',
'27',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0190',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'15',
'8',
'30',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0191',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'8',
'6',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0192',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'30',
'27',
'7',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0193',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'12',
'5',
'8',
'16',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0194',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'9',
'12',
'22',
'17',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0195',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'17',
'11',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0196',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'42',
'35',
'11',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0197',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'10',
'9',
'2',
'18',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0198',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'13',
'16',
'34',
'25',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0199',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'26',
'16',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0200',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'54',
'43',
'15',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0201',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'5',
'3',
'7',
'5 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0202',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'7',
'20',
'26',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0203',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'15',
'11',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0204',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'18',
'13',
'9',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0205',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'10',
'7',
'4',
'16',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0206',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'11',
'24',
'38',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0207',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'24',
'16',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0208',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'30',
'21',
'13',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0209',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'15',
'11',
'5',
'25',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0210',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'15',
'28',
'50',
'39',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0211',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'6',
'4',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0212',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'22',
'19',
'7',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0213',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'10',
'5',
'6',
'14',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0214',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'9',
'32',
'42',
'37',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0215',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'15',
'9',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0216',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'34',
'27',
'11',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0217',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'15',
'9',
'7',
'23',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0218',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'13',
'8',
'26',
'17',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0219',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'24',
'14',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0220',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'46',
'35',
'15',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0221',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'10',
'3',
'8',
'12',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0222',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'7',
'12',
'18',
'15',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0223',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'13',
'9 (1)',
'9',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0224',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'38',
'33',
'9',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0225',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'8',
'7',
'2',
'14',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0226',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'11',
'16',
'30',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0227',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'22',
'14',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0228',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'50',
'41',
'13',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0229',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'13',
'11',
'3',
'23',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0230',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'15',
'20',
'42',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0231',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'11',
'9',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0232',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'14',
'11',
'7',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0233',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'8',
'5',
'4',
'12',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0234',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'9',
'24',
'34',
'29',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0235',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'20',
'14',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0236',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'26',
'19',
'11',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0237',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'13',
'9',
'5',
'21',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0238',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'13',
'28',
'46',
'37',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0239',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'22',
'12',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0240',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'38',
'27',
'15',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0241',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'8',
'3',
'6',
'10',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0242',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'7',
'32',
'38',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0243',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'11',
'7',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0244',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'30',
'25',
'9',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0245',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'13',
'7',
'19',
'13 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0246',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'11',
'8',
'22',
'15',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0247',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'20',
'12',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0248',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'42',
'33',
'13',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0249',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'18',
'11',
'8',
'28',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0250',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'15',
'12',
'34',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0251',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'9',
'7',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0252',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'34',
'31',
'7',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0253',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'6',
'5',
'2',
'10',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0254',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'9',
'16',
'26',
'21',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0255',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'18',
'12',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0256',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'46',
'39',
'11',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0257',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'11',
'9',
'3',
'19',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0258',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'13',
'20',
'38',
'29',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0259',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'27',
'17',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0260',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'30',
'19',
'15',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0261',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'6',
'3',
'4',
'8',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0262',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'7',
'24',
'30',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0263',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'16',
'12',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0264',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'22',
'17',
'9',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0265',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'11',
'7',
'5',
'17',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0266',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'11',
'28',
'42',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0267',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'18',
'10',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0268',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'34',
'25',
'13',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0269',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'16',
'11',
'6',
'26',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0270',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'15',
'32',
'54',
'43',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0271',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'7',
'5 (1)',
'5',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0272',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'26',
'23',
'7',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0273',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'11',
'5',
'7',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0274',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'9',
'8',
'18',
'13',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0275',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'16',
'10',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0276',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'38',
'31',
'11',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0277',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'16',
'9',
'8',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0278',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'13',
'12',
'30',
'21',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0279',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'25',
'15',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0280',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'50',
'39',
'15',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0281',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'4',
'3',
'2',
'6',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0282',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'7',
'16',
'22',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0283',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'14',
'10',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0284',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'42',
'37',
'9',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0285',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'9',
'7',
'3',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0286',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'11',
'20',
'34',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0287',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'23',
'15',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0288',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'26',
'17',
'13',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0289',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'14',
'11',
'4',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0290',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'15',
'24',
'46',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0291',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'12',
'10',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0292',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'18',
'15',
'7',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0293',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'9',
'5',
'13',
'9 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0294',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'9',
'28',
'38',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0295',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'14',
'8',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0296',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'30',
'23',
'11',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0297',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'14',
'9',
'6',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0298',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'13',
'32',
'50',
'41',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0299',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'23',
'13',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_0300',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'42',
'31',
'15',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='KINEMATICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0001',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'4',
'3',
'2',
'6',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0002',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'7',
'16',
'22',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0003',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'14',
'10',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0004',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'42',
'37',
'9',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0005',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'9',
'7',
'3',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0006',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'11',
'20',
'34',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0007',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'23',
'15',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0008',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'26',
'17',
'13',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0009',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'14',
'11',
'4',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0010',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'15',
'24',
'46',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0011',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'12',
'10',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0012',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'18',
'15',
'7',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0013',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'9',
'5',
'13',
'9 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0014',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'9',
'28',
'38',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0015',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'14',
'8',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0016',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'30',
'23',
'11',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0017',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'14',
'9',
'6',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0018',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'13',
'32',
'50',
'41',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0019',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'23',
'13',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0020',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'42',
'31',
'15',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0021',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'9',
'3',
'7',
'11',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0022',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'7',
'8',
'14',
'11',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0023',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'12',
'8',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0024',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'34',
'29',
'9',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0025',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'14',
'7',
'8',
'20',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0026',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'11',
'12',
'26',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0027',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'21',
'13',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0028',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'46',
'37',
'13',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0029',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'12',
'11',
'2',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0030',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'15',
'16',
'38',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0031',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'10',
'8',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0032',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'38',
'35',
'7',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0033',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'7',
'5',
'3',
'11',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0034',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'9',
'20',
'30',
'25',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0035',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'19',
'13 (1)',
'13',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0036',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'22',
'15',
'11',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0037',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'12',
'9',
'4',
'20',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0038',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'13',
'24',
'42',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0039',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'28',
'18',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0040',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'34',
'23',
'15',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0041',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'7',
'3',
'5',
'9',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0042',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'7',
'28',
'34',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0043',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'10',
'6',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0044',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'26',
'21',
'9',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0045',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'12',
'7',
'6',
'18',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0046',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'11',
'32',
'46',
'39',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0047',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'19',
'11',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0048',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'38',
'29',
'13',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0049',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'17',
'11',
'7',
'27',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0050',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'15',
'8',
'30',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0051',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'8',
'6',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0052',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'30',
'27',
'7',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0053',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'12',
'5',
'8',
'16',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0054',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'9',
'12',
'22',
'17',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0055',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'17',
'11',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0056',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'42',
'35',
'11',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0057',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'10',
'9',
'2',
'18',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0058',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'13',
'16',
'34',
'25',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0059',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'26',
'16',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0060',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'54',
'43',
'15',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0061',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'5',
'3',
'7',
'5 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0062',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'7',
'20',
'26',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0063',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'15',
'11',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0064',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'18',
'13',
'9',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0065',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'10',
'7',
'4',
'16',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0066',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'11',
'24',
'38',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0067',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'24',
'16',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0068',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'30',
'21',
'13',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0069',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'15',
'11',
'5',
'25',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0070',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'15',
'28',
'50',
'39',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0071',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'6',
'4',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0072',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'22',
'19',
'7',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0073',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'10',
'5',
'6',
'14',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0074',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'9',
'32',
'42',
'37',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0075',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'15',
'9',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0076',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'34',
'27',
'11',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0077',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'15',
'9',
'7',
'23',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0078',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'13',
'8',
'26',
'17',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0079',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'24',
'14',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0080',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'46',
'35',
'15',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0081',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'10',
'3',
'8',
'12',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0082',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'7',
'12',
'18',
'15',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0083',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'13',
'9 (1)',
'9',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0084',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'38',
'33',
'9',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0085',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'8',
'7',
'2',
'14',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0086',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'11',
'16',
'30',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0087',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'22',
'14',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0088',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'50',
'41',
'13',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0089',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'13',
'11',
'3',
'23',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0090',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'15',
'20',
'42',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0091',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'11',
'9',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0092',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'14',
'11',
'7',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0093',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'8',
'5',
'4',
'12',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0094',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'9',
'24',
'34',
'29',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0095',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'20',
'14',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0096',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'26',
'19',
'11',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0097',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'13',
'9',
'5',
'21',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0098',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'13',
'28',
'46',
'37',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0099',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'22',
'12',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0100',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'38',
'27',
'15',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0101',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'8',
'3',
'6',
'10',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0102',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'7',
'32',
'38',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0103',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'11',
'7',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0104',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'30',
'25',
'9',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0105',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'13',
'7',
'19',
'13 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0106',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'11',
'8',
'22',
'15',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0107',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'20',
'12',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0108',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'42',
'33',
'13',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0109',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'18',
'11',
'8',
'28',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0110',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'15',
'12',
'34',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0111',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'9',
'7',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0112',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'34',
'31',
'7',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0113',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'6',
'5',
'2',
'10',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0114',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'9',
'16',
'26',
'21',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0115',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'18',
'12',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0116',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'46',
'39',
'11',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0117',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'11',
'9',
'3',
'19',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0118',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'13',
'20',
'38',
'29',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0119',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'27',
'17',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0120',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'30',
'19',
'15',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0121',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'6',
'3',
'4',
'8',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0122',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'7',
'24',
'30',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0123',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'16',
'12',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0124',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'22',
'17',
'9',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0125',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'11',
'7',
'5',
'17',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0126',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'11',
'28',
'42',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0127',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'18',
'10',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0128',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'34',
'25',
'13',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0129',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'16',
'11',
'6',
'26',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0130',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'15',
'32',
'54',
'43',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0131',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'7',
'5 (1)',
'5',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0132',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'26',
'23',
'7',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0133',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'11',
'5',
'7',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0134',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'9',
'8',
'18',
'13',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0135',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'16',
'10',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0136',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'38',
'31',
'11',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0137',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'16',
'9',
'8',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0138',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'13',
'12',
'30',
'21',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0139',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'25',
'15',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0140',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'50',
'39',
'15',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0141',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'4',
'3',
'2',
'6',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0142',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'7',
'16',
'22',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0143',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'14',
'10',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0144',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'42',
'37',
'9',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0145',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'9',
'7',
'3',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0146',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'11',
'20',
'34',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0147',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'23',
'15',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0148',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'26',
'17',
'13',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0149',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'14',
'11',
'4',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0150',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'15',
'24',
'46',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0151',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'12',
'10',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0152',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'18',
'15',
'7',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0153',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'9',
'5',
'13',
'9 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0154',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'9',
'28',
'38',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0155',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'14',
'8',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0156',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'30',
'23',
'11',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0157',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'14',
'9',
'6',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0158',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'13',
'32',
'50',
'41',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0159',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'23',
'13',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0160',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'42',
'31',
'15',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0161',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'9',
'3',
'7',
'11',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0162',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'7',
'8',
'14',
'11',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0163',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'12',
'8',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0164',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'34',
'29',
'9',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0165',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'14',
'7',
'8',
'20',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0166',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'11',
'12',
'26',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0167',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'21',
'13',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0168',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'46',
'37',
'13',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0169',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'12',
'11',
'2',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0170',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'15',
'16',
'38',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0171',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'10',
'8',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0172',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'38',
'35',
'7',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0173',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'7',
'5',
'3',
'11',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0174',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'9',
'20',
'30',
'25',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0175',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'19',
'13 (1)',
'13',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0176',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'22',
'15',
'11',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0177',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'12',
'9',
'4',
'20',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0178',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'13',
'24',
'42',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0179',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'28',
'18',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0180',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'34',
'23',
'15',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0181',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'7',
'3',
'5',
'9',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0182',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'7',
'28',
'34',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0183',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'10',
'6',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0184',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'26',
'21',
'9',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0185',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'12',
'7',
'6',
'18',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0186',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'11',
'32',
'46',
'39',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0187',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'19',
'11',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0188',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'38',
'29',
'13',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0189',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'17',
'11',
'7',
'27',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0190',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'15',
'8',
'30',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0191',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'8',
'6',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0192',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'30',
'27',
'7',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0193',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'12',
'5',
'8',
'16',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0194',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'9',
'12',
'22',
'17',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0195',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'17',
'11',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0196',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'42',
'35',
'11',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0197',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'10',
'9',
'2',
'18',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0198',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'13',
'16',
'34',
'25',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0199',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'26',
'16',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0200',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'54',
'43',
'15',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0201',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'5',
'3',
'7',
'5 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0202',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'7',
'20',
'26',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0203',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'15',
'11',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0204',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'18',
'13',
'9',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0205',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'10',
'7',
'4',
'16',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0206',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'11',
'24',
'38',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0207',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'24',
'16',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0208',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'30',
'21',
'13',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0209',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'15',
'11',
'5',
'25',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0210',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'15',
'28',
'50',
'39',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0211',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'6',
'4',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0212',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'22',
'19',
'7',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0213',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'10',
'5',
'6',
'14',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0214',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'9',
'32',
'42',
'37',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0215',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'15',
'9',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0216',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'34',
'27',
'11',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0217',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'15',
'9',
'7',
'23',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0218',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'13',
'8',
'26',
'17',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0219',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'24',
'14',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0220',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'46',
'35',
'15',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0221',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'10',
'3',
'8',
'12',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0222',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'7',
'12',
'18',
'15',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0223',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'13',
'9 (1)',
'9',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0224',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'38',
'33',
'9',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0225',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'8',
'7',
'2',
'14',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0226',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'11',
'16',
'30',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0227',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'22',
'14',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0228',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'50',
'41',
'13',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0229',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'13',
'11',
'3',
'23',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0230',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'15',
'20',
'42',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0231',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'11',
'9',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0232',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'14',
'11',
'7',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0233',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'8',
'5',
'4',
'12',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0234',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'9',
'24',
'34',
'29',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0235',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'20',
'14',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0236',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'26',
'19',
'11',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0237',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'13',
'9',
'5',
'21',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0238',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'13',
'28',
'46',
'37',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0239',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'22',
'12',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0240',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'38',
'27',
'15',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0241',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'8',
'3',
'6',
'10',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0242',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'7',
'32',
'38',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0243',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'11',
'7',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0244',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'30',
'25',
'9',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0245',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'13',
'7',
'19',
'13 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0246',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'11',
'8',
'22',
'15',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0247',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'20',
'12',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0248',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'42',
'33',
'13',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0249',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'18',
'11',
'8',
'28',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0250',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'15',
'12',
'34',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0251',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'9',
'7',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0252',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'34',
'31',
'7',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0253',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'6',
'5',
'2',
'10',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0254',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'9',
'16',
'26',
'21',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0255',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'18',
'12',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0256',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'46',
'39',
'11',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0257',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'11',
'9',
'3',
'19',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0258',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'13',
'20',
'38',
'29',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0259',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'27',
'17',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0260',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'30',
'19',
'15',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0261',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'6',
'3',
'4',
'8',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0262',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'7',
'24',
'30',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0263',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'16',
'12',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0264',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'22',
'17',
'9',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0265',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'11',
'7',
'5',
'17',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0266',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'11',
'28',
'42',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0267',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'18',
'10',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0268',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'34',
'25',
'13',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0269',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'16',
'11',
'6',
'26',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0270',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'15',
'32',
'54',
'43',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0271',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'7',
'5 (1)',
'5',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0272',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'26',
'23',
'7',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0273',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'11',
'5',
'7',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0274',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'9',
'8',
'18',
'13',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0275',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'16',
'10',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0276',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'38',
'31',
'11',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0277',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'16',
'9',
'8',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0278',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'13',
'12',
'30',
'21',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0279',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'25',
'15',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0280',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'50',
'39',
'15',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0281',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'4',
'3',
'2',
'6',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0282',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'7',
'16',
'22',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0283',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'14',
'10',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0284',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'42',
'37',
'9',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0285',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'9',
'7',
'3',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0286',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'11',
'20',
'34',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0287',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'23',
'15',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0288',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'26',
'17',
'13',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0289',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'14',
'11',
'4',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0290',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'15',
'24',
'46',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0291',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'12',
'10',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0292',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'18',
'15',
'7',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0293',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'9',
'5',
'13',
'9 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0294',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'9',
'28',
'38',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0295',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'14',
'8',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0296',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'30',
'23',
'11',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0297',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'14',
'9',
'6',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0298',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'13',
'32',
'50',
'41',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0299',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'23',
'13',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MECHANICS_0300',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'42',
'31',
'15',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='MECHANICS';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0001',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'4',
'3',
'2',
'6',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0002',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'7',
'16',
'22',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0003',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'14',
'10',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0004',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'42',
'37',
'9',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0005',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'9',
'7',
'3',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0006',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'11',
'20',
'34',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0007',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'23',
'15',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0008',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'26',
'17',
'13',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0009',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'14',
'11',
'4',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0010',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'15',
'24',
'46',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0011',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'12',
'10',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0012',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'18',
'15',
'7',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0013',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'9',
'5',
'13',
'9 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0014',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'9',
'28',
'38',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0015',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'14',
'8',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0016',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'30',
'23',
'11',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0017',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'14',
'9',
'6',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0018',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'13',
'32',
'50',
'41',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0019',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'23',
'13',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0020',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'42',
'31',
'15',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0021',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'9',
'3',
'7',
'11',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0022',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'7',
'8',
'14',
'11',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0023',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'12',
'8',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0024',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'34',
'29',
'9',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0025',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'14',
'7',
'8',
'20',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0026',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'11',
'12',
'26',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0027',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'21',
'13',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0028',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'46',
'37',
'13',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0029',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'12',
'11',
'2',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0030',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'15',
'16',
'38',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0031',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'10',
'8',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0032',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'38',
'35',
'7',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0033',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'7',
'5',
'3',
'11',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0034',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'9',
'20',
'30',
'25',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0035',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'19',
'13 (1)',
'13',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0036',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'22',
'15',
'11',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0037',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'12',
'9',
'4',
'20',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0038',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'13',
'24',
'42',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0039',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'28',
'18',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0040',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'34',
'23',
'15',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0041',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'7',
'3',
'5',
'9',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0042',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'7',
'28',
'34',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0043',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'10',
'6',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0044',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'26',
'21',
'9',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0045',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'12',
'7',
'6',
'18',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0046',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'11',
'32',
'46',
'39',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0047',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'19',
'11',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0048',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'38',
'29',
'13',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0049',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'17',
'11',
'7',
'27',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0050',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'15',
'8',
'30',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0051',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'8',
'6',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0052',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'30',
'27',
'7',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0053',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'12',
'5',
'8',
'16',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0054',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'9',
'12',
'22',
'17',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0055',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'17',
'11',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0056',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'42',
'35',
'11',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0057',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'10',
'9',
'2',
'18',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0058',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'13',
'16',
'34',
'25',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0059',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'26',
'16',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0060',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'54',
'43',
'15',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0061',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'5',
'3',
'7',
'5 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0062',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'7',
'20',
'26',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0063',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'15',
'11',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0064',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'18',
'13',
'9',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0065',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'10',
'7',
'4',
'16',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0066',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'11',
'24',
'38',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0067',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'24',
'16',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0068',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'30',
'21',
'13',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0069',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'15',
'11',
'5',
'25',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0070',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'15',
'28',
'50',
'39',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0071',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'6',
'4',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0072',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'22',
'19',
'7',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0073',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'10',
'5',
'6',
'14',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0074',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'9',
'32',
'42',
'37',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0075',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'15',
'9',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0076',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'34',
'27',
'11',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0077',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'15',
'9',
'7',
'23',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0078',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'13',
'8',
'26',
'17',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0079',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'24',
'14',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0080',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'46',
'35',
'15',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0081',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'10',
'3',
'8',
'12',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0082',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'7',
'12',
'18',
'15',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0083',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'13',
'9 (1)',
'9',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0084',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'38',
'33',
'9',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0085',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'8',
'7',
'2',
'14',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0086',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'11',
'16',
'30',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0087',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'22',
'14',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0088',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'50',
'41',
'13',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0089',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'13',
'11',
'3',
'23',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0090',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'15',
'20',
'42',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0091',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'11',
'9',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0092',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'14',
'11',
'7',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0093',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'8',
'5',
'4',
'12',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0094',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'9',
'24',
'34',
'29',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0095',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'20',
'14',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0096',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'26',
'19',
'11',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0097',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'13',
'9',
'5',
'21',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0098',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'13',
'28',
'46',
'37',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0099',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'22',
'12',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0100',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'38',
'27',
'15',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0101',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'8',
'3',
'6',
'10',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0102',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'7',
'32',
'38',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0103',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'11',
'7',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0104',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'30',
'25',
'9',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0105',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'13',
'7',
'19',
'13 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0106',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'11',
'8',
'22',
'15',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0107',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'20',
'12',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0108',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'42',
'33',
'13',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0109',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'18',
'11',
'8',
'28',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0110',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'15',
'12',
'34',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0111',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'9',
'7',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0112',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'34',
'31',
'7',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0113',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'6',
'5',
'2',
'10',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0114',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'9',
'16',
'26',
'21',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0115',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'18',
'12',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0116',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'46',
'39',
'11',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0117',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'11',
'9',
'3',
'19',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0118',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'13',
'20',
'38',
'29',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0119',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'27',
'17',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0120',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'30',
'19',
'15',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0121',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'6',
'3',
'4',
'8',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0122',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'7',
'24',
'30',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0123',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'16',
'12',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0124',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'22',
'17',
'9',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0125',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'11',
'7',
'5',
'17',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0126',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'11',
'28',
'42',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0127',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'18',
'10',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0128',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'34',
'25',
'13',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0129',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'16',
'11',
'6',
'26',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0130',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'15',
'32',
'54',
'43',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0131',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'7',
'5 (1)',
'5',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0132',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'26',
'23',
'7',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0133',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'11',
'5',
'7',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0134',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'9',
'8',
'18',
'13',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0135',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'16',
'10',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0136',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'38',
'31',
'11',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0137',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'16',
'9',
'8',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0138',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'13',
'12',
'30',
'21',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0139',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'25',
'15',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0140',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'50',
'39',
'15',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0141',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'4',
'3',
'2',
'6',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0142',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'7',
'16',
'22',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0143',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'14',
'10',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0144',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'42',
'37',
'9',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0145',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'9',
'7',
'3',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0146',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'11',
'20',
'34',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0147',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'23',
'15',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0148',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'26',
'17',
'13',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0149',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'14',
'11',
'4',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0150',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'15',
'24',
'46',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0151',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'12',
'10',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0152',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'18',
'15',
'7',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0153',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'9',
'5',
'13',
'9 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0154',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'9',
'28',
'38',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0155',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'14',
'8',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0156',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'30',
'23',
'11',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0157',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'14',
'9',
'6',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0158',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'13',
'32',
'50',
'41',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0159',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'23',
'13',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0160',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'42',
'31',
'15',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0161',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'9',
'3',
'7',
'11',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0162',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'7',
'8',
'14',
'11',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0163',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'12',
'8',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0164',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'34',
'29',
'9',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0165',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'14',
'7',
'8',
'20',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0166',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'11',
'12',
'26',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0167',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'21',
'13',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0168',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'46',
'37',
'13',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0169',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'12',
'11',
'2',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0170',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'15',
'16',
'38',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0171',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'10',
'8',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0172',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'38',
'35',
'7',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0173',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'7',
'5',
'3',
'11',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0174',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'9',
'20',
'30',
'25',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0175',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'19',
'13 (1)',
'13',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0176',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'22',
'15',
'11',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0177',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'12',
'9',
'4',
'20',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0178',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'13',
'24',
'42',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0179',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'28',
'18',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0180',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'34',
'23',
'15',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0181',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'7',
'3',
'5',
'9',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0182',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'7',
'28',
'34',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0183',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'10',
'6',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0184',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'26',
'21',
'9',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0185',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'12',
'7',
'6',
'18',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0186',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'11',
'32',
'46',
'39',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0187',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'19',
'11',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0188',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'38',
'29',
'13',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0189',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'17',
'11',
'7',
'27',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0190',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'15',
'8',
'30',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0191',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'8',
'6',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0192',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'30',
'27',
'7',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0193',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'12',
'5',
'8',
'16',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0194',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'9',
'12',
'22',
'17',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0195',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'17',
'11',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0196',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'42',
'35',
'11',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0197',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'10',
'9',
'2',
'18',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0198',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'13',
'16',
'34',
'25',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0199',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'26',
'16',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0200',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'54',
'43',
'15',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0201',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'5',
'3',
'7',
'5 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0202',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'7',
'20',
'26',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0203',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'15',
'11',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0204',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'18',
'13',
'9',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0205',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'10',
'7',
'4',
'16',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0206',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'11',
'24',
'38',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0207',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'24',
'16',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0208',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'30',
'21',
'13',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0209',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'15',
'11',
'5',
'25',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0210',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'15',
'28',
'50',
'39',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0211',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'6',
'4',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0212',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'22',
'19',
'7',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0213',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'10',
'5',
'6',
'14',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0214',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'9',
'32',
'42',
'37',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0215',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'15',
'9',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0216',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'34',
'27',
'11',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0217',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'15',
'9',
'7',
'23',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0218',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'13',
'8',
'26',
'17',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0219',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'24',
'14',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0220',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'46',
'35',
'15',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0221',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'10',
'3',
'8',
'12',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0222',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'7',
'12',
'18',
'15',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0223',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'13',
'9 (1)',
'9',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0224',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'38',
'33',
'9',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0225',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'8',
'7',
'2',
'14',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0226',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'11',
'16',
'30',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0227',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'22',
'14',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0228',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'50',
'41',
'13',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0229',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'13',
'11',
'3',
'23',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0230',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'15',
'20',
'42',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0231',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'11',
'9',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0232',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'14',
'11',
'7',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0233',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'8',
'5',
'4',
'12',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0234',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'9',
'24',
'34',
'29',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0235',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'20',
'14',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0236',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'26',
'19',
'11',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0237',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'13',
'9',
'5',
'21',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0238',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'13',
'28',
'46',
'37',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0239',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'22',
'12',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0240',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'38',
'27',
'15',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0241',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'8',
'3',
'6',
'10',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0242',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'7',
'32',
'38',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0243',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'11',
'7',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0244',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'30',
'25',
'9',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0245',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'13',
'7',
'19',
'13 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0246',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'11',
'8',
'22',
'15',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0247',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'20',
'12',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0248',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'42',
'33',
'13',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0249',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'18',
'11',
'8',
'28',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0250',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'15',
'12',
'34',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0251',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'9',
'7',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0252',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'34',
'31',
'7',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0253',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'6',
'5',
'2',
'10',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0254',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'9',
'16',
'26',
'21',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0255',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'18',
'12',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0256',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'46',
'39',
'11',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0257',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'11',
'9',
'3',
'19',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0258',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'13',
'20',
'38',
'29',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0259',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'27',
'17',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0260',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'30',
'19',
'15',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0261',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'6',
'3',
'4',
'8',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0262',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'7',
'24',
'30',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0263',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'16',
'12',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0264',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'22',
'17',
'9',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0265',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'11',
'7',
'5',
'17',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0266',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'11',
'28',
'42',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0267',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'18',
'10',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0268',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'34',
'25',
'13',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0269',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'16',
'11',
'6',
'26',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0270',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'15',
'32',
'54',
'43',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0271',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'7',
'5 (1)',
'5',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0272',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'26',
'23',
'7',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0273',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'11',
'5',
'7',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0274',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'9',
'8',
'18',
'13',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0275',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'16',
'10',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0276',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'38',
'31',
'11',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0277',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'16',
'9',
'8',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0278',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'13',
'12',
'30',
'21',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0279',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'25',
'15',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0280',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'50',
'39',
'15',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0281',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'4',
'3',
'2',
'6',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0282',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'7',
'16',
'22',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0283',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'14',
'10',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0284',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'42',
'37',
'9',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0285',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'9',
'7',
'3',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0286',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'11',
'20',
'34',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0287',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'23',
'15',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0288',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'26',
'17',
'13',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0289',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'14',
'11',
'4',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0290',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'15',
'24',
'46',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0291',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'12',
'10',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0292',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'18',
'15',
'7',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0293',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'9',
'5',
'13',
'9 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0294',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'9',
'28',
'38',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0295',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'14',
'8',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0296',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'30',
'23',
'11',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0297',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'14',
'9',
'6',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0298',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'13',
'32',
'50',
'41',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0299',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'23',
'13',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WAVES_0300',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'42',
'31',
'15',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='WAVES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0001',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'4',
'3',
'2',
'6',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0002',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'7',
'16',
'22',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0003',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'14',
'10',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0004',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'42',
'37',
'9',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0005',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'9',
'7',
'3',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0006',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'11',
'20',
'34',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0007',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'23',
'15',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0008',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'26',
'17',
'13',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0009',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'14',
'11',
'4',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0010',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'15',
'24',
'46',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0011',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'12',
'10',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0012',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'18',
'15',
'7',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0013',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'9',
'5',
'13',
'9 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0014',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'9',
'28',
'38',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0015',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'14',
'8',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0016',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'30',
'23',
'11',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0017',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'14',
'9',
'6',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0018',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'13',
'32',
'50',
'41',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0019',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'23',
'13',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0020',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'42',
'31',
'15',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0021',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'9',
'3',
'7',
'11',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0022',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'7',
'8',
'14',
'11',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0023',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'12',
'8',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0024',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'34',
'29',
'9',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0025',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'14',
'7',
'8',
'20',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0026',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'11',
'12',
'26',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0027',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'21',
'13',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0028',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'46',
'37',
'13',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0029',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'12',
'11',
'2',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0030',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'15',
'16',
'38',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0031',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'10',
'8',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0032',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'38',
'35',
'7',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0033',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'7',
'5',
'3',
'11',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0034',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'9',
'20',
'30',
'25',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0035',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'19',
'13 (1)',
'13',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0036',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'22',
'15',
'11',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0037',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'12',
'9',
'4',
'20',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0038',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'13',
'24',
'42',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0039',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'28',
'18',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0040',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'34',
'23',
'15',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0041',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'7',
'3',
'5',
'9',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0042',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'7',
'28',
'34',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0043',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'10',
'6',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0044',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'26',
'21',
'9',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0045',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'12',
'7',
'6',
'18',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0046',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'11',
'32',
'46',
'39',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0047',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'19',
'11',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0048',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'38',
'29',
'13',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0049',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'17',
'11',
'7',
'27',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0050',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'15',
'8',
'30',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0051',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'8',
'6',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0052',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'30',
'27',
'7',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0053',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'12',
'5',
'8',
'16',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0054',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'9',
'12',
'22',
'17',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0055',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'17',
'11',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0056',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'42',
'35',
'11',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0057',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'10',
'9',
'2',
'18',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0058',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'13',
'16',
'34',
'25',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0059',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'26',
'16',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0060',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'54',
'43',
'15',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0061',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'5',
'3',
'7',
'5 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0062',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'7',
'20',
'26',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0063',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'15',
'11',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0064',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'18',
'13',
'9',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0065',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'10',
'7',
'4',
'16',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0066',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'11',
'24',
'38',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0067',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'24',
'16',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0068',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'30',
'21',
'13',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0069',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'15',
'11',
'5',
'25',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0070',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'15',
'28',
'50',
'39',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0071',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'6',
'4',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0072',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'22',
'19',
'7',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0073',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'10',
'5',
'6',
'14',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0074',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'9',
'32',
'42',
'37',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0075',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'15',
'9',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0076',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'34',
'27',
'11',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0077',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'15',
'9',
'7',
'23',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0078',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'13',
'8',
'26',
'17',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0079',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'24',
'14',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0080',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'46',
'35',
'15',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0081',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'10',
'3',
'8',
'12',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0082',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'7',
'12',
'18',
'15',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0083',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'13',
'9 (1)',
'9',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0084',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'38',
'33',
'9',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0085',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'8',
'7',
'2',
'14',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0086',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'11',
'16',
'30',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0087',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'22',
'14',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0088',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'50',
'41',
'13',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0089',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'13',
'11',
'3',
'23',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0090',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'15',
'20',
'42',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0091',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'11',
'9',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0092',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'14',
'11',
'7',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0093',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'8',
'5',
'4',
'12',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0094',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'9',
'24',
'34',
'29',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0095',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'20',
'14',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0096',
'easy',
'A body starts at 7 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'26',
'19',
'11',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0097',
'easy',
'A body starts at 8 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'13',
'9',
'5',
'21',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0098',
'easy',
'A body starts at 9 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'13',
'28',
'46',
'37',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0099',
'easy',
'A body starts at 10 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'22',
'12',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0100',
'easy',
'A body starts at 11 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'38',
'27',
'15',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0101',
'easy',
'A body starts at 2 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'8',
'3',
'6',
'10',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0102',
'easy',
'A body starts at 3 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'7',
'32',
'38',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0103',
'easy',
'A body starts at 4 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'11',
'7',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0104',
'easy',
'A body starts at 5 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'30',
'25',
'9',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0105',
'easy',
'A body starts at 6 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'13',
'7',
'19',
'13 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0106',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'11',
'8',
'22',
'15',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0107',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'20',
'12',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0108',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'42',
'33',
'13',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0109',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'18',
'11',
'8',
'28',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0110',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'15',
'12',
'34',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0111',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'9',
'7',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0112',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'34',
'31',
'7',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0113',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'6',
'5',
'2',
'10',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0114',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'9',
'16',
'26',
'21',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0115',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'18',
'12',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0116',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'46',
'39',
'11',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0117',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'11',
'9',
'3',
'19',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0118',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'13',
'20',
'38',
'29',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0119',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'27',
'17',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0120',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'30',
'19',
'15',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0121',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'6',
'3',
'4',
'8',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0122',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'7',
'24',
'30',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0123',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'16',
'12',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0124',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'22',
'17',
'9',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0125',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'11',
'7',
'5',
'17',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0126',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'11',
'28',
'42',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0127',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'18',
'10',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0128',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'34',
'25',
'13',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0129',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'16',
'11',
'6',
'26',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0130',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'15',
'32',
'54',
'43',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0131',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'7',
'5 (1)',
'5',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0132',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'26',
'23',
'7',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0133',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'11',
'5',
'7',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0134',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'9',
'8',
'18',
'13',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0135',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'16',
'10',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0136',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'38',
'31',
'11',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0137',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'16',
'9',
'8',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0138',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'13',
'12',
'30',
'21',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0139',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'25',
'15',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0140',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'50',
'39',
'15',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0141',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'4',
'3',
'2',
'6',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0142',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'7',
'16',
'22',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0143',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'14',
'10',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0144',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'42',
'37',
'9',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0145',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'9',
'7',
'3',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0146',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'11',
'20',
'34',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0147',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'23',
'15',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0148',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'26',
'17',
'13',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0149',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'14',
'11',
'4',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0150',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'15',
'24',
'46',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0151',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'12',
'10',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0152',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'18',
'15',
'7',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0153',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'9',
'5',
'13',
'9 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0154',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'9',
'28',
'38',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0155',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'14',
'8',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0156',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'30',
'23',
'11',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0157',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'14',
'9',
'6',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0158',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'13',
'32',
'50',
'41',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0159',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'23',
'13',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0160',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'42',
'31',
'15',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0161',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'9',
'3',
'7',
'11',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0162',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'7',
'8',
'14',
'11',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0163',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'12',
'8',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0164',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'34',
'29',
'9',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0165',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'14',
'7',
'8',
'20',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0166',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'11',
'12',
'26',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0167',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'21',
'13',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0168',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'46',
'37',
'13',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0169',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'12',
'11',
'2',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0170',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'15',
'16',
'38',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0171',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'10',
'8',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0172',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'38',
'35',
'7',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0173',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'7',
'5',
'3',
'11',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0174',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'9',
'20',
'30',
'25',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0175',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'19',
'13 (1)',
'13',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0176',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'22',
'15',
'11',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0177',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'12',
'9',
'4',
'20',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0178',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'13',
'24',
'42',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0179',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'28',
'18',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0180',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'34',
'23',
'15',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0181',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'7',
'3',
'5',
'9',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0182',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'7',
'28',
'34',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0183',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'10',
'6',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0184',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'26',
'21',
'9',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0185',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'12',
'7',
'6',
'18',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0186',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'11',
'32',
'46',
'39',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0187',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'19',
'11',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0188',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'38',
'29',
'13',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0189',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'17',
'11',
'7',
'27',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0190',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'15',
'8',
'30',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0191',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'8',
'6',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0192',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'30',
'27',
'7',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0193',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'12',
'5',
'8',
'16',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0194',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'9',
'12',
'22',
'17',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0195',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'17',
'11',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0196',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'42',
'35',
'11',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0197',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'10',
'9',
'2',
'18',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0198',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'13',
'16',
'34',
'25',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0199',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'26',
'16',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0200',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'54',
'43',
'15',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0201',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'5',
'3',
'7',
'5 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0202',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'7',
'20',
'26',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0203',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'15',
'11',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0204',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'18',
'13',
'9',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0205',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'10',
'7',
'4',
'16',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0206',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'11',
'24',
'38',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0207',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'24',
'16',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0208',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'30',
'21',
'13',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0209',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'15',
'11',
'5',
'25',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0210',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'15',
'28',
'50',
'39',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0211',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'6',
'4',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0212',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'22',
'19',
'7',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0213',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'10',
'5',
'6',
'14',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0214',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'9',
'32',
'42',
'37',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0215',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'15',
'9',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0216',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'34',
'27',
'11',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0217',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'15',
'9',
'7',
'23',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0218',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'13',
'8',
'26',
'17',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0219',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'24',
'14',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0220',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'46',
'35',
'15',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0221',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'10',
'3',
'8',
'12',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0222',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'7',
'12',
'18',
'15',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0223',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'13',
'9 (1)',
'9',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0224',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'38',
'33',
'9',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0225',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'8',
'7',
'2',
'14',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0226',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'11',
'16',
'30',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0227',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'22',
'14',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0228',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'50',
'41',
'13',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0229',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'13',
'11',
'3',
'23',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0230',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'15',
'20',
'42',
'31',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0231',
'medium',
'A body starts at 2 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'11',
'9',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0232',
'medium',
'A body starts at 3 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'14',
'11',
'7',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0233',
'medium',
'A body starts at 4 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'8',
'5',
'4',
'12',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0234',
'medium',
'A body starts at 5 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'9',
'24',
'34',
'29',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0235',
'medium',
'A body starts at 6 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'20',
'14',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0236',
'medium',
'A body starts at 7 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'26',
'19',
'11',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0237',
'medium',
'A body starts at 8 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'13',
'9',
'5',
'21',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0238',
'medium',
'A body starts at 9 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'13',
'28',
'46',
'37',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0239',
'medium',
'A body starts at 10 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'22',
'12',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0240',
'medium',
'A body starts at 11 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'38',
'27',
'15',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0241',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'8',
'3',
'6',
'10',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0242',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'7',
'32',
'38',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0243',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'11',
'7',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0244',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'30',
'25',
'9',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0245',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'13',
'7',
'19',
'13 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0246',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'11',
'8',
'22',
'15',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0247',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'20',
'12',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0248',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'42',
'33',
'13',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0249',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'18',
'11',
'8',
'28',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0250',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'15',
'12',
'34',
'23',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0251',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'9',
'7',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0252',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'34',
'31',
'7',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0253',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'6',
'5',
'2',
'10',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0254',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'9',
'16',
'26',
'21',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0255',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'18',
'12',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0256',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'46',
'39',
'11',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0257',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'11',
'9',
'3',
'19',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0258',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'13',
'20',
'38',
'29',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0259',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'27',
'17',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0260',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'30',
'19',
'15',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0261',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'6',
'3',
'4',
'8',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0262',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'7',
'24',
'30',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0263',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'16',
'12',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0264',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'22',
'17',
'9',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0265',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'11',
'7',
'5',
'17',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0266',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'11',
'28',
'42',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0267',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'18',
'10',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0268',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'34',
'25',
'13',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0269',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'16',
'11',
'6',
'26',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0270',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'15',
'32',
'54',
'43',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0271',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'7',
'5 (1)',
'5',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0272',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'26',
'23',
'7',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0273',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'11',
'5',
'7',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0274',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'9',
'8',
'18',
'13',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0275',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'4',
'16',
'10',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0276',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'38',
'31',
'11',
'24',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0277',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'16',
'9',
'8',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0278',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'13',
'12',
'30',
'21',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0279',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'5',
'25',
'15',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0280',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'50',
'39',
'15',
'28',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0281',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'4',
'3',
'2',
'6',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0282',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'7',
'16',
'22',
'19',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0283',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'6',
'14',
'10',
'5',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0284',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'42',
'37',
'9',
'32',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0285',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'9',
'7',
'3',
'15',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0286',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'11',
'20',
'34',
'27',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0287',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 7 s. What is its final speed?',
'7',
'23',
'15',
'9',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0288',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 2 s. What is its final speed?',
'26',
'17',
'13',
'8',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0289',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 4 s. What is its final speed?',
'14',
'11',
'4',
'24',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0290',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 6 s. What is its final speed?',
'15',
'24',
'46',
'35',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0291',
'challenge',
'A body starts at 2 m/s and accelerates at 1 m/s² for 8 s. What is its final speed?',
'8',
'12',
'10',
'3',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0292',
'challenge',
'A body starts at 3 m/s and accelerates at 4 m/s² for 3 s. What is its final speed?',
'18',
'15',
'7',
'12',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0293',
'challenge',
'A body starts at 4 m/s and accelerates at 1 m/s² for 5 s. What is its final speed?',
'9',
'5',
'13',
'9 (1)',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0294',
'challenge',
'A body starts at 5 m/s and accelerates at 4 m/s² for 7 s. What is its final speed?',
'9',
'28',
'38',
'33',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0295',
'challenge',
'A body starts at 6 m/s and accelerates at 1 m/s² for 2 s. What is its final speed?',
'2',
'14',
'8',
'7',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0296',
'challenge',
'A body starts at 7 m/s and accelerates at 4 m/s² for 4 s. What is its final speed?',
'30',
'23',
'11',
'16',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0297',
'challenge',
'A body starts at 8 m/s and accelerates at 1 m/s² for 6 s. What is its final speed?',
'14',
'9',
'6',
'22',
'A',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0298',
'challenge',
'A body starts at 9 m/s and accelerates at 4 m/s² for 8 s. What is its final speed?',
'13',
'32',
'50',
'41',
'D',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0299',
'challenge',
'A body starts at 10 m/s and accelerates at 1 m/s² for 3 s. What is its final speed?',
'3',
'23',
'13',
'11',
'C',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRICITY_0300',
'challenge',
'A body starts at 11 m/s and accelerates at 4 m/s² for 5 s. What is its final speed?',
'42',
'31',
'15',
'20',
'B',
'Use v=u+at.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS'
  AND st.subtopic_code='ELECTRICITY';

