-- GYAN IIT-JEE bank expansion - PHYSICS
-- 0080_jee_physics_bank_006_025.sql
-- Adds questions 006..025 for each topic.
-- Fixed Mock/Mini mappings are NOT changed.
PRAGMA foreign_keys = ON;

-- UNITS_MEASUREMENTS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_006', 'medium', 'The SI unit of force is:',
'pascal', 'joule', 'watt', 'newton',
'D', 'Force is measured in newtons (N).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_007', 'medium', 'Quick check — The SI unit of force is:',
'joule', 'pascal', 'newton', 'watt',
'C', 'Force is measured in newtons (N).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_008', 'medium', 'JEE concept check — The SI unit of force is:',
'watt', 'newton', 'joule', 'pascal',
'B', 'Force is measured in newtons (N).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_009', 'medium', 'Choose the best answer — The SI unit of force is:',
'watt', 'joule', 'newton', 'pascal',
'C', 'Force is measured in newtons (N).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_010', 'medium', 'The dimensional formula of velocity is:',
'L^2 T^-1', 'M L T^-1', 'L T^-2', 'L T^-1',
'D', 'Velocity is length per time.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_011', 'medium', 'Quick check — The dimensional formula of velocity is:',
'L T^-2', 'L^2 T^-1', 'M L T^-1', 'L T^-1',
'D', 'Velocity is length per time.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_012', 'medium', 'JEE concept check — The dimensional formula of velocity is:',
'L^2 T^-1', 'M L T^-1', 'L T^-1', 'L T^-2',
'C', 'Velocity is length per time.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_013', 'medium', 'Choose the best answer — The dimensional formula of velocity is:',
'L T^-1', 'L T^-2', 'M L T^-1', 'L^2 T^-1',
'A', 'Velocity is length per time.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_014', 'medium', 'The dimensional formula of acceleration is:',
'L T^-2', 'L T^-1', 'M L T^-2', 'T^-2',
'A', 'Acceleration is change of velocity per time.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_015', 'medium', 'Quick check — The dimensional formula of acceleration is:',
'M L T^-2', 'L T^-1', 'L T^-2', 'T^-2',
'C', 'Acceleration is change of velocity per time.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_016', 'medium', 'JEE concept check — The dimensional formula of acceleration is:',
'M L T^-2', 'L T^-1', 'L T^-2', 'T^-2',
'C', 'Acceleration is change of velocity per time.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_017', 'medium', 'Choose the best answer — The dimensional formula of acceleration is:',
'L T^-2', 'L T^-1', 'M L T^-2', 'T^-2',
'A', 'Acceleration is change of velocity per time.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_018', 'challenge', 'The SI unit of power is:',
'watt', 'newton', 'coulomb', 'joule',
'A', 'Power is measured in watts.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_019', 'challenge', 'Quick check — The SI unit of power is:',
'newton', 'joule', 'coulomb', 'watt',
'D', 'Power is measured in watts.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_020', 'challenge', 'JEE concept check — The SI unit of power is:',
'joule', 'coulomb', 'watt', 'newton',
'C', 'Power is measured in watts.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_021', 'challenge', 'Choose the best answer — The SI unit of power is:',
'newton', 'joule', 'watt', 'coulomb',
'C', 'Power is measured in watts.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_022', 'challenge', 'The number of significant figures in 0.00450 is:',
'2', '3', '4', '5',
'B', 'Leading zeros are not significant; trailing zero after decimal is significant.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_023', 'challenge', 'Quick check — The number of significant figures in 0.00450 is:',
'5', '3', '2', '4',
'B', 'Leading zeros are not significant; trailing zero after decimal is significant.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_024', 'challenge', 'JEE concept check — The number of significant figures in 0.00450 is:',
'5', '2', '3', '4',
'C', 'Leading zeros are not significant; trailing zero after decimal is significant.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_025', 'challenge', 'Choose the best answer — The number of significant figures in 0.00450 is:',
'2', '3', '5', '4',
'B', 'Leading zeros are not significant; trailing zero after decimal is significant.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='UNITS_MEASUREMENTS' AND st.subtopic_code='UNITS_MEASUREMENTS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'UNITS_MEASUREMENTS_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_UNITS_MEASUREMENTS_025';

-- KINEMATICS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_006', 'medium', 'For constant acceleration, final velocity is given by:',
'v=u-at²', 'v=u+at', 'v=ut+a', 'v²=u+2as',
'B', 'The first equation of motion is v=u+at.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_007', 'medium', 'Quick check — For constant acceleration, final velocity is given by:',
'v=u-at²', 'v²=u+2as', 'v=ut+a', 'v=u+at',
'D', 'The first equation of motion is v=u+at.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_008', 'medium', 'JEE concept check — For constant acceleration, final velocity is given by:',
'v=u+at', 'v²=u+2as', 'v=ut+a', 'v=u-at²',
'A', 'The first equation of motion is v=u+at.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_009', 'medium', 'Choose the best answer — For constant acceleration, final velocity is given by:',
'v²=u+2as', 'v=u-at²', 'v=u+at', 'v=ut+a',
'C', 'The first equation of motion is v=u+at.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_010', 'medium', 'The slope of a displacement-time graph gives:',
'momentum', 'velocity', 'force', 'acceleration',
'B', 'ds/dt is velocity.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_011', 'medium', 'Quick check — The slope of a displacement-time graph gives:',
'momentum', 'acceleration', 'force', 'velocity',
'D', 'ds/dt is velocity.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_012', 'medium', 'JEE concept check — The slope of a displacement-time graph gives:',
'momentum', 'acceleration', 'force', 'velocity',
'D', 'ds/dt is velocity.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_013', 'medium', 'Choose the best answer — The slope of a displacement-time graph gives:',
'acceleration', 'momentum', 'velocity', 'force',
'C', 'ds/dt is velocity.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_014', 'medium', 'The slope of a velocity-time graph gives:',
'mass', 'acceleration', 'displacement', 'power',
'B', 'dv/dt is acceleration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_015', 'medium', 'Quick check — The slope of a velocity-time graph gives:',
'power', 'displacement', 'acceleration', 'mass',
'C', 'dv/dt is acceleration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_016', 'medium', 'JEE concept check — The slope of a velocity-time graph gives:',
'acceleration', 'power', 'mass', 'displacement',
'A', 'dv/dt is acceleration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_017', 'medium', 'Choose the best answer — The slope of a velocity-time graph gives:',
'acceleration', 'mass', 'power', 'displacement',
'A', 'dv/dt is acceleration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_018', 'challenge', 'The area under a velocity-time graph gives:',
'jerk', 'displacement', 'acceleration', 'force',
'B', 'Integral of velocity over time is displacement.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_019', 'challenge', 'Quick check — The area under a velocity-time graph gives:',
'force', 'displacement', 'acceleration', 'jerk',
'B', 'Integral of velocity over time is displacement.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_020', 'challenge', 'JEE concept check — The area under a velocity-time graph gives:',
'force', 'acceleration', 'jerk', 'displacement',
'D', 'Integral of velocity over time is displacement.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_021', 'challenge', 'Choose the best answer — The area under a velocity-time graph gives:',
'jerk', 'acceleration', 'force', 'displacement',
'D', 'Integral of velocity over time is displacement.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_022', 'challenge', 'At the highest point of vertical upward motion, instantaneous velocity is:',
'maximum upward', 'infinite', 'zero', 'equal to g',
'C', 'Velocity becomes zero momentarily at the top.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_023', 'challenge', 'Quick check — At the highest point of vertical upward motion, instantaneous velocity is:',
'infinite', 'equal to g', 'zero', 'maximum upward',
'C', 'Velocity becomes zero momentarily at the top.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_024', 'challenge', 'JEE concept check — At the highest point of vertical upward motion, instantaneous velocity is:',
'equal to g', 'maximum upward', 'infinite', 'zero',
'D', 'Velocity becomes zero momentarily at the top.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINEMATICS_025', 'challenge', 'Choose the best answer — At the highest point of vertical upward motion, instantaneous velocity is:',
'zero', 'infinite', 'equal to g', 'maximum upward',
'A', 'Velocity becomes zero momentarily at the top.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINEMATICS' AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINEMATICS_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINEMATICS_025';

-- LAWS_OF_MOTION
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_006', 'medium', 'Newton''s second law in simple form is:',
'F=a/m', 'F=mv', 'F=ma', 'F=m/a',
'C', 'Net force equals mass times acceleration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_007', 'medium', 'Quick check — Newton''s second law in simple form is:',
'F=mv', 'F=m/a', 'F=a/m', 'F=ma',
'D', 'Net force equals mass times acceleration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_008', 'medium', 'JEE concept check — Newton''s second law in simple form is:',
'F=m/a', 'F=a/m', 'F=ma', 'F=mv',
'C', 'Net force equals mass times acceleration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_009', 'medium', 'Choose the best answer — Newton''s second law in simple form is:',
'F=ma', 'F=mv', 'F=a/m', 'F=m/a',
'A', 'Net force equals mass times acceleration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_010', 'medium', 'Inertia is the tendency of a body to resist change in its:',
'mass', 'charge', 'temperature', 'state of motion',
'D', 'Inertia resists acceleration/change of velocity.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_011', 'medium', 'Quick check — Inertia is the tendency of a body to resist change in its:',
'mass', 'temperature', 'state of motion', 'charge',
'C', 'Inertia resists acceleration/change of velocity.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_012', 'medium', 'JEE concept check — Inertia is the tendency of a body to resist change in its:',
'mass', 'temperature', 'state of motion', 'charge',
'C', 'Inertia resists acceleration/change of velocity.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_013', 'medium', 'Choose the best answer — Inertia is the tendency of a body to resist change in its:',
'mass', 'state of motion', 'charge', 'temperature',
'B', 'Inertia resists acceleration/change of velocity.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_014', 'medium', 'Action and reaction forces act on:',
'only fixed bodies', 'no bodies', 'different bodies', 'the same body',
'C', 'Newton''s third-law pair acts on different interacting bodies.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_015', 'medium', 'Quick check — Action and reaction forces act on:',
'different bodies', 'only fixed bodies', 'the same body', 'no bodies',
'A', 'Newton''s third-law pair acts on different interacting bodies.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_016', 'medium', 'JEE concept check — Action and reaction forces act on:',
'only fixed bodies', 'the same body', 'no bodies', 'different bodies',
'D', 'Newton''s third-law pair acts on different interacting bodies.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_017', 'medium', 'Choose the best answer — Action and reaction forces act on:',
'no bodies', 'different bodies', 'only fixed bodies', 'the same body',
'B', 'Newton''s third-law pair acts on different interacting bodies.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_018', 'challenge', 'Limiting friction is proportional to:',
'mass density', 'normal reaction', 'velocity always', 'area always',
'B', 'At the limiting condition f=μN.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_019', 'challenge', 'Quick check — Limiting friction is proportional to:',
'area always', 'velocity always', 'mass density', 'normal reaction',
'D', 'At the limiting condition f=μN.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_020', 'challenge', 'JEE concept check — Limiting friction is proportional to:',
'area always', 'mass density', 'velocity always', 'normal reaction',
'D', 'At the limiting condition f=μN.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_021', 'challenge', 'Choose the best answer — Limiting friction is proportional to:',
'mass density', 'normal reaction', 'velocity always', 'area always',
'B', 'At the limiting condition f=μN.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_022', 'challenge', 'The SI unit of impulse is equivalent to:',
'N/s', 'N·s', 'J/s', 'kg/s',
'B', 'Impulse equals change in momentum.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_023', 'challenge', 'Quick check — The SI unit of impulse is equivalent to:',
'J/s', 'N·s', 'N/s', 'kg/s',
'B', 'Impulse equals change in momentum.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_024', 'challenge', 'JEE concept check — The SI unit of impulse is equivalent to:',
'N/s', 'J/s', 'N·s', 'kg/s',
'C', 'Impulse equals change in momentum.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_025', 'challenge', 'Choose the best answer — The SI unit of impulse is equivalent to:',
'kg/s', 'J/s', 'N/s', 'N·s',
'D', 'Impulse equals change in momentum.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='LAWS_OF_MOTION' AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'LAWS_OF_MOTION_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_LAWS_OF_MOTION_025';

-- WORK_ENERGY_POWER
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_006', 'medium', 'Kinetic energy is:',
'1/2 mv²', 'F/v', 'mgh', 'mv',
'A', 'K=½mv².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_007', 'medium', 'Quick check — Kinetic energy is:',
'mv', 'mgh', '1/2 mv²', 'F/v',
'C', 'K=½mv².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_008', 'medium', 'JEE concept check — Kinetic energy is:',
'mgh', 'F/v', 'mv', '1/2 mv²',
'D', 'K=½mv².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_009', 'medium', 'Choose the best answer — Kinetic energy is:',
'mgh', 'F/v', '1/2 mv²', 'mv',
'C', 'K=½mv².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_010', 'medium', 'Gravitational potential energy near Earth''s surface is:',
'm/g', '1/2 mv²', 'mgh', 'mg/h',
'C', 'U=mgh.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_011', 'medium', 'Quick check — Gravitational potential energy near Earth''s surface is:',
'mg/h', '1/2 mv²', 'm/g', 'mgh',
'D', 'U=mgh.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_012', 'medium', 'JEE concept check — Gravitational potential energy near Earth''s surface is:',
'mgh', '1/2 mv²', 'mg/h', 'm/g',
'A', 'U=mgh.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_013', 'medium', 'Choose the best answer — Gravitational potential energy near Earth''s surface is:',
'mg/h', '1/2 mv²', 'mgh', 'm/g',
'C', 'U=mgh.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_014', 'medium', 'Power is work divided by:',
'mass', 'velocity only', 'distance', 'time',
'D', 'P=W/t.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_015', 'medium', 'Quick check — Power is work divided by:',
'velocity only', 'time', 'mass', 'distance',
'B', 'P=W/t.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_016', 'medium', 'JEE concept check — Power is work divided by:',
'time', 'velocity only', 'distance', 'mass',
'A', 'P=W/t.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_017', 'medium', 'Choose the best answer — Power is work divided by:',
'mass', 'distance', 'time', 'velocity only',
'C', 'P=W/t.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_018', 'challenge', 'The work-energy theorem says net work equals change in:',
'charge', 'kinetic energy', 'temperature only', 'mass',
'B', 'W_net=ΔK.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_019', 'challenge', 'Quick check — The work-energy theorem says net work equals change in:',
'mass', 'kinetic energy', 'charge', 'temperature only',
'B', 'W_net=ΔK.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_020', 'challenge', 'JEE concept check — The work-energy theorem says net work equals change in:',
'temperature only', 'kinetic energy', 'charge', 'mass',
'B', 'W_net=ΔK.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_021', 'challenge', 'Choose the best answer — The work-energy theorem says net work equals change in:',
'kinetic energy', 'charge', 'mass', 'temperature only',
'A', 'W_net=ΔK.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_022', 'challenge', 'If force is perpendicular to displacement, work done is:',
'maximum', 'infinite', 'zero', 'negative always',
'C', 'W=Fs cos90°=0.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_023', 'challenge', 'Quick check — If force is perpendicular to displacement, work done is:',
'negative always', 'infinite', 'zero', 'maximum',
'C', 'W=Fs cos90°=0.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_024', 'challenge', 'JEE concept check — If force is perpendicular to displacement, work done is:',
'maximum', 'negative always', 'zero', 'infinite',
'C', 'W=Fs cos90°=0.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_025', 'challenge', 'Choose the best answer — If force is perpendicular to displacement, work done is:',
'zero', 'maximum', 'infinite', 'negative always',
'A', 'W=Fs cos90°=0.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='WORK_ENERGY_POWER' AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'WORK_ENERGY_POWER_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_WORK_ENERGY_POWER_025';

-- ROTATIONAL_MOTION
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_006', 'medium', 'Torque magnitude is rF sinθ and is analogous to:',
'force in translation', 'mass', 'temperature', 'energy',
'A', 'Torque is the rotational analogue of force.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_007', 'medium', 'Quick check — Torque magnitude is rF sinθ and is analogous to:',
'energy', 'mass', 'temperature', 'force in translation',
'D', 'Torque is the rotational analogue of force.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_008', 'medium', 'JEE concept check — Torque magnitude is rF sinθ and is analogous to:',
'mass', 'temperature', 'energy', 'force in translation',
'D', 'Torque is the rotational analogue of force.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_009', 'medium', 'Choose the best answer — Torque magnitude is rF sinθ and is analogous to:',
'temperature', 'force in translation', 'energy', 'mass',
'B', 'Torque is the rotational analogue of force.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_010', 'medium', 'Angular momentum of a rigid body about a fixed axis is:',
'Iω', 'ω/I', 'I/ω', 'Iω²',
'A', 'L=Iω.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_011', 'medium', 'Quick check — Angular momentum of a rigid body about a fixed axis is:',
'Iω²', 'Iω', 'ω/I', 'I/ω',
'B', 'L=Iω.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_012', 'medium', 'JEE concept check — Angular momentum of a rigid body about a fixed axis is:',
'Iω²', 'ω/I', 'Iω', 'I/ω',
'C', 'L=Iω.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_013', 'medium', 'Choose the best answer — Angular momentum of a rigid body about a fixed axis is:',
'I/ω', 'ω/I', 'Iω', 'Iω²',
'C', 'L=Iω.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_014', 'medium', 'Rotational kinetic energy is:',
'Iω', 'Iω²', '1/2 Iω²', 'I/2ω',
'C', 'K_rot=½Iω².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_015', 'medium', 'Quick check — Rotational kinetic energy is:',
'1/2 Iω²', 'I/2ω', 'Iω', 'Iω²',
'A', 'K_rot=½Iω².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_016', 'medium', 'JEE concept check — Rotational kinetic energy is:',
'Iω', '1/2 Iω²', 'I/2ω', 'Iω²',
'B', 'K_rot=½Iω².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_017', 'medium', 'Choose the best answer — Rotational kinetic energy is:',
'1/2 Iω²', 'I/2ω', 'Iω²', 'Iω',
'A', 'K_rot=½Iω².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_018', 'challenge', 'Moment of inertia depends on mass distribution relative to the:',
'time origin', 'axis of rotation', 'temperature', 'charge',
'B', 'I=Σmr² depends on distances from axis.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_019', 'challenge', 'Quick check — Moment of inertia depends on mass distribution relative to the:',
'time origin', 'axis of rotation', 'charge', 'temperature',
'B', 'I=Σmr² depends on distances from axis.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_020', 'challenge', 'JEE concept check — Moment of inertia depends on mass distribution relative to the:',
'time origin', 'temperature', 'axis of rotation', 'charge',
'C', 'I=Σmr² depends on distances from axis.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_021', 'challenge', 'Choose the best answer — Moment of inertia depends on mass distribution relative to the:',
'time origin', 'charge', 'axis of rotation', 'temperature',
'C', 'I=Σmr² depends on distances from axis.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_022', 'challenge', 'For no external torque, angular momentum is:',
'conserved', 'always zero', 'doubled', 'converted to charge',
'A', 'τ_ext=dL/dt.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_023', 'challenge', 'Quick check — For no external torque, angular momentum is:',
'converted to charge', 'doubled', 'conserved', 'always zero',
'C', 'τ_ext=dL/dt.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_024', 'challenge', 'JEE concept check — For no external torque, angular momentum is:',
'converted to charge', 'conserved', 'always zero', 'doubled',
'B', 'τ_ext=dL/dt.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_025', 'challenge', 'Choose the best answer — For no external torque, angular momentum is:',
'conserved', 'converted to charge', 'doubled', 'always zero',
'A', 'τ_ext=dL/dt.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ROTATIONAL_MOTION' AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ROTATIONAL_MOTION_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ROTATIONAL_MOTION_025';

-- GRAVITATION
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_006', 'medium', 'Newton''s law of gravitation varies as inverse square of:',
'time', 'separation', 'mass', 'charge',
'B', 'F∝1/r².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_007', 'medium', 'Quick check — Newton''s law of gravitation varies as inverse square of:',
'mass', 'time', 'charge', 'separation',
'D', 'F∝1/r².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_008', 'medium', 'JEE concept check — Newton''s law of gravitation varies as inverse square of:',
'time', 'separation', 'charge', 'mass',
'B', 'F∝1/r².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_009', 'medium', 'Choose the best answer — Newton''s law of gravitation varies as inverse square of:',
'charge', 'time', 'mass', 'separation',
'D', 'F∝1/r².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_010', 'medium', 'Weight of a mass m near Earth is:',
'm+g', 'm/g', 'g/m', 'mg',
'D', 'Weight is gravitational force mg.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_011', 'medium', 'Quick check — Weight of a mass m near Earth is:',
'm+g', 'g/m', 'mg', 'm/g',
'C', 'Weight is gravitational force mg.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_012', 'medium', 'JEE concept check — Weight of a mass m near Earth is:',
'm+g', 'g/m', 'm/g', 'mg',
'D', 'Weight is gravitational force mg.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_013', 'medium', 'Choose the best answer — Weight of a mass m near Earth is:',
'g/m', 'mg', 'm+g', 'm/g',
'B', 'Weight is gravitational force mg.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_014', 'medium', 'Escape speed from a planet is independent of projectile:',
'planet radius', 'launch speed', 'planet mass', 'mass',
'D', 'v_e=sqrt(2GM/R), independent of projectile mass.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_015', 'medium', 'Quick check — Escape speed from a planet is independent of projectile:',
'launch speed', 'mass', 'planet mass', 'planet radius',
'B', 'v_e=sqrt(2GM/R), independent of projectile mass.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_016', 'medium', 'JEE concept check — Escape speed from a planet is independent of projectile:',
'mass', 'planet mass', 'planet radius', 'launch speed',
'A', 'v_e=sqrt(2GM/R), independent of projectile mass.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_017', 'medium', 'Choose the best answer — Escape speed from a planet is independent of projectile:',
'launch speed', 'planet radius', 'planet mass', 'mass',
'D', 'v_e=sqrt(2GM/R), independent of projectile mass.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_018', 'challenge', 'A satellite in circular orbit is held by:',
'buoyancy', 'friction', 'gravity providing centripetal force', 'magnetic force',
'C', 'Gravity supplies centripetal acceleration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_019', 'challenge', 'Quick check — A satellite in circular orbit is held by:',
'buoyancy', 'friction', 'gravity providing centripetal force', 'magnetic force',
'C', 'Gravity supplies centripetal acceleration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_020', 'challenge', 'JEE concept check — A satellite in circular orbit is held by:',
'magnetic force', 'friction', 'buoyancy', 'gravity providing centripetal force',
'D', 'Gravity supplies centripetal acceleration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_021', 'challenge', 'Choose the best answer — A satellite in circular orbit is held by:',
'buoyancy', 'friction', 'magnetic force', 'gravity providing centripetal force',
'D', 'Gravity supplies centripetal acceleration.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_022', 'challenge', 'Gravitational potential is defined as potential energy per unit:',
'time', 'mass', 'volume', 'charge',
'B', 'V=U/m.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_023', 'challenge', 'Quick check — Gravitational potential is defined as potential energy per unit:',
'volume', 'charge', 'mass', 'time',
'C', 'V=U/m.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_024', 'challenge', 'JEE concept check — Gravitational potential is defined as potential energy per unit:',
'volume', 'charge', 'mass', 'time',
'C', 'V=U/m.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_GRAVITATION_025', 'challenge', 'Choose the best answer — Gravitational potential is defined as potential energy per unit:',
'mass', 'charge', 'time', 'volume',
'A', 'V=U/m.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='GRAVITATION' AND st.subtopic_code='GRAVITATION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'GRAVITATION_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_GRAVITATION_025';

-- PROPERTIES_SOLIDS_LIQUIDS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_006', 'medium', 'Stress is force divided by:',
'volume', 'area', 'length', 'time',
'B', 'Stress=F/A.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_007', 'medium', 'Quick check — Stress is force divided by:',
'area', 'length', 'volume', 'time',
'A', 'Stress=F/A.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_008', 'medium', 'JEE concept check — Stress is force divided by:',
'time', 'area', 'length', 'volume',
'B', 'Stress=F/A.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_009', 'medium', 'Choose the best answer — Stress is force divided by:',
'volume', 'length', 'time', 'area',
'D', 'Stress=F/A.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_010', 'medium', 'Strain is:',
'measured in joule', 'measured in pascal', 'dimensionless', 'measured in newton',
'C', 'Strain is a ratio of lengths.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_011', 'medium', 'Quick check — Strain is:',
'measured in pascal', 'measured in newton', 'measured in joule', 'dimensionless',
'D', 'Strain is a ratio of lengths.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_012', 'medium', 'JEE concept check — Strain is:',
'measured in pascal', 'dimensionless', 'measured in newton', 'measured in joule',
'B', 'Strain is a ratio of lengths.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_013', 'medium', 'Choose the best answer — Strain is:',
'measured in newton', 'dimensionless', 'measured in pascal', 'measured in joule',
'B', 'Strain is a ratio of lengths.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_014', 'medium', 'Pressure in a static liquid increases with:',
'decreasing density', 'depth', 'height above surface', 'zero gravity',
'B', 'p=ρgh.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_015', 'medium', 'Quick check — Pressure in a static liquid increases with:',
'decreasing density', 'zero gravity', 'depth', 'height above surface',
'C', 'p=ρgh.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_016', 'medium', 'JEE concept check — Pressure in a static liquid increases with:',
'height above surface', 'decreasing density', 'depth', 'zero gravity',
'C', 'p=ρgh.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_017', 'medium', 'Choose the best answer — Pressure in a static liquid increases with:',
'zero gravity', 'decreasing density', 'depth', 'height above surface',
'C', 'p=ρgh.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_018', 'challenge', 'Surface tension has SI unit:',
'Pa·s', 'J/s', 'N·m', 'N/m',
'D', 'Surface tension is force per unit length.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_019', 'challenge', 'Quick check — Surface tension has SI unit:',
'N/m', 'Pa·s', 'N·m', 'J/s',
'A', 'Surface tension is force per unit length.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_020', 'challenge', 'JEE concept check — Surface tension has SI unit:',
'N·m', 'J/s', 'Pa·s', 'N/m',
'D', 'Surface tension is force per unit length.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_021', 'challenge', 'Choose the best answer — Surface tension has SI unit:',
'N·m', 'J/s', 'N/m', 'Pa·s',
'C', 'Surface tension is force per unit length.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_022', 'challenge', 'Viscosity describes resistance to:',
'electric current only', 'heating', 'magnetization', 'flow',
'D', 'Viscosity measures internal fluid friction.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_023', 'challenge', 'Quick check — Viscosity describes resistance to:',
'magnetization', 'electric current only', 'flow', 'heating',
'C', 'Viscosity measures internal fluid friction.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_024', 'challenge', 'JEE concept check — Viscosity describes resistance to:',
'magnetization', 'heating', 'electric current only', 'flow',
'D', 'Viscosity measures internal fluid friction.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_025', 'challenge', 'Choose the best answer — Viscosity describes resistance to:',
'magnetization', 'heating', 'electric current only', 'flow',
'D', 'Viscosity measures internal fluid friction.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='PROPERTIES_SOLIDS_LIQUIDS' AND st.subtopic_code='PROPERTIES_SOLIDS_LIQUIDS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'PROPERTIES_SOLIDS_LIQUIDS_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_PROPERTIES_SOLIDS_LIQUIDS_025';

-- THERMODYNAMICS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_006', 'medium', 'First law of thermodynamics expresses conservation of:',
'mass number', 'momentum only', 'energy', 'charge only',
'C', 'Heat and work change internal energy.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_007', 'medium', 'Quick check — First law of thermodynamics expresses conservation of:',
'mass number', 'momentum only', 'charge only', 'energy',
'D', 'Heat and work change internal energy.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_008', 'medium', 'JEE concept check — First law of thermodynamics expresses conservation of:',
'energy', 'charge only', 'momentum only', 'mass number',
'A', 'Heat and work change internal energy.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_009', 'medium', 'Choose the best answer — First law of thermodynamics expresses conservation of:',
'charge only', 'mass number', 'momentum only', 'energy',
'D', 'Heat and work change internal energy.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_010', 'medium', 'For an ideal gas, internal energy depends primarily on:',
'pressure alone', 'volume alone', 'container shape', 'temperature',
'D', 'Ideal-gas U is a function of T.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_011', 'medium', 'Quick check — For an ideal gas, internal energy depends primarily on:',
'temperature', 'volume alone', 'pressure alone', 'container shape',
'A', 'Ideal-gas U is a function of T.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_012', 'medium', 'JEE concept check — For an ideal gas, internal energy depends primarily on:',
'pressure alone', 'volume alone', 'container shape', 'temperature',
'D', 'Ideal-gas U is a function of T.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_013', 'medium', 'Choose the best answer — For an ideal gas, internal energy depends primarily on:',
'volume alone', 'container shape', 'temperature', 'pressure alone',
'C', 'Ideal-gas U is a function of T.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_014', 'medium', 'An isothermal process occurs at constant:',
'pressure', 'temperature', 'entropy always', 'volume',
'B', 'Isothermal means T constant.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_015', 'medium', 'Quick check — An isothermal process occurs at constant:',
'temperature', 'pressure', 'volume', 'entropy always',
'A', 'Isothermal means T constant.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_016', 'medium', 'JEE concept check — An isothermal process occurs at constant:',
'temperature', 'volume', 'pressure', 'entropy always',
'A', 'Isothermal means T constant.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_017', 'medium', 'Choose the best answer — An isothermal process occurs at constant:',
'entropy always', 'pressure', 'temperature', 'volume',
'C', 'Isothermal means T constant.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_018', 'challenge', 'An adiabatic process has heat transfer Q equal to:',
'work', 'internal energy', 'pressure', 'zero',
'D', 'By definition no heat is exchanged.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_019', 'challenge', 'Quick check — An adiabatic process has heat transfer Q equal to:',
'internal energy', 'zero', 'work', 'pressure',
'B', 'By definition no heat is exchanged.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_020', 'challenge', 'JEE concept check — An adiabatic process has heat transfer Q equal to:',
'work', 'internal energy', 'pressure', 'zero',
'D', 'By definition no heat is exchanged.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_021', 'challenge', 'Choose the best answer — An adiabatic process has heat transfer Q equal to:',
'work', 'internal energy', 'pressure', 'zero',
'D', 'By definition no heat is exchanged.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_022', 'challenge', 'Carnot efficiency depends on reservoir:',
'working substance mass only', 'pressure only', 'volume only', 'temperatures',
'D', 'η=1-Tc/Th.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_023', 'challenge', 'Quick check — Carnot efficiency depends on reservoir:',
'volume only', 'pressure only', 'working substance mass only', 'temperatures',
'D', 'η=1-Tc/Th.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_024', 'challenge', 'JEE concept check — Carnot efficiency depends on reservoir:',
'temperatures', 'pressure only', 'volume only', 'working substance mass only',
'A', 'η=1-Tc/Th.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_025', 'challenge', 'Choose the best answer — Carnot efficiency depends on reservoir:',
'temperatures', 'pressure only', 'working substance mass only', 'volume only',
'A', 'η=1-Tc/Th.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='THERMODYNAMICS' AND st.subtopic_code='THERMODYNAMICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'THERMODYNAMICS_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_THERMODYNAMICS_025';

-- KINETIC_THEORY_GASES
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_006', 'medium', 'For an ideal gas, PV equals:',
'nR/T', 'nT/R', 'nRT', 'RT/n',
'C', 'Ideal-gas equation is PV=nRT.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_007', 'medium', 'Quick check — For an ideal gas, PV equals:',
'nT/R', 'nR/T', 'nRT', 'RT/n',
'C', 'Ideal-gas equation is PV=nRT.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_008', 'medium', 'JEE concept check — For an ideal gas, PV equals:',
'nRT', 'nT/R', 'nR/T', 'RT/n',
'A', 'Ideal-gas equation is PV=nRT.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_009', 'medium', 'Choose the best answer — For an ideal gas, PV equals:',
'nT/R', 'nR/T', 'RT/n', 'nRT',
'D', 'Ideal-gas equation is PV=nRT.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_010', 'medium', 'RMS molecular speed is proportional to square root of:',
'molar mass', 'pressure only', 'absolute temperature', 'volume only',
'C', 'v_rms∝sqrt(T/M).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_011', 'medium', 'Quick check — RMS molecular speed is proportional to square root of:',
'pressure only', 'absolute temperature', 'molar mass', 'volume only',
'B', 'v_rms∝sqrt(T/M).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_012', 'medium', 'JEE concept check — RMS molecular speed is proportional to square root of:',
'volume only', 'absolute temperature', 'pressure only', 'molar mass',
'B', 'v_rms∝sqrt(T/M).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_013', 'medium', 'Choose the best answer — RMS molecular speed is proportional to square root of:',
'molar mass', 'volume only', 'pressure only', 'absolute temperature',
'D', 'v_rms∝sqrt(T/M).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_014', 'medium', 'At the same temperature, lighter gas molecules have:',
'same mass', 'zero speed', 'lower rms speed', 'higher rms speed',
'D', 'v_rms∝1/sqrt(M).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_015', 'medium', 'Quick check — At the same temperature, lighter gas molecules have:',
'lower rms speed', 'higher rms speed', 'zero speed', 'same mass',
'B', 'v_rms∝1/sqrt(M).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_016', 'medium', 'JEE concept check — At the same temperature, lighter gas molecules have:',
'same mass', 'higher rms speed', 'zero speed', 'lower rms speed',
'B', 'v_rms∝1/sqrt(M).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_017', 'medium', 'Choose the best answer — At the same temperature, lighter gas molecules have:',
'zero speed', 'higher rms speed', 'same mass', 'lower rms speed',
'B', 'v_rms∝1/sqrt(M).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_018', 'challenge', 'Average translational kinetic energy per molecule is proportional to:',
'molar mass', 'temperature', 'pressure only', 'volume only',
'B', 'Mean translational energy is 3kT/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_019', 'challenge', 'Quick check — Average translational kinetic energy per molecule is proportional to:',
'pressure only', 'molar mass', 'temperature', 'volume only',
'C', 'Mean translational energy is 3kT/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_020', 'challenge', 'JEE concept check — Average translational kinetic energy per molecule is proportional to:',
'volume only', 'temperature', 'pressure only', 'molar mass',
'B', 'Mean translational energy is 3kT/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_021', 'challenge', 'Choose the best answer — Average translational kinetic energy per molecule is proportional to:',
'volume only', 'temperature', 'molar mass', 'pressure only',
'B', 'Mean translational energy is 3kT/2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_022', 'challenge', 'Ideal gas molecules are assumed to undergo:',
'nuclear collisions', 'inelastic collisions only', 'no collisions', 'elastic collisions',
'D', 'Kinetic theory assumes elastic collisions.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_023', 'challenge', 'Quick check — Ideal gas molecules are assumed to undergo:',
'no collisions', 'nuclear collisions', 'inelastic collisions only', 'elastic collisions',
'D', 'Kinetic theory assumes elastic collisions.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_024', 'challenge', 'JEE concept check — Ideal gas molecules are assumed to undergo:',
'nuclear collisions', 'inelastic collisions only', 'no collisions', 'elastic collisions',
'D', 'Kinetic theory assumes elastic collisions.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_025', 'challenge', 'Choose the best answer — Ideal gas molecules are assumed to undergo:',
'no collisions', 'inelastic collisions only', 'elastic collisions', 'nuclear collisions',
'C', 'Kinetic theory assumes elastic collisions.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='KINETIC_THEORY_GASES' AND st.subtopic_code='KINETIC_THEORY_GASES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'KINETIC_THEORY_GASES_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_KINETIC_THEORY_GASES_025';

-- OSCILLATIONS_WAVES
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_006', 'medium', 'For SHM, restoring force is proportional to displacement and:',
'perpendicular', 'same direction', 'zero', 'opposite in direction',
'D', 'F=-kx.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_007', 'medium', 'Quick check — For SHM, restoring force is proportional to displacement and:',
'same direction', 'zero', 'opposite in direction', 'perpendicular',
'C', 'F=-kx.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_008', 'medium', 'JEE concept check — For SHM, restoring force is proportional to displacement and:',
'zero', 'same direction', 'opposite in direction', 'perpendicular',
'C', 'F=-kx.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_009', 'medium', 'Choose the best answer — For SHM, restoring force is proportional to displacement and:',
'same direction', 'zero', 'opposite in direction', 'perpendicular',
'C', 'F=-kx.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_010', 'medium', 'The period of a simple harmonic oscillator is inverse of:',
'frequency', 'mass always', 'energy', 'amplitude',
'A', 'T=1/f.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_011', 'medium', 'Quick check — The period of a simple harmonic oscillator is inverse of:',
'frequency', 'energy', 'mass always', 'amplitude',
'A', 'T=1/f.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_012', 'medium', 'JEE concept check — The period of a simple harmonic oscillator is inverse of:',
'amplitude', 'energy', 'mass always', 'frequency',
'D', 'T=1/f.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_013', 'medium', 'Choose the best answer — The period of a simple harmonic oscillator is inverse of:',
'mass always', 'energy', 'amplitude', 'frequency',
'D', 'T=1/f.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_014', 'medium', 'Wave speed equals frequency times:',
'amplitude', 'phase', 'wavelength', 'period squared',
'C', 'v=fλ.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_015', 'medium', 'Quick check — Wave speed equals frequency times:',
'amplitude', 'phase', 'period squared', 'wavelength',
'D', 'v=fλ.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_016', 'medium', 'JEE concept check — Wave speed equals frequency times:',
'period squared', 'amplitude', 'wavelength', 'phase',
'C', 'v=fλ.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_017', 'medium', 'Choose the best answer — Wave speed equals frequency times:',
'wavelength', 'amplitude', 'phase', 'period squared',
'A', 'v=fλ.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_018', 'challenge', 'In a transverse wave, particle oscillation is:',
'circular only', 'parallel to propagation', 'absent', 'perpendicular to propagation',
'D', 'Transverse displacement is perpendicular to travel.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_019', 'challenge', 'Quick check — In a transverse wave, particle oscillation is:',
'absent', 'circular only', 'parallel to propagation', 'perpendicular to propagation',
'D', 'Transverse displacement is perpendicular to travel.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_020', 'challenge', 'JEE concept check — In a transverse wave, particle oscillation is:',
'absent', 'parallel to propagation', 'circular only', 'perpendicular to propagation',
'D', 'Transverse displacement is perpendicular to travel.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_021', 'challenge', 'Choose the best answer — In a transverse wave, particle oscillation is:',
'circular only', 'perpendicular to propagation', 'absent', 'parallel to propagation',
'B', 'Transverse displacement is perpendicular to travel.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_022', 'challenge', 'Sound in air is primarily a:',
'transverse wave', 'matter beam', 'electromagnetic wave', 'longitudinal wave',
'D', 'Air particles oscillate parallel to propagation.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_023', 'challenge', 'Quick check — Sound in air is primarily a:',
'matter beam', 'longitudinal wave', 'electromagnetic wave', 'transverse wave',
'B', 'Air particles oscillate parallel to propagation.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_024', 'challenge', 'JEE concept check — Sound in air is primarily a:',
'longitudinal wave', 'transverse wave', 'matter beam', 'electromagnetic wave',
'A', 'Air particles oscillate parallel to propagation.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_025', 'challenge', 'Choose the best answer — Sound in air is primarily a:',
'transverse wave', 'matter beam', 'electromagnetic wave', 'longitudinal wave',
'D', 'Air particles oscillate parallel to propagation.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OSCILLATIONS_WAVES' AND st.subtopic_code='OSCILLATIONS_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OSCILLATIONS_WAVES_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OSCILLATIONS_WAVES_025';

-- ELECTROSTATICS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_006', 'medium', 'Coulomb force between point charges varies as inverse square of:',
'time', 'distance', 'mass', 'charge',
'B', 'F=kq1q2/r².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_007', 'medium', 'Quick check — Coulomb force between point charges varies as inverse square of:',
'distance', 'time', 'mass', 'charge',
'A', 'F=kq1q2/r².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_008', 'medium', 'JEE concept check — Coulomb force between point charges varies as inverse square of:',
'time', 'charge', 'mass', 'distance',
'D', 'F=kq1q2/r².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_009', 'medium', 'Choose the best answer — Coulomb force between point charges varies as inverse square of:',
'time', 'mass', 'distance', 'charge',
'C', 'F=kq1q2/r².', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_010', 'medium', 'Electric field is force per unit positive test:',
'energy', 'charge', 'mass', 'volume',
'B', 'E=F/q.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_011', 'medium', 'Quick check — Electric field is force per unit positive test:',
'mass', 'volume', 'energy', 'charge',
'D', 'E=F/q.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_012', 'medium', 'JEE concept check — Electric field is force per unit positive test:',
'charge', 'mass', 'volume', 'energy',
'A', 'E=F/q.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_013', 'medium', 'Choose the best answer — Electric field is force per unit positive test:',
'charge', 'mass', 'energy', 'volume',
'A', 'E=F/q.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_014', 'medium', 'Electric potential is potential energy per unit:',
'force', 'time', 'charge', 'mass',
'C', 'V=U/q.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_015', 'medium', 'Quick check — Electric potential is potential energy per unit:',
'mass', 'charge', 'time', 'force',
'B', 'V=U/q.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_016', 'medium', 'JEE concept check — Electric potential is potential energy per unit:',
'time', 'mass', 'charge', 'force',
'C', 'V=U/q.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_017', 'medium', 'Choose the best answer — Electric potential is potential energy per unit:',
'time', 'charge', 'mass', 'force',
'B', 'V=U/q.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_018', 'challenge', 'SI unit of electric potential is:',
'volt', 'ampere', 'weber', 'tesla',
'A', 'Potential is measured in volts.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_019', 'challenge', 'Quick check — SI unit of electric potential is:',
'weber', 'volt', 'tesla', 'ampere',
'B', 'Potential is measured in volts.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_020', 'challenge', 'JEE concept check — SI unit of electric potential is:',
'weber', 'ampere', 'tesla', 'volt',
'D', 'Potential is measured in volts.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_021', 'challenge', 'Choose the best answer — SI unit of electric potential is:',
'weber', 'volt', 'ampere', 'tesla',
'B', 'Potential is measured in volts.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_022', 'challenge', 'Inside an electrostatic conductor in equilibrium, electric field is:',
'maximum', 'zero', 'equal to potential', 'infinite',
'B', 'Free charges redistribute until internal E vanishes.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_023', 'challenge', 'Quick check — Inside an electrostatic conductor in equilibrium, electric field is:',
'infinite', 'zero', 'maximum', 'equal to potential',
'B', 'Free charges redistribute until internal E vanishes.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_024', 'challenge', 'JEE concept check — Inside an electrostatic conductor in equilibrium, electric field is:',
'infinite', 'equal to potential', 'maximum', 'zero',
'D', 'Free charges redistribute until internal E vanishes.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_025', 'challenge', 'Choose the best answer — Inside an electrostatic conductor in equilibrium, electric field is:',
'zero', 'infinite', 'maximum', 'equal to potential',
'A', 'Free charges redistribute until internal E vanishes.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROSTATICS' AND st.subtopic_code='ELECTROSTATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROSTATICS_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROSTATICS_025';

-- CURRENT_ELECTRICITY
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_006', 'medium', 'Ohm''s law is:',
'V=I/R', 'V=IR', 'I=VR', 'R=VI',
'B', 'For an ohmic conductor V=IR.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_007', 'medium', 'Quick check — Ohm''s law is:',
'R=VI', 'I=VR', 'V=IR', 'V=I/R',
'C', 'For an ohmic conductor V=IR.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_008', 'medium', 'JEE concept check — Ohm''s law is:',
'V=I/R', 'V=IR', 'I=VR', 'R=VI',
'B', 'For an ohmic conductor V=IR.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_009', 'medium', 'Choose the best answer — Ohm''s law is:',
'I=VR', 'R=VI', 'V=I/R', 'V=IR',
'D', 'For an ohmic conductor V=IR.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_010', 'medium', 'Electric current is charge flow per unit:',
'mass', 'energy', 'time', 'length',
'C', 'I=dQ/dt.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_011', 'medium', 'Quick check — Electric current is charge flow per unit:',
'mass', 'length', 'energy', 'time',
'D', 'I=dQ/dt.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_012', 'medium', 'JEE concept check — Electric current is charge flow per unit:',
'mass', 'length', 'energy', 'time',
'D', 'I=dQ/dt.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_013', 'medium', 'Choose the best answer — Electric current is charge flow per unit:',
'time', 'mass', 'length', 'energy',
'A', 'I=dQ/dt.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_014', 'medium', 'Electrical power can be written as:',
'V/I', 'I/V', 'VI', 'V+I',
'C', 'P=VI.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_015', 'medium', 'Quick check — Electrical power can be written as:',
'V+I', 'V/I', 'I/V', 'VI',
'D', 'P=VI.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_016', 'medium', 'JEE concept check — Electrical power can be written as:',
'VI', 'I/V', 'V+I', 'V/I',
'A', 'P=VI.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_017', 'medium', 'Choose the best answer — Electrical power can be written as:',
'I/V', 'VI', 'V+I', 'V/I',
'B', 'P=VI.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_018', 'challenge', 'Resistors in series have equivalent resistance equal to:',
'largest resistance only', 'product only', 'reciprocal sum', 'sum of resistances',
'D', 'Series resistances add.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_019', 'challenge', 'Quick check — Resistors in series have equivalent resistance equal to:',
'sum of resistances', 'largest resistance only', 'reciprocal sum', 'product only',
'A', 'Series resistances add.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_020', 'challenge', 'JEE concept check — Resistors in series have equivalent resistance equal to:',
'reciprocal sum', 'product only', 'sum of resistances', 'largest resistance only',
'C', 'Series resistances add.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_021', 'challenge', 'Choose the best answer — Resistors in series have equivalent resistance equal to:',
'sum of resistances', 'largest resistance only', 'product only', 'reciprocal sum',
'A', 'Series resistances add.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_022', 'challenge', 'For resistors in parallel, equivalent resistance is:',
'sum of all', 'less than the smallest branch resistance', 'greater than all branches', 'always zero',
'B', 'Parallel paths reduce equivalent resistance.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_023', 'challenge', 'Quick check — For resistors in parallel, equivalent resistance is:',
'sum of all', 'always zero', 'greater than all branches', 'less than the smallest branch resistance',
'D', 'Parallel paths reduce equivalent resistance.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_024', 'challenge', 'JEE concept check — For resistors in parallel, equivalent resistance is:',
'less than the smallest branch resistance', 'always zero', 'greater than all branches', 'sum of all',
'A', 'Parallel paths reduce equivalent resistance.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_025', 'challenge', 'Choose the best answer — For resistors in parallel, equivalent resistance is:',
'sum of all', 'greater than all branches', 'always zero', 'less than the smallest branch resistance',
'D', 'Parallel paths reduce equivalent resistance.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='CURRENT_ELECTRICITY' AND st.subtopic_code='CURRENT_ELECTRICITY_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'CURRENT_ELECTRICITY_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_CURRENT_ELECTRICITY_025';

-- MAGNETIC_EFFECTS_MAGNETISM
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_006', 'medium', 'Force on charge q moving in magnetic field is q times:',
'v/B', 'v+B', 'B/v', 'v×B',
'D', 'Magnetic Lorentz force is q(v×B).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_007', 'medium', 'Quick check — Force on charge q moving in magnetic field is q times:',
'v+B', 'B/v', 'v/B', 'v×B',
'D', 'Magnetic Lorentz force is q(v×B).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_008', 'medium', 'JEE concept check — Force on charge q moving in magnetic field is q times:',
'v×B', 'v/B', 'B/v', 'v+B',
'A', 'Magnetic Lorentz force is q(v×B).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_009', 'medium', 'Choose the best answer — Force on charge q moving in magnetic field is q times:',
'v×B', 'v+B', 'v/B', 'B/v',
'A', 'Magnetic Lorentz force is q(v×B).', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_010', 'medium', 'A magnetic field does work on a moving point charge:',
'only when perpendicular', 'only in vacuum', 'yes always', 'no',
'D', 'Magnetic force is perpendicular to velocity.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_011', 'medium', 'Quick check — A magnetic field does work on a moving point charge:',
'yes always', 'no', 'only in vacuum', 'only when perpendicular',
'B', 'Magnetic force is perpendicular to velocity.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_012', 'medium', 'JEE concept check — A magnetic field does work on a moving point charge:',
'yes always', 'only in vacuum', 'only when perpendicular', 'no',
'D', 'Magnetic force is perpendicular to velocity.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_013', 'medium', 'Choose the best answer — A magnetic field does work on a moving point charge:',
'yes always', 'only in vacuum', 'only when perpendicular', 'no',
'D', 'Magnetic force is perpendicular to velocity.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_014', 'medium', 'Force on a current-carrying wire is proportional to:',
'BI/L', 'I/B', 'BL/I', 'BIL sinθ',
'D', 'F=BIL sinθ.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_015', 'medium', 'Quick check — Force on a current-carrying wire is proportional to:',
'I/B', 'BIL sinθ', 'BI/L', 'BL/I',
'B', 'F=BIL sinθ.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_016', 'medium', 'JEE concept check — Force on a current-carrying wire is proportional to:',
'BL/I', 'I/B', 'BIL sinθ', 'BI/L',
'C', 'F=BIL sinθ.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_017', 'medium', 'Choose the best answer — Force on a current-carrying wire is proportional to:',
'BI/L', 'I/B', 'BIL sinθ', 'BL/I',
'C', 'F=BIL sinθ.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_018', 'challenge', 'SI unit of magnetic field B is:',
'tesla', 'weber only', 'volt', 'ampere',
'A', 'B is measured in tesla.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_019', 'challenge', 'Quick check — SI unit of magnetic field B is:',
'ampere', 'weber only', 'volt', 'tesla',
'D', 'B is measured in tesla.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_020', 'challenge', 'JEE concept check — SI unit of magnetic field B is:',
'weber only', 'tesla', 'volt', 'ampere',
'B', 'B is measured in tesla.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_021', 'challenge', 'Choose the best answer — SI unit of magnetic field B is:',
'weber only', 'ampere', 'volt', 'tesla',
'D', 'B is measured in tesla.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_022', 'challenge', 'A current loop behaves like a magnetic:',
'capacitor', 'monopole', 'dipole', 'charge only',
'C', 'A loop has magnetic dipole moment IA.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_023', 'challenge', 'Quick check — A current loop behaves like a magnetic:',
'charge only', 'dipole', 'capacitor', 'monopole',
'B', 'A loop has magnetic dipole moment IA.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_024', 'challenge', 'JEE concept check — A current loop behaves like a magnetic:',
'monopole', 'capacitor', 'charge only', 'dipole',
'D', 'A loop has magnetic dipole moment IA.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_025', 'challenge', 'Choose the best answer — A current loop behaves like a magnetic:',
'monopole', 'capacitor', 'dipole', 'charge only',
'C', 'A loop has magnetic dipole moment IA.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='MAGNETIC_EFFECTS_MAGNETISM' AND st.subtopic_code='MAGNETIC_EFFECTS_MAGNETISM_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'MAGNETIC_EFFECTS_MAGNETISM_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_MAGNETIC_EFFECTS_MAGNETISM_025';

-- EMI_AC
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_006', 'medium', 'Faraday''s law relates induced emf to rate of change of magnetic:',
'flux', 'temperature', 'charge', 'mass',
'A', 'ε=-dΦ/dt.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_007', 'medium', 'Quick check — Faraday''s law relates induced emf to rate of change of magnetic:',
'temperature', 'flux', 'charge', 'mass',
'B', 'ε=-dΦ/dt.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_008', 'medium', 'JEE concept check — Faraday''s law relates induced emf to rate of change of magnetic:',
'charge', 'mass', 'temperature', 'flux',
'D', 'ε=-dΦ/dt.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_009', 'medium', 'Choose the best answer — Faraday''s law relates induced emf to rate of change of magnetic:',
'flux', 'mass', 'temperature', 'charge',
'A', 'ε=-dΦ/dt.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_010', 'medium', 'Lenz''s law determines the induced current:',
'frequency only', 'mass', 'direction', 'charge sign only',
'C', 'Induced effects oppose the change causing them.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_011', 'medium', 'Quick check — Lenz''s law determines the induced current:',
'frequency only', 'mass', 'direction', 'charge sign only',
'C', 'Induced effects oppose the change causing them.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_012', 'medium', 'JEE concept check — Lenz''s law determines the induced current:',
'frequency only', 'charge sign only', 'direction', 'mass',
'C', 'Induced effects oppose the change causing them.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_013', 'medium', 'Choose the best answer — Lenz''s law determines the induced current:',
'frequency only', 'direction', 'charge sign only', 'mass',
'B', 'Induced effects oppose the change causing them.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_014', 'medium', 'For sinusoidal AC, V_rms equals V_max divided by:',
'sqrt(2)', 'sqrt(3)', 'pi', '2',
'A', 'V_rms=Vmax/sqrt2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_015', 'medium', 'Quick check — For sinusoidal AC, V_rms equals V_max divided by:',
'sqrt(3)', 'pi', '2', 'sqrt(2)',
'D', 'V_rms=Vmax/sqrt2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_016', 'medium', 'JEE concept check — For sinusoidal AC, V_rms equals V_max divided by:',
'2', 'sqrt(2)', 'sqrt(3)', 'pi',
'B', 'V_rms=Vmax/sqrt2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_017', 'medium', 'Choose the best answer — For sinusoidal AC, V_rms equals V_max divided by:',
'sqrt(2)', 'sqrt(3)', 'pi', '2',
'A', 'V_rms=Vmax/sqrt2.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_018', 'challenge', 'A transformer works primarily with:',
'static charge', 'steady DC only', 'alternating current', 'mechanical current',
'C', 'Changing magnetic flux is required.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_019', 'challenge', 'Quick check — A transformer works primarily with:',
'mechanical current', 'alternating current', 'static charge', 'steady DC only',
'B', 'Changing magnetic flux is required.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_020', 'challenge', 'JEE concept check — A transformer works primarily with:',
'steady DC only', 'alternating current', 'static charge', 'mechanical current',
'B', 'Changing magnetic flux is required.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_021', 'challenge', 'Choose the best answer — A transformer works primarily with:',
'alternating current', 'static charge', 'steady DC only', 'mechanical current',
'A', 'Changing magnetic flux is required.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_022', 'challenge', 'An ideal step-up transformer increases voltage while decreasing:',
'frequency', 'current', 'power ideally', 'magnetic flux always',
'B', 'Approximately VpIp=VsIs.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_023', 'challenge', 'Quick check — An ideal step-up transformer increases voltage while decreasing:',
'magnetic flux always', 'power ideally', 'current', 'frequency',
'C', 'Approximately VpIp=VsIs.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_024', 'challenge', 'JEE concept check — An ideal step-up transformer increases voltage while decreasing:',
'power ideally', 'current', 'frequency', 'magnetic flux always',
'B', 'Approximately VpIp=VsIs.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EMI_AC_025', 'challenge', 'Choose the best answer — An ideal step-up transformer increases voltage while decreasing:',
'magnetic flux always', 'power ideally', 'current', 'frequency',
'C', 'Approximately VpIp=VsIs.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EMI_AC' AND st.subtopic_code='EMI_AC_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EMI_AC_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EMI_AC_025';

-- ELECTROMAGNETIC_WAVES
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_006', 'medium', 'Electromagnetic waves in vacuum travel at:',
'3×10^8 m/s', '3×10^6 m/s', '340 m/s', '9.8 m/s',
'A', 'They travel at c.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_007', 'medium', 'Quick check — Electromagnetic waves in vacuum travel at:',
'9.8 m/s', '340 m/s', '3×10^6 m/s', '3×10^8 m/s',
'D', 'They travel at c.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_008', 'medium', 'JEE concept check — Electromagnetic waves in vacuum travel at:',
'3×10^8 m/s', '3×10^6 m/s', '340 m/s', '9.8 m/s',
'A', 'They travel at c.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_009', 'medium', 'Choose the best answer — Electromagnetic waves in vacuum travel at:',
'3×10^6 m/s', '9.8 m/s', '3×10^8 m/s', '340 m/s',
'C', 'They travel at c.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_010', 'medium', 'In an EM wave, electric and magnetic fields are:',
'mutually perpendicular', 'unrelated', 'parallel', 'antiparallel',
'A', 'E, B, and propagation are mutually perpendicular.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_011', 'medium', 'Quick check — In an EM wave, electric and magnetic fields are:',
'antiparallel', 'unrelated', 'parallel', 'mutually perpendicular',
'D', 'E, B, and propagation are mutually perpendicular.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_012', 'medium', 'JEE concept check — In an EM wave, electric and magnetic fields are:',
'unrelated', 'antiparallel', 'parallel', 'mutually perpendicular',
'D', 'E, B, and propagation are mutually perpendicular.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_013', 'medium', 'Choose the best answer — In an EM wave, electric and magnetic fields are:',
'unrelated', 'mutually perpendicular', 'antiparallel', 'parallel',
'B', 'E, B, and propagation are mutually perpendicular.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_014', 'medium', 'Microwaves are commonly used in:',
'radar', 'mechanical clocks', 'nuclear fission', 'DC circuits only',
'A', 'Radar commonly uses microwaves.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_015', 'medium', 'Quick check — Microwaves are commonly used in:',
'mechanical clocks', 'DC circuits only', 'radar', 'nuclear fission',
'C', 'Radar commonly uses microwaves.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_016', 'medium', 'JEE concept check — Microwaves are commonly used in:',
'nuclear fission', 'mechanical clocks', 'radar', 'DC circuits only',
'C', 'Radar commonly uses microwaves.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_017', 'medium', 'Choose the best answer — Microwaves are commonly used in:',
'nuclear fission', 'DC circuits only', 'mechanical clocks', 'radar',
'D', 'Radar commonly uses microwaves.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_018', 'challenge', 'Ultraviolet radiation has frequency generally:',
'lower than radio', 'equal to visible always', 'higher than visible light', 'zero',
'C', 'UV lies above visible in frequency.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_019', 'challenge', 'Quick check — Ultraviolet radiation has frequency generally:',
'zero', 'higher than visible light', 'equal to visible always', 'lower than radio',
'B', 'UV lies above visible in frequency.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_020', 'challenge', 'JEE concept check — Ultraviolet radiation has frequency generally:',
'higher than visible light', 'equal to visible always', 'zero', 'lower than radio',
'A', 'UV lies above visible in frequency.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_021', 'challenge', 'Choose the best answer — Ultraviolet radiation has frequency generally:',
'higher than visible light', 'equal to visible always', 'zero', 'lower than radio',
'A', 'UV lies above visible in frequency.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_022', 'challenge', 'Gamma rays have among the electromagnetic spectrum:',
'very high frequencies', 'no frequency', 'same as radio', 'lowest frequencies',
'A', 'Gamma rays occupy the high-frequency end.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_023', 'challenge', 'Quick check — Gamma rays have among the electromagnetic spectrum:',
'lowest frequencies', 'no frequency', 'same as radio', 'very high frequencies',
'D', 'Gamma rays occupy the high-frequency end.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_024', 'challenge', 'JEE concept check — Gamma rays have among the electromagnetic spectrum:',
'no frequency', 'lowest frequencies', 'very high frequencies', 'same as radio',
'C', 'Gamma rays occupy the high-frequency end.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_025', 'challenge', 'Choose the best answer — Gamma rays have among the electromagnetic spectrum:',
'very high frequencies', 'lowest frequencies', 'no frequency', 'same as radio',
'A', 'Gamma rays occupy the high-frequency end.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTROMAGNETIC_WAVES' AND st.subtopic_code='ELECTROMAGNETIC_WAVES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTROMAGNETIC_WAVES_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTROMAGNETIC_WAVES_025';

-- OPTICS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_006', 'medium', 'A convex lens is generally:',
'converging', 'plane mirror', 'opaque', 'diverging',
'A', 'A convex lens converges parallel rays.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_007', 'medium', 'Quick check — A convex lens is generally:',
'diverging', 'opaque', 'plane mirror', 'converging',
'D', 'A convex lens converges parallel rays.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_008', 'medium', 'JEE concept check — A convex lens is generally:',
'plane mirror', 'diverging', 'opaque', 'converging',
'D', 'A convex lens converges parallel rays.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_009', 'medium', 'Choose the best answer — A convex lens is generally:',
'plane mirror', 'diverging', 'opaque', 'converging',
'D', 'A convex lens converges parallel rays.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_010', 'medium', 'A concave lens is generally:',
'converging', 'diverging', 'opaque', 'plane mirror',
'B', 'A concave lens diverges parallel rays.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_011', 'medium', 'Quick check — A concave lens is generally:',
'plane mirror', 'opaque', 'diverging', 'converging',
'C', 'A concave lens diverges parallel rays.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_012', 'medium', 'JEE concept check — A concave lens is generally:',
'diverging', 'opaque', 'plane mirror', 'converging',
'A', 'A concave lens diverges parallel rays.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_013', 'medium', 'Choose the best answer — A concave lens is generally:',
'diverging', 'opaque', 'converging', 'plane mirror',
'A', 'A concave lens diverges parallel rays.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_014', 'medium', 'Refractive index n is:',
'c+v', 'v/c', 'cv', 'c/v',
'D', 'n=c/v.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_015', 'medium', 'Quick check — Refractive index n is:',
'c+v', 'c/v', 'cv', 'v/c',
'B', 'n=c/v.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_016', 'medium', 'JEE concept check — Refractive index n is:',
'v/c', 'c+v', 'c/v', 'cv',
'C', 'n=c/v.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_017', 'medium', 'Choose the best answer — Refractive index n is:',
'v/c', 'c+v', 'cv', 'c/v',
'D', 'n=c/v.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_018', 'challenge', 'When light enters a denser optical medium obliquely, it bends:',
'towards the normal', 'away from normal', 'back on itself', 'without change always',
'A', 'Speed decreases and ray bends toward normal.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_019', 'challenge', 'Quick check — When light enters a denser optical medium obliquely, it bends:',
'back on itself', 'towards the normal', 'without change always', 'away from normal',
'B', 'Speed decreases and ray bends toward normal.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_020', 'challenge', 'JEE concept check — When light enters a denser optical medium obliquely, it bends:',
'towards the normal', 'away from normal', 'without change always', 'back on itself',
'A', 'Speed decreases and ray bends toward normal.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_021', 'challenge', 'Choose the best answer — When light enters a denser optical medium obliquely, it bends:',
'towards the normal', 'without change always', 'back on itself', 'away from normal',
'A', 'Speed decreases and ray bends toward normal.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_022', 'challenge', 'Total internal reflection requires incidence from denser to rarer medium above the:',
'Brewster angle only', 'right angle always', 'zero angle', 'critical angle',
'D', 'TIR occurs above the critical angle.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_023', 'challenge', 'Quick check — Total internal reflection requires incidence from denser to rarer medium above the:',
'zero angle', 'critical angle', 'Brewster angle only', 'right angle always',
'B', 'TIR occurs above the critical angle.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_024', 'challenge', 'JEE concept check — Total internal reflection requires incidence from denser to rarer medium above the:',
'critical angle', 'Brewster angle only', 'right angle always', 'zero angle',
'A', 'TIR occurs above the critical angle.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_OPTICS_025', 'challenge', 'Choose the best answer — Total internal reflection requires incidence from denser to rarer medium above the:',
'critical angle', 'right angle always', 'Brewster angle only', 'zero angle',
'A', 'TIR occurs above the critical angle.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='OPTICS' AND st.subtopic_code='OPTICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'OPTICS_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_OPTICS_025';

-- DUAL_NATURE
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_006', 'medium', 'Photon energy is:',
'hf', 'h/f', 'f/h', 'hc f',
'A', 'E=hf.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_007', 'medium', 'Quick check — Photon energy is:',
'hf', 'hc f', 'f/h', 'h/f',
'A', 'E=hf.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_008', 'medium', 'JEE concept check — Photon energy is:',
'h/f', 'f/h', 'hc f', 'hf',
'D', 'E=hf.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_009', 'medium', 'Choose the best answer — Photon energy is:',
'hf', 'h/f', 'f/h', 'hc f',
'A', 'E=hf.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_010', 'medium', 'de Broglie wavelength is:',
'h/p', 'hp', 'h+p', 'p/h',
'A', 'λ=h/p.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_011', 'medium', 'Quick check — de Broglie wavelength is:',
'hp', 'h/p', 'h+p', 'p/h',
'B', 'λ=h/p.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_012', 'medium', 'JEE concept check — de Broglie wavelength is:',
'hp', 'p/h', 'h+p', 'h/p',
'D', 'λ=h/p.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_013', 'medium', 'Choose the best answer — de Broglie wavelength is:',
'p/h', 'h+p', 'h/p', 'hp',
'C', 'λ=h/p.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_014', 'medium', 'Photoelectric emission requires photon frequency above the:',
'sound frequency', 'zero frequency', 'resonance mass', 'threshold frequency',
'D', 'hf must exceed work function.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_015', 'medium', 'Quick check — Photoelectric emission requires photon frequency above the:',
'resonance mass', 'threshold frequency', 'zero frequency', 'sound frequency',
'B', 'hf must exceed work function.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_016', 'medium', 'JEE concept check — Photoelectric emission requires photon frequency above the:',
'resonance mass', 'zero frequency', 'sound frequency', 'threshold frequency',
'D', 'hf must exceed work function.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_017', 'medium', 'Choose the best answer — Photoelectric emission requires photon frequency above the:',
'sound frequency', 'zero frequency', 'threshold frequency', 'resonance mass',
'C', 'hf must exceed work function.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_018', 'challenge', 'Stopping potential measures maximum photoelectron:',
'mass', 'momentum only', 'kinetic energy per charge', 'wavelength only',
'C', 'eV_s=K_max.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_019', 'challenge', 'Quick check — Stopping potential measures maximum photoelectron:',
'wavelength only', 'mass', 'kinetic energy per charge', 'momentum only',
'C', 'eV_s=K_max.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_020', 'challenge', 'JEE concept check — Stopping potential measures maximum photoelectron:',
'mass', 'kinetic energy per charge', 'wavelength only', 'momentum only',
'B', 'eV_s=K_max.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_021', 'challenge', 'Choose the best answer — Stopping potential measures maximum photoelectron:',
'momentum only', 'mass', 'kinetic energy per charge', 'wavelength only',
'C', 'eV_s=K_max.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_022', 'challenge', 'Increasing light intensity above threshold primarily increases photoelectric:',
'stopping potential necessarily', 'electron charge', 'work function', 'current',
'D', 'More photons eject more electrons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_023', 'challenge', 'Quick check — Increasing light intensity above threshold primarily increases photoelectric:',
'stopping potential necessarily', 'current', 'electron charge', 'work function',
'B', 'More photons eject more electrons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_024', 'challenge', 'JEE concept check — Increasing light intensity above threshold primarily increases photoelectric:',
'work function', 'stopping potential necessarily', 'current', 'electron charge',
'C', 'More photons eject more electrons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_025', 'challenge', 'Choose the best answer — Increasing light intensity above threshold primarily increases photoelectric:',
'work function', 'electron charge', 'stopping potential necessarily', 'current',
'D', 'More photons eject more electrons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='DUAL_NATURE' AND st.subtopic_code='DUAL_NATURE_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'DUAL_NATURE_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_DUAL_NATURE_025';

-- ATOMS_NUCLEI
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_006', 'medium', 'Atomic number equals number of:',
'neutrons', 'nucleons', 'isotopes', 'protons',
'D', 'Z is proton number.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_007', 'medium', 'Quick check — Atomic number equals number of:',
'neutrons', 'protons', 'isotopes', 'nucleons',
'B', 'Z is proton number.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_008', 'medium', 'JEE concept check — Atomic number equals number of:',
'nucleons', 'isotopes', 'neutrons', 'protons',
'D', 'Z is proton number.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_009', 'medium', 'Choose the best answer — Atomic number equals number of:',
'nucleons', 'protons', 'isotopes', 'neutrons',
'B', 'Z is proton number.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_010', 'medium', 'Mass number equals protons plus:',
'electrons only', 'photons', 'neutrons', 'orbitals',
'C', 'A=Z+N.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_011', 'medium', 'Quick check — Mass number equals protons plus:',
'neutrons', 'photons', 'orbitals', 'electrons only',
'A', 'A=Z+N.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_012', 'medium', 'JEE concept check — Mass number equals protons plus:',
'neutrons', 'electrons only', 'orbitals', 'photons',
'A', 'A=Z+N.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_013', 'medium', 'Choose the best answer — Mass number equals protons plus:',
'neutrons', 'electrons only', 'photons', 'orbitals',
'A', 'A=Z+N.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_014', 'medium', 'Isotopes have same atomic number but different:',
'mass numbers', 'element identity', 'proton counts', 'chemical symbol necessarily',
'A', 'They differ in neutron number.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_015', 'medium', 'Quick check — Isotopes have same atomic number but different:',
'proton counts', 'mass numbers', 'chemical symbol necessarily', 'element identity',
'B', 'They differ in neutron number.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_016', 'medium', 'JEE concept check — Isotopes have same atomic number but different:',
'chemical symbol necessarily', 'proton counts', 'element identity', 'mass numbers',
'D', 'They differ in neutron number.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_017', 'medium', 'Choose the best answer — Isotopes have same atomic number but different:',
'chemical symbol necessarily', 'element identity', 'proton counts', 'mass numbers',
'D', 'They differ in neutron number.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_018', 'challenge', 'Radioactive half-life is time for nuclei count to fall to:',
'double', 'one half', 'one quarter always', 'zero',
'B', 'By definition N=N0/2 after one half-life.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_019', 'challenge', 'Quick check — Radioactive half-life is time for nuclei count to fall to:',
'double', 'one quarter always', 'one half', 'zero',
'C', 'By definition N=N0/2 after one half-life.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_020', 'challenge', 'JEE concept check — Radioactive half-life is time for nuclei count to fall to:',
'one quarter always', 'double', 'one half', 'zero',
'C', 'By definition N=N0/2 after one half-life.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_021', 'challenge', 'Choose the best answer — Radioactive half-life is time for nuclei count to fall to:',
'one quarter always', 'double', 'one half', 'zero',
'C', 'By definition N=N0/2 after one half-life.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_022', 'challenge', 'Binding energy is related to mass defect by:',
'E=mc', 'E=Δm+c', 'E=Δmc²', 'E=Δm/c²',
'C', 'Mass-energy equivalence gives nuclear binding energy.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_023', 'challenge', 'Quick check — Binding energy is related to mass defect by:',
'E=Δm/c²', 'E=mc', 'E=Δmc²', 'E=Δm+c',
'C', 'Mass-energy equivalence gives nuclear binding energy.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_024', 'challenge', 'JEE concept check — Binding energy is related to mass defect by:',
'E=Δmc²', 'E=mc', 'E=Δm/c²', 'E=Δm+c',
'A', 'Mass-energy equivalence gives nuclear binding energy.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_025', 'challenge', 'Choose the best answer — Binding energy is related to mass defect by:',
'E=Δm+c', 'E=Δmc²', 'E=Δm/c²', 'E=mc',
'B', 'Mass-energy equivalence gives nuclear binding energy.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ATOMS_NUCLEI' AND st.subtopic_code='ATOMS_NUCLEI_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ATOMS_NUCLEI_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ATOMS_NUCLEI_025';

-- ELECTRONIC_DEVICES
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_006', 'medium', 'In n-type semiconductor, majority carriers are:',
'electrons', 'protons', 'ions', 'holes',
'A', 'Donor doping provides electrons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_007', 'medium', 'Quick check — In n-type semiconductor, majority carriers are:',
'electrons', 'holes', 'ions', 'protons',
'A', 'Donor doping provides electrons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_008', 'medium', 'JEE concept check — In n-type semiconductor, majority carriers are:',
'protons', 'electrons', 'ions', 'holes',
'B', 'Donor doping provides electrons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_009', 'medium', 'Choose the best answer — In n-type semiconductor, majority carriers are:',
'ions', 'protons', 'holes', 'electrons',
'D', 'Donor doping provides electrons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_010', 'medium', 'In p-type semiconductor, majority carriers are:',
'neutrons', 'holes', 'electrons', 'ions',
'B', 'Acceptor doping creates holes.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_011', 'medium', 'Quick check — In p-type semiconductor, majority carriers are:',
'holes', 'electrons', 'neutrons', 'ions',
'A', 'Acceptor doping creates holes.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_012', 'medium', 'JEE concept check — In p-type semiconductor, majority carriers are:',
'neutrons', 'ions', 'holes', 'electrons',
'C', 'Acceptor doping creates holes.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_013', 'medium', 'Choose the best answer — In p-type semiconductor, majority carriers are:',
'ions', 'neutrons', 'electrons', 'holes',
'D', 'Acceptor doping creates holes.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_014', 'medium', 'A diode conducts strongly when:',
'unbiased', 'reverse biased below breakdown', 'cooled', 'forward biased',
'D', 'Forward bias lowers the junction barrier.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_015', 'medium', 'Quick check — A diode conducts strongly when:',
'forward biased', 'cooled', 'unbiased', 'reverse biased below breakdown',
'A', 'Forward bias lowers the junction barrier.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_016', 'medium', 'JEE concept check — A diode conducts strongly when:',
'unbiased', 'forward biased', 'reverse biased below breakdown', 'cooled',
'B', 'Forward bias lowers the junction barrier.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_017', 'medium', 'Choose the best answer — A diode conducts strongly when:',
'unbiased', 'cooled', 'forward biased', 'reverse biased below breakdown',
'C', 'Forward bias lowers the junction barrier.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_018', 'challenge', 'A Zener diode is commonly used for:',
'voltage regulation', 'magnetic shielding', 'mechanical amplification', 'heating',
'A', 'Reverse breakdown can maintain nearly constant voltage.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_019', 'challenge', 'Quick check — A Zener diode is commonly used for:',
'voltage regulation', 'mechanical amplification', 'heating', 'magnetic shielding',
'A', 'Reverse breakdown can maintain nearly constant voltage.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_020', 'challenge', 'JEE concept check — A Zener diode is commonly used for:',
'magnetic shielding', 'voltage regulation', 'mechanical amplification', 'heating',
'B', 'Reverse breakdown can maintain nearly constant voltage.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_021', 'challenge', 'Choose the best answer — A Zener diode is commonly used for:',
'heating', 'mechanical amplification', 'magnetic shielding', 'voltage regulation',
'D', 'Reverse breakdown can maintain nearly constant voltage.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_022', 'challenge', 'An LED converts electrical energy mainly into:',
'light', 'gravity', 'nuclear energy', 'mass',
'A', 'Electron-hole recombination emits photons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_023', 'challenge', 'Quick check — An LED converts electrical energy mainly into:',
'mass', 'gravity', 'nuclear energy', 'light',
'D', 'Electron-hole recombination emits photons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_024', 'challenge', 'JEE concept check — An LED converts electrical energy mainly into:',
'light', 'gravity', 'mass', 'nuclear energy',
'A', 'Electron-hole recombination emits photons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_025', 'challenge', 'Choose the best answer — An LED converts electrical energy mainly into:',
'gravity', 'light', 'nuclear energy', 'mass',
'B', 'Electron-hole recombination emits photons.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='ELECTRONIC_DEVICES' AND st.subtopic_code='ELECTRONIC_DEVICES_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'ELECTRONIC_DEVICES_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_ELECTRONIC_DEVICES_025';

-- EXPERIMENTAL_SKILLS
INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_006', 'medium', 'An ammeter is connected in:',
'parallel', 'either without consequence', 'open circuit', 'series',
'D', 'It measures branch current and has low resistance.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_006', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_006';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_007', 'medium', 'Quick check — An ammeter is connected in:',
'open circuit', 'series', 'parallel', 'either without consequence',
'B', 'It measures branch current and has low resistance.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_007', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_007';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_008', 'medium', 'JEE concept check — An ammeter is connected in:',
'open circuit', 'either without consequence', 'series', 'parallel',
'C', 'It measures branch current and has low resistance.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_008', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_009', 'medium', 'Choose the best answer — An ammeter is connected in:',
'either without consequence', 'open circuit', 'series', 'parallel',
'C', 'It measures branch current and has low resistance.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_009', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_010', 'medium', 'A voltmeter is connected in:',
'parallel', 'open circuit', 'series', 'short circuit',
'A', 'It measures potential difference across a component.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_010', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_011', 'medium', 'Quick check — A voltmeter is connected in:',
'series', 'parallel', 'open circuit', 'short circuit',
'B', 'It measures potential difference across a component.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_011', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_012', 'medium', 'JEE concept check — A voltmeter is connected in:',
'parallel', 'short circuit', 'open circuit', 'series',
'A', 'It measures potential difference across a component.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_012', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_013', 'medium', 'Choose the best answer — A voltmeter is connected in:',
'short circuit', 'series', 'parallel', 'open circuit',
'C', 'It measures potential difference across a component.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_013', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_014', 'medium', 'Repeated measurements are averaged mainly to reduce:',
'unit conversion', 'random error', 'instrument range', 'systematic error always',
'B', 'Averaging reduces random fluctuations.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_014', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_015', 'medium', 'Quick check — Repeated measurements are averaged mainly to reduce:',
'systematic error always', 'unit conversion', 'instrument range', 'random error',
'D', 'Averaging reduces random fluctuations.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'MAIN', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_015', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_016', 'medium', 'JEE concept check — Repeated measurements are averaged mainly to reduce:',
'random error', 'unit conversion', 'instrument range', 'systematic error always',
'A', 'Averaging reduces random fluctuations.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_016', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_017', 'medium', 'Choose the best answer — Repeated measurements are averaged mainly to reduce:',
'systematic error always', 'random error', 'instrument range', 'unit conversion',
'B', 'Averaging reduces random fluctuations.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_017', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_018', 'challenge', 'Parallax error is minimized by viewing the scale:',
'through a mirror only always', 'from far below', 'from a large angle', 'normally at eye level',
'D', 'Eye should be normal to the scale/pointer.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_018', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_019', 'challenge', 'Quick check — Parallax error is minimized by viewing the scale:',
'normally at eye level', 'from far below', 'from a large angle', 'through a mirror only always',
'A', 'Eye should be normal to the scale/pointer.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_019', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_020', 'challenge', 'JEE concept check — Parallax error is minimized by viewing the scale:',
'through a mirror only always', 'from a large angle', 'from far below', 'normally at eye level',
'D', 'Eye should be normal to the scale/pointer.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_020', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_021', 'challenge', 'Choose the best answer — Parallax error is minimized by viewing the scale:',
'from far below', 'through a mirror only always', 'normally at eye level', 'from a large angle',
'C', 'Eye should be normal to the scale/pointer.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_021', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_022', 'challenge', 'A screw gauge is suitable for measuring:',
'room length', 'small thicknesses/diameters', 'time', 'electric current',
'B', 'Its fine pitch provides small least count.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_022', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_023', 'challenge', 'Quick check — A screw gauge is suitable for measuring:',
'time', 'electric current', 'room length', 'small thicknesses/diameters',
'D', 'Its fine pitch provides small least count.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_023', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_024', 'challenge', 'JEE concept check — A screw gauge is suitable for measuring:',
'small thicknesses/diameters', 'electric current', 'room length', 'time',
'A', 'Its fine pitch provides small least count.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_024', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_025', 'challenge', 'Choose the best answer — A screw gauge is suitable for measuring:',
'room length', 'time', 'small thicknesses/diameters', 'electric current',
'C', 'Its fine pitch provides small least count.', 1, 'jee-bank-v1'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN' AND s.grade_code='PROGRAM_JEE' AND s.subject_code='PHYSICS' AND t.topic_code='EXPERIMENTAL_SKILLS' AND st.subtopic_code='EXPERIMENTAL_SKILLS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version, quality_status, archetype_code, source_note)
SELECT q.id, 'BOTH', 'SINGLE_CHOICE', 'JEE_2026', 'REVIEWED', 'EXPERIMENTAL_SKILLS_BANK_025', 'GYAN JEE physics bank expansion batch 1'
FROM education_questions q WHERE q.question_key='IN_PROGRAM_JEE_PHYSICS_EXPERIMENTAL_SKILLS_025';
