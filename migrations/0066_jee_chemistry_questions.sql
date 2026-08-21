-- GENERATED ORIGINAL PRACTICE BANK
PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO education_subjects
(country_code, grade_code, subject_code, subject_name, enabled, sort_order)
VALUES ('IN','PROGRAM_JEE','CHEMISTRY','JEE Chemistry',1,10);

INSERT OR IGNORE INTO education_topics
(subject_id, topic_code, topic_name, enabled, sort_order)
SELECT id,'CHEMISTRY','Chemistry',1,10
FROM education_subjects
WHERE country_code='IN' AND grade_code='PROGRAM_JEE' AND subject_code='CHEMISTRY';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'MOLES','Mole Concept',1,10
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'PHYSICAL','Physical Chemistry',1,20
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'INORGANIC','Inorganic Chemistry',1,30
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY';

INSERT OR IGNORE INTO education_subtopics
(topic_id, subtopic_code, subtopic_name, enabled, sort_order)
SELECT t.id,'ORGANIC','Organic Chemistry',1,40
FROM education_topics t
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0001',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0002',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0003',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0004',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0005',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0006',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0007',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0008',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0009',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0010',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0011',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0012',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0013',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0014',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0015',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0016',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0017',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0018',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0019',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0020',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0021',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0022',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0023',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0024',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0025',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0026',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0027',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0028',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0029',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0030',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0031',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0032',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0033',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0034',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0035',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0036',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0037',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0038',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0039',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0040',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0041',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0042',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0043',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0044',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0045',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0046',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0047',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0048',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0049',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0050',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0051',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0052',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0053',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0054',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0055',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0056',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0057',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0058',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0059',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0060',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0061',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0062',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0063',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0064',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0065',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0066',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0067',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0068',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0069',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0070',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0071',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0072',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0073',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0074',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0075',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0076',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0077',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0078',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0079',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0080',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0081',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0082',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0083',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0084',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0085',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0086',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0087',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0088',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0089',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0090',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0091',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0092',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0093',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0094',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0095',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0096',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0097',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0098',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0099',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0100',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0101',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0102',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0103',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0104',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0105',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0106',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0107',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0108',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0109',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0110',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0111',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0112',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0113',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0114',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0115',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0116',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0117',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0118',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0119',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0120',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0121',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0122',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0123',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0124',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0125',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0126',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0127',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0128',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0129',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0130',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0131',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0132',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0133',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0134',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0135',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0136',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0137',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0138',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0139',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0140',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0141',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0142',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0143',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0144',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0145',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0146',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0147',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0148',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0149',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0150',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0151',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0152',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0153',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0154',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0155',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0156',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0157',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0158',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0159',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0160',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0161',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0162',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0163',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0164',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0165',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0166',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0167',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0168',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0169',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0170',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0171',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0172',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0173',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0174',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0175',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0176',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0177',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0178',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0179',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0180',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0181',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0182',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0183',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0184',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0185',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0186',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0187',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0188',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0189',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0190',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0191',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0192',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0193',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0194',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0195',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0196',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0197',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0198',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0199',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0200',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0201',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0202',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0203',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0204',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0205',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0206',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0207',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0208',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0209',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0210',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0211',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0212',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0213',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0214',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0215',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0216',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0217',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0218',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0219',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0220',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0221',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0222',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0223',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0224',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0225',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0226',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0227',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0228',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0229',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0230',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0231',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0232',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0233',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0234',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0235',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0236',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0237',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0238',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0239',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0240',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0241',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0242',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0243',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0244',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0245',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0246',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0247',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0248',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0249',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0250',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0251',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0252',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0253',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0254',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0255',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0256',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0257',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0258',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0259',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0260',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0261',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0262',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0263',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0264',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0265',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0266',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0267',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0268',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0269',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0270',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0271',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0272',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0273',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0274',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0275',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0276',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0277',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0278',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0279',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0280',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0281',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0282',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0283',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0284',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0285',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0286',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0287',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0288',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0289',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0290',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0291',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0292',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0293',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0294',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0295',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0296',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0297',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0298',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0299',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_MOLES_0300',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='MOLES';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0001',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0002',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0003',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0004',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0005',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0006',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0007',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0008',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0009',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0010',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0011',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0012',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0013',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0014',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0015',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0016',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0017',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0018',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0019',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0020',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0021',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0022',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0023',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0024',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0025',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0026',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0027',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0028',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0029',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0030',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0031',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0032',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0033',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0034',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0035',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0036',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0037',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0038',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0039',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0040',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0041',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0042',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0043',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0044',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0045',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0046',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0047',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0048',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0049',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0050',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0051',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0052',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0053',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0054',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0055',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0056',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0057',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0058',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0059',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0060',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0061',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0062',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0063',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0064',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0065',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0066',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0067',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0068',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0069',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0070',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0071',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0072',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0073',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0074',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0075',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0076',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0077',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0078',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0079',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0080',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0081',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0082',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0083',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0084',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0085',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0086',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0087',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0088',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0089',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0090',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0091',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0092',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0093',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0094',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0095',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0096',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0097',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0098',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0099',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0100',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0101',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0102',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0103',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0104',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0105',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0106',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0107',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0108',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0109',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0110',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0111',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0112',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0113',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0114',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0115',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0116',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0117',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0118',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0119',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0120',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0121',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0122',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0123',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0124',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0125',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0126',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0127',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0128',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0129',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0130',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0131',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0132',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0133',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0134',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0135',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0136',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0137',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0138',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0139',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0140',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0141',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0142',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0143',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0144',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0145',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0146',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0147',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0148',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0149',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0150',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0151',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0152',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0153',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0154',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0155',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0156',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0157',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0158',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0159',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0160',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0161',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0162',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0163',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0164',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0165',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0166',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0167',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0168',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0169',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0170',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0171',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0172',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0173',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0174',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0175',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0176',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0177',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0178',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0179',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0180',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0181',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0182',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0183',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0184',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0185',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0186',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0187',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0188',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0189',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0190',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0191',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0192',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0193',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0194',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0195',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0196',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0197',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0198',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0199',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0200',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0201',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0202',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0203',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0204',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0205',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0206',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0207',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0208',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0209',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0210',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0211',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0212',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0213',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0214',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0215',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0216',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0217',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0218',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0219',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0220',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0221',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0222',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0223',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0224',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0225',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0226',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0227',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0228',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0229',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0230',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0231',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0232',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0233',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0234',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0235',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0236',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0237',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0238',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0239',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0240',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0241',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0242',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0243',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0244',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0245',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0246',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0247',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0248',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0249',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0250',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0251',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0252',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0253',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0254',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0255',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0256',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0257',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0258',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0259',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0260',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0261',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0262',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0263',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0264',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0265',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0266',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0267',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0268',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0269',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0270',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0271',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0272',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0273',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0274',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0275',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0276',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0277',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0278',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0279',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0280',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0281',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0282',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0283',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0284',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0285',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0286',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0287',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0288',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0289',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0290',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0291',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0292',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0293',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0294',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0295',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0296',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0297',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0298',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0299',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_PHYSICAL_0300',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='PHYSICAL';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0001',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0002',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0003',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0004',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0005',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0006',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0007',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0008',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0009',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0010',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0011',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0012',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0013',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0014',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0015',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0016',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0017',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0018',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0019',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0020',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0021',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0022',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0023',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0024',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0025',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0026',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0027',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0028',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0029',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0030',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0031',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0032',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0033',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0034',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0035',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0036',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0037',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0038',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0039',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0040',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0041',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0042',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0043',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0044',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0045',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0046',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0047',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0048',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0049',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0050',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0051',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0052',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0053',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0054',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0055',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0056',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0057',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0058',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0059',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0060',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0061',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0062',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0063',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0064',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0065',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0066',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0067',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0068',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0069',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0070',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0071',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0072',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0073',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0074',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0075',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0076',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0077',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0078',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0079',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0080',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0081',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0082',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0083',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0084',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0085',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0086',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0087',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0088',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0089',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0090',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0091',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0092',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0093',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0094',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0095',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0096',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0097',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0098',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0099',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0100',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0101',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0102',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0103',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0104',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0105',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0106',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0107',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0108',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0109',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0110',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0111',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0112',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0113',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0114',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0115',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0116',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0117',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0118',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0119',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0120',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0121',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0122',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0123',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0124',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0125',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0126',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0127',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0128',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0129',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0130',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0131',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0132',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0133',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0134',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0135',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0136',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0137',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0138',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0139',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0140',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0141',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0142',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0143',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0144',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0145',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0146',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0147',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0148',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0149',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0150',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0151',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0152',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0153',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0154',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0155',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0156',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0157',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0158',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0159',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0160',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0161',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0162',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0163',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0164',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0165',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0166',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0167',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0168',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0169',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0170',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0171',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0172',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0173',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0174',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0175',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0176',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0177',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0178',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0179',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0180',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0181',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0182',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0183',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0184',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0185',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0186',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0187',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0188',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0189',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0190',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0191',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0192',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0193',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0194',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0195',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0196',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0197',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0198',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0199',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0200',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0201',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0202',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0203',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0204',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0205',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0206',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0207',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0208',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0209',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0210',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0211',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0212',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0213',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0214',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0215',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0216',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0217',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0218',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0219',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0220',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0221',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0222',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0223',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0224',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0225',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0226',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0227',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0228',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0229',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0230',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0231',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0232',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0233',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0234',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0235',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0236',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0237',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0238',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0239',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0240',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0241',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0242',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0243',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0244',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0245',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0246',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0247',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0248',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0249',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0250',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0251',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0252',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0253',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0254',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0255',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0256',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0257',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0258',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0259',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0260',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0261',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0262',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0263',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0264',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0265',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0266',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0267',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0268',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0269',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0270',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0271',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0272',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0273',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0274',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0275',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0276',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0277',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0278',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0279',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0280',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0281',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0282',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0283',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0284',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0285',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0286',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0287',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0288',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0289',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0290',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0291',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0292',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0293',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0294',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0295',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0296',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0297',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0298',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0299',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_INORGANIC_0300',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='INORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0001',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0002',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0003',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0004',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0005',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0006',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0007',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0008',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0009',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0010',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0011',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0012',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0013',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0014',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0015',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0016',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0017',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0018',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0019',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0020',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0021',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0022',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0023',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0024',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0025',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0026',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0027',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0028',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0029',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0030',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0031',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0032',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0033',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0034',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0035',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0036',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0037',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0038',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0039',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0040',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0041',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0042',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0043',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0044',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0045',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0046',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0047',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0048',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0049',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0050',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0051',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0052',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0053',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0054',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0055',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0056',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0057',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0058',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0059',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0060',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0061',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0062',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0063',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0064',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0065',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0066',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0067',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0068',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0069',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0070',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0071',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0072',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0073',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0074',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0075',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0076',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0077',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0078',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0079',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0080',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0081',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0082',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0083',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0084',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0085',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0086',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0087',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0088',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0089',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0090',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0091',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0092',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0093',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0094',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0095',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0096',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0097',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0098',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0099',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0100',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0101',
'easy',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0102',
'easy',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0103',
'easy',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0104',
'easy',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0105',
'easy',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0106',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0107',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0108',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0109',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0110',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0111',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0112',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0113',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0114',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0115',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0116',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0117',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0118',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0119',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0120',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0121',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0122',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0123',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0124',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0125',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0126',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0127',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0128',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0129',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0130',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0131',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0132',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0133',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0134',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0135',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0136',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0137',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0138',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0139',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0140',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0141',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0142',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0143',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0144',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0145',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0146',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0147',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0148',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0149',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0150',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0151',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0152',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0153',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0154',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0155',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0156',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0157',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0158',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0159',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0160',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0161',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0162',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0163',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0164',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0165',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0166',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0167',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0168',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0169',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0170',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0171',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0172',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0173',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0174',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0175',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0176',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0177',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0178',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0179',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0180',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0181',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0182',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0183',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0184',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0185',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0186',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0187',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0188',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0189',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0190',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0191',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0192',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0193',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0194',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0195',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0196',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0197',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0198',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0199',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0200',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0201',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0202',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0203',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0204',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0205',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0206',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0207',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0208',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0209',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0210',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0211',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0212',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0213',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0214',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0215',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0216',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0217',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0218',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0219',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0220',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0221',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0222',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0223',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0224',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0225',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0226',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0227',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0228',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0229',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0230',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0231',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0232',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0233',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0234',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0235',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0236',
'medium',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0237',
'medium',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0238',
'medium',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0239',
'medium',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0240',
'medium',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0241',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0242',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0243',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0244',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0245',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0246',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0247',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0248',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0249',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0250',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0251',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0252',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0253',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0254',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0255',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0256',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0257',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0258',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0259',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0260',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0261',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0262',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0263',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0264',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0265',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0266',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0267',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0268',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0269',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0270',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0271',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0272',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0273',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0274',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0275',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0276',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0277',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0278',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0279',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0280',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0281',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol',
'2 mol',
'0.5 mol',
'1 mol (1)',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0282',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'4 mol',
'1.0 mol',
'1 mol',
'2 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0283',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1.5 mol',
'1 mol',
'3 mol',
'6 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0284',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'1 mol',
'4 mol',
'8 mol',
'2.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0285',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'5 mol',
'10 mol',
'2.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0286',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'2 mol',
'0.5 mol',
'1 mol (1)',
'1 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0287',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1.0 mol',
'1 mol',
'2 mol',
'4 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0288',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'1 mol',
'3 mol',
'6 mol',
'1.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0289',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'4 mol',
'8 mol',
'2.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0290',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'10 mol',
'2.5 mol',
'1 mol',
'5 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0291',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'0.5 mol',
'1 mol (1)',
'1 mol',
'2 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0292',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'1 mol',
'2 mol',
'4 mol',
'1.0 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0293',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'3 mol',
'6 mol',
'1.5 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0294',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'8 mol',
'2.0 mol',
'1 mol',
'4 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0295',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'2.5 mol',
'1 mol',
'5 mol',
'10 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0296',
'challenge',
'How many moles of atoms are in 1 mol of a monatomic element?',
'1 mol (1)',
'1 mol',
'2 mol',
'0.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0297',
'challenge',
'How many moles of atoms are in 2 mol of a monatomic element?',
'2 mol',
'4 mol',
'1.0 mol',
'1 mol',
'A',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0298',
'challenge',
'How many moles of atoms are in 3 mol of a monatomic element?',
'6 mol',
'1.5 mol',
'1 mol',
'3 mol',
'D',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0299',
'challenge',
'How many moles of atoms are in 4 mol of a monatomic element?',
'2.0 mol',
'1 mol',
'4 mol',
'8 mol',
'C',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_CHEMISTRY_ORGANIC_0300',
'challenge',
'How many moles of atoms are in 5 mol of a monatomic element?',
'1 mol',
'5 mol',
'10 mol',
'2.5 mol',
'B',
'For a monatomic element, moles of atoms equal moles of element.',
1,
'generated-original'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_JEE'
  AND s.subject_code='CHEMISTRY'
  AND t.topic_code='CHEMISTRY'
  AND st.subtopic_code='ORGANIC';

