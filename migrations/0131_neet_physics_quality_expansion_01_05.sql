-- 0131_neet_physics_quality_expansion_01_05.sql

-- NEET 2026 Physics quality rebuild, Part 1.

-- Adds 18 DRAFT questions to each of five clean core topics.

-- Existing starter questions are preserved. Review locally, then promote metadata.

PRAGMA foreign_keys = ON;


INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_008',
  'easy',
  'The dimensional formula of velocity is:',
  '[L T^-1]','[L T^-2]','[M L T^-1]','[L^2 T^-1]',
  'A',
  'Velocity is displacement divided by time.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PHYSICS_AND_MEASUREMENT_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_009',
  'easy',
  'Which SI base unit is used for luminous intensity?',
  'candela','lux','lumen','watt',
  'A',
  'Candela is the SI base unit of luminous intensity.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PHYSICS_AND_MEASUREMENT_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_010',
  'easy',
  'A screw gauge has pitch 1 mm and 100 circular-scale divisions. Its least count is:',
  '0.01 mm','0.1 mm','1 mm','0.001 mm',
  'A',
  'Least count = pitch/divisions = 1/100 mm.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PHYSICS_AND_MEASUREMENT_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_011',
  'easy',
  'The number of significant figures in 0.00450 is:',
  '2','3','4','5',
  'B',
  'Leading zeros are not significant; 4, 5 and the trailing zero are significant.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PHYSICS_AND_MEASUREMENT_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_012',
  'easy',
  'Which pair has the same dimensions?',
  'work and torque','force and pressure','momentum and energy','power and impulse',
  'A',
  'Both work and torque have dimensions [M L^2 T^-2].',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PHYSICS_AND_MEASUREMENT_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_013',
  'easy',
  'If x = 12.4 ± 0.1 cm, the approximate percentage error is:',
  '0.8%','8%','1.24%','0.08%',
  'A',
  'Percentage error = 0.1/12.4 ×100 ≈ 0.8%.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PHYSICS_AND_MEASUREMENT_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_014',
  'easy',
  'A physical quantity with dimensions [M L^-1 T^-2] is:',
  'pressure','momentum','surface tension','energy',
  'A',
  'Pressure = force/area.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PHYSICS_AND_MEASUREMENT_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_015',
  'medium',
  'If Z = A^2 B^3/C and percentage errors in A, B and C are 1%, 2% and 3%, the maximum percentage error in Z is:',
  '5%','8%','11%','14%',
  'C',
  'Maximum fractional errors add with powers: 2(1)+3(2)+3 = 11%.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PHYSICS_AND_MEASUREMENT_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_016',
  'medium',
  'A vernier has 10 vernier divisions equal to 9 main-scale divisions, with 1 MSD = 1 mm. Its least count is:',
  '0.1 mm','0.9 mm','1.0 mm','0.01 mm',
  'A',
  '1 VSD = 0.9 mm, so LC = 1.0-0.9 = 0.1 mm.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PHYSICS_AND_MEASUREMENT_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_017',
  'medium',
  'The dimensional formula of Planck''s constant is:',
  '[M L^2 T^-1]','[M L T^-1]','[M L^2 T^-2]','[M^0 L^2 T^-1]',
  'A',
  'h = energy × time.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PHYSICS_AND_MEASUREMENT_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_018',
  'medium',
  'If the radius of a sphere is measured with 2% error, the approximate percentage error in its volume is:',
  '2%','4%','6%','8%',
  'C',
  'V ∝ r^3, so percentage error ≈ 3×2%=6%.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PHYSICS_AND_MEASUREMENT_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_019',
  'medium',
  'A measurement is reported as 2.50 m. The implied precision is closest to:',
  '1 m','0.1 m','0.01 m','0.001 m',
  'C',
  'The last reported digit is in the hundredths place.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PHYSICS_AND_MEASUREMENT_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_020',
  'medium',
  'Which equation is dimensionally incorrect?',
  'v=u+at','s=ut+1/2 at^2','v^2=u^2+2as','F=mv',
  'D',
  'mv is momentum, not force.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PHYSICS_AND_MEASUREMENT_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_021',
  'medium',
  'Two lengths are 5.0±0.1 cm and 3.0±0.1 cm. For their sum, the absolute uncertainty is:',
  '0.1 cm','0.2 cm','0.02 cm','0.01 cm',
  'B',
  'For addition, absolute uncertainties add.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PHYSICS_AND_MEASUREMENT_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_022',
  'medium',
  'A student obtains readings 9.8, 9.7, 9.9, 9.8 m/s^2. Their mean is:',
  '9.75','9.80','9.85','9.90',
  'B',
  'The arithmetic mean is 39.2/4 = 9.8.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PHYSICS_AND_MEASUREMENT_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_023',
  'challenge',
  'If force F, velocity v and time t are chosen as fundamental quantities, the dimensions of mass are proportional to:',
  'F t/v','F/(vt)','F v/t','F t v',
  'A',
  'F=M L T^-2 and v=L T^-1, so Ft/v=M.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PHYSICS_AND_MEASUREMENT_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_024',
  'challenge',
  'A quantity Q = sqrt(ε0/μ0) has the dimensions of:',
  'conductance','resistance','velocity','capacitance',
  'A',
  'sqrt(ε0/μ0)=1/Z0, the inverse of impedance, i.e. conductance dimension.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PHYSICS_AND_MEASUREMENT_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_025',
  'challenge',
  'For y = (a^3 b^2)/(c^4), fractional errors in a,b,c are 0.5%,1%,0.25%. Maximum percentage error in y is:',
  '2.5%','3.5%','4.5%','5.5%',
  'C',
  '3(0.5)+2(1)+4(0.25)=1.5+2+1=4.5%.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='PHYSICS_AND_MEASUREMENT'
  AND st.subtopic_code='PHYSICS_AND_MEASUREMENT_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'PHYSICS_AND_MEASUREMENT_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_PHYSICS_AND_MEASUREMENT_025';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_008',
  'easy',
  'A body starts from rest with constant acceleration 2 m/s^2. Its speed after 5 s is:',
  '5 m/s','10 m/s','20 m/s','25 m/s',
  'B',
  'v=u+at=0+2×5=10 m/s.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINEMATICS_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_009',
  'easy',
  'The slope of a displacement-time graph gives:',
  'velocity','acceleration','force','momentum',
  'A',
  'Velocity is ds/dt.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINEMATICS_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_010',
  'easy',
  'The area under a velocity-time graph gives:',
  'acceleration','displacement','jerk','speed only',
  'B',
  'Integral of velocity over time is displacement.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINEMATICS_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_011',
  'easy',
  'A projectile is launched horizontally. Neglecting air resistance, its horizontal acceleration is:',
  'g','zero','g/2','depends on speed',
  'B',
  'Only gravity acts vertically.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINEMATICS_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_012',
  'easy',
  'For uniform circular motion, the speed is constant but velocity changes because:',
  'mass changes','direction changes','radius changes continuously','time stops',
  'B',
  'Velocity is a vector.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINEMATICS_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_013',
  'easy',
  'A car moving at 20 m/s uniformly for 10 s covers:',
  '2 m','20 m','100 m','200 m',
  'D',
  's=vt=20×10=200 m.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINEMATICS_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_014',
  'easy',
  'At the highest point of a vertically projected body''s motion, its instantaneous velocity is:',
  'g','zero','maximum','equal to launch speed',
  'B',
  'Vertical velocity becomes zero momentarily.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINEMATICS_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_015',
  'medium',
  'A particle has u=5 m/s, a=3 m/s^2. Distance in 4 s is:',
  '32 m','44 m','52 m','68 m',
  'B',
  's=ut+1/2 at^2=20+24=44 m.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINEMATICS_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_016',
  'medium',
  'A stone is dropped from rest. Taking g=10 m/s^2, distance fallen in 3 s is:',
  '15 m','30 m','45 m','90 m',
  'C',
  's=1/2 gt^2=45 m.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINEMATICS_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_017',
  'medium',
  'A projectile is fired at 20 m/s at 30° to horizontal. Taking g=10 m/s^2, time of flight is:',
  '1 s','2 s','3 s','4 s',
  'B',
  'T=2u sinθ/g=2×20×0.5/10=2 s.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINEMATICS_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_018',
  'medium',
  'For the same projectile (20 m/s, 30°, g=10), maximum height is:',
  '2.5 m','5 m','10 m','20 m',
  'B',
  'H=u^2 sin^2θ/(2g)=400×0.25/20=5 m.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINEMATICS_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_019',
  'medium',
  'Two cars move in the same direction at 30 m/s and 20 m/s. Their relative speed is:',
  '10 m/s','20 m/s','50 m/s','600 m/s',
  'A',
  'Relative speed in the same direction is the difference.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINEMATICS_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_020',
  'medium',
  'A body covers equal distances at speeds 20 m/s and 30 m/s. Its average speed is:',
  '24 m/s','25 m/s','26 m/s','50 m/s',
  'A',
  'For equal distances, average speed=2uv/(u+v)=24 m/s.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINEMATICS_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_021',
  'medium',
  'A particle''s velocity changes uniformly from 10 to 30 m/s in 5 s. Acceleration is:',
  '2 m/s^2','4 m/s^2','5 m/s^2','8 m/s^2',
  'B',
  'a=(30-10)/5=4 m/s^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINEMATICS_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_022',
  'medium',
  'A ball is thrown vertically upward at 30 m/s. With g=10 m/s^2, time to highest point is:',
  '1 s','2 s','3 s','6 s',
  'C',
  't=u/g=3 s.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINEMATICS_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_023',
  'challenge',
  'Position is x=2t^3-3t^2+4 (SI). Acceleration at t=2 s is:',
  '6 m/s^2','12 m/s^2','18 m/s^2','24 m/s^2',
  'C',
  'v=6t^2-6t; a=12t-6=18 at t=2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINEMATICS_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_024',
  'challenge',
  'A projectile has range R at angle θ. At angle (90°-θ), its range is:',
  'R/2','R','2R','R tanθ',
  'B',
  'Range depends on sin2θ, unchanged for complementary angles.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINEMATICS_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_KINEMATICS_025',
  'challenge',
  'Rain falls vertically at 12 m/s. A person runs horizontally at 5 m/s. Apparent rain speed relative to the person is:',
  '7 m/s','13 m/s','17 m/s','60 m/s',
  'B',
  'Relative speed magnitude=sqrt(12^2+5^2)=13 m/s.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='KINEMATICS'
  AND st.subtopic_code='KINEMATICS_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'KINEMATICS_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_KINEMATICS_025';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_008',
  'easy',
  'Newton''s first law is closely associated with the concept of:',
  'inertia','power','pressure','density',
  'A',
  'The first law states that a body resists changes in its state of motion.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'LAWS_OF_MOTION_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_009',
  'easy',
  'The SI unit of force is:',
  'joule','newton','watt','pascal',
  'B',
  'Force is measured in newtons.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'LAWS_OF_MOTION_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_010',
  'easy',
  'Action and reaction forces act on:',
  'the same body','different bodies','only stationary bodies','only colliding bodies',
  'B',
  'Newton''s third-law pair acts on different bodies.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'LAWS_OF_MOTION_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_011',
  'easy',
  'A net force of 10 N acts on a 2 kg mass. Its acceleration is:',
  '2 m/s^2','5 m/s^2','10 m/s^2','20 m/s^2',
  'B',
  'a=F/m=5 m/s^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'LAWS_OF_MOTION_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_012',
  'easy',
  'If the net external force on a system is zero, its total linear momentum:',
  'must be zero','remains constant','increases','decreases',
  'B',
  'Zero external force implies momentum conservation.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'LAWS_OF_MOTION_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_013',
  'easy',
  'Static friction is:',
  'always μsN','self-adjusting up to a limiting value','always zero','independent of normal reaction',
  'B',
  'Static friction matches the applied tangential force up to its limiting value.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'LAWS_OF_MOTION_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_014',
  'easy',
  'For a body on a horizontal surface with no vertical acceleration, normal reaction is usually:',
  'mg','m/g','zero','2mg',
  'A',
  'Vertical forces balance.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'LAWS_OF_MOTION_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_015',
  'medium',
  'A 5 kg block on a smooth horizontal surface is pulled by 20 N. Acceleration is:',
  '2','4','5','10',
  'B',
  'a=20/5=4 m/s^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'LAWS_OF_MOTION_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_016',
  'medium',
  'A 10 kg block has coefficient of friction 0.2 on a horizontal surface. With g=10, limiting friction is:',
  '2 N','20 N','50 N','100 N',
  'B',
  'f_lim=μN=0.2×100=20 N.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'LAWS_OF_MOTION_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_017',
  'medium',
  'Two blocks 2 kg and 3 kg are pushed together on a smooth surface by 10 N. Common acceleration is:',
  '1 m/s^2','2 m/s^2','3 m/s^2','5 m/s^2',
  'B',
  'a=F/(2+3)=2 m/s^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'LAWS_OF_MOTION_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_018',
  'medium',
  'A 2 kg body hangs at rest from a light string. Taking g=10, tension is:',
  '10 N','20 N','30 N','40 N',
  'B',
  'At rest T=mg=20 N.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'LAWS_OF_MOTION_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_019',
  'medium',
  'A 60 kg person stands in a lift accelerating upward at 2 m/s^2. Taking g=10, apparent weight is:',
  '480 N','600 N','720 N','1200 N',
  'C',
  'N=m(g+a)=60×12=720 N.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'LAWS_OF_MOTION_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_020',
  'medium',
  'A 4 kg block is pulled horizontally by 30 N against 10 N friction. Acceleration is:',
  '2.5','5','7.5','10',
  'B',
  'Net force=20 N; a=20/4=5.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'LAWS_OF_MOTION_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_021',
  'medium',
  'For a block just about to slide down a rough incline of angle θ, coefficient of static friction satisfies:',
  'μs=sinθ','μs=cosθ','μs=tanθ','μs=cotθ',
  'C',
  'At limiting equilibrium mg sinθ=μs mg cosθ.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'LAWS_OF_MOTION_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_022',
  'medium',
  'Impulse equals change in:',
  'energy','momentum','velocity only','force',
  'B',
  'J=∫Fdt=Δp.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'LAWS_OF_MOTION_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_023',
  'challenge',
  'A 2 kg and 3 kg mass are connected over a frictionless pulley. With g=10, magnitude of acceleration is:',
  '1 m/s^2','2 m/s^2','4 m/s^2','5 m/s^2',
  'B',
  'a=(3-2)g/(3+2)=2 m/s^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'LAWS_OF_MOTION_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_024',
  'challenge',
  'A block rests on a rough incline at angle θ. If θ is increased slowly, slipping begins when:',
  'tanθ=μs','sinθ=μs','cosθ=μs','cotθ=μs',
  'A',
  'The angle of repose satisfies tanθ=μs.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'LAWS_OF_MOTION_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_025',
  'challenge',
  'A 1000 kg car moving at 20 m/s stops uniformly in 5 s. Average retarding force magnitude is:',
  '1000 N','2000 N','4000 N','5000 N',
  'C',
  'a=4 m/s^2; F=ma=4000 N.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='LAWS_OF_MOTION'
  AND st.subtopic_code='LAWS_OF_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'LAWS_OF_MOTION_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_LAWS_OF_MOTION_025';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_008',
  'easy',
  'The kinetic energy of a mass m moving with speed v is:',
  'mv','mv^2','1/2 mv^2','mgh',
  'C',
  'Translational kinetic energy is 1/2 mv^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'WORK_ENERGY_POWER_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_009',
  'easy',
  'Work done by a force perpendicular to displacement is:',
  'maximum','zero','negative','infinite',
  'B',
  'W=Fs cos90°=0.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'WORK_ENERGY_POWER_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_010',
  'easy',
  'The SI unit of power is:',
  'joule','watt','newton','pascal',
  'B',
  'Power is measured in watts.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'WORK_ENERGY_POWER_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_011',
  'easy',
  'Gravitational potential energy near Earth''s surface is:',
  'mv^2','mgh','F/t','mg/h',
  'B',
  'U=mgh relative to a chosen reference level.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'WORK_ENERGY_POWER_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_012',
  'easy',
  'A conservative force has work between two points that is:',
  'path-dependent','path-independent','always positive','always zero',
  'B',
  'Work by a conservative force depends only on endpoints.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'WORK_ENERGY_POWER_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_013',
  'easy',
  'A 10 N force moves an object 3 m in its direction. Work done is:',
  '3 J','10 J','30 J','300 J',
  'C',
  'W=Fs=30 J.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'WORK_ENERGY_POWER_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_014',
  'easy',
  'If speed doubles, kinetic energy becomes:',
  '2 times','4 times','8 times','unchanged',
  'B',
  'K∝v^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'WORK_ENERGY_POWER_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_015',
  'medium',
  'A 2 kg body moving at 3 m/s has kinetic energy:',
  '3 J','6 J','9 J','18 J',
  'C',
  'K=1/2×2×9=9 J.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'WORK_ENERGY_POWER_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_016',
  'medium',
  'A 5 kg mass is lifted 4 m. Taking g=10, increase in potential energy is:',
  '20 J','50 J','100 J','200 J',
  'D',
  'ΔU=mgh=5×10×4=200 J.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'WORK_ENERGY_POWER_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_017',
  'medium',
  'A machine does 600 J of work in 3 s. Its average power is:',
  '100 W','200 W','300 W','1800 W',
  'B',
  'P=W/t=200 W.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'WORK_ENERGY_POWER_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_018',
  'medium',
  'A spring of constant 200 N/m is compressed by 0.10 m. Stored energy is:',
  '0.5 J','1 J','2 J','10 J',
  'B',
  'U=1/2 kx^2=1 J.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'WORK_ENERGY_POWER_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_019',
  'medium',
  'Net work done on a body equals change in its:',
  'momentum','kinetic energy','potential energy only','mass',
  'B',
  'This is the work-energy theorem.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'WORK_ENERGY_POWER_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_020',
  'medium',
  'A 1000 W motor lifts a 100 kg load vertically at constant speed. With g=10, speed is:',
  '0.1 m/s','1 m/s','10 m/s','100 m/s',
  'B',
  'P=mgv, so v=1000/(1000)=1 m/s.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'WORK_ENERGY_POWER_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_021',
  'medium',
  'A body falls freely through height h from rest. Neglecting air resistance, its speed at the bottom is:',
  'gh','sqrt(gh)','sqrt(2gh)','2gh',
  'C',
  'mgh=1/2 mv^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'WORK_ENERGY_POWER_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_022',
  'medium',
  'Work done by friction on a sliding block is generally:',
  'positive','negative','zero','undefined',
  'B',
  'Kinetic friction opposes displacement.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'WORK_ENERGY_POWER_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_023',
  'challenge',
  'A particle moves under F=kx from x=0 to x=a. Work done by the force is:',
  'ka','ka^2','1/2 ka^2','2ka^2',
  'C',
  'W=∫0^a kx dx=1/2 ka^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'WORK_ENERGY_POWER_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_024',
  'challenge',
  'A 2 kg block with speed 10 m/s climbs a smooth incline. Taking g=10, maximum vertical height reached is:',
  '2.5 m','5 m','10 m','20 m',
  'B',
  '1/2 mv^2=mgh gives h=v^2/(2g)=5 m.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'WORK_ENERGY_POWER_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_025',
  'challenge',
  'A constant power P acts on a particle of mass m initially at rest. Its speed varies with time as:',
  't','t^2','sqrt(t)','1/sqrt(t)',
  'C',
  'P=d(1/2 mv^2)/dt, so v^2∝t.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='WORK_ENERGY_POWER'
  AND st.subtopic_code='WORK_ENERGY_POWER_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'WORK_ENERGY_POWER_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_WORK_ENERGY_POWER_025';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_008',
  'easy',
  'Angular velocity is measured in:',
  'rad/s','m/s','N m','kg m/s',
  'A',
  'Angular velocity has SI unit rad s^-1.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ROTATIONAL_MOTION_V2_008',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_008';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_009',
  'easy',
  'Torque equals:',
  'r×F','r·F','F/r','r/F',
  'A',
  'Torque is the vector cross product r×F.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ROTATIONAL_MOTION_V2_009',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_009';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_010',
  'easy',
  'Moment of inertia depends on:',
  'mass distribution about axis','only angular speed','only torque','only time',
  'A',
  'It depends on how mass is distributed relative to the axis.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ROTATIONAL_MOTION_V2_010',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_010';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_011',
  'easy',
  'For pure rolling without slipping:',
  'v=ωR','v=ω/R','v=R/ω','v=0',
  'A',
  'The center-of-mass speed equals ωR.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ROTATIONAL_MOTION_V2_011',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_011';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_012',
  'easy',
  'Angular momentum of a rigid body about a fixed symmetry axis is:',
  'Iω','I/ω','τω','Iα',
  'A',
  'L=Iω for rotation about a fixed principal axis.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ROTATIONAL_MOTION_V2_012',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_012';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_013',
  'easy',
  'The SI unit of moment of inertia is:',
  'kg m','kg m^2','N m','J s',
  'B',
  'Moment of inertia has dimensions ML^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ROTATIONAL_MOTION_V2_013',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_013';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_014',
  'easy',
  'A couple produces:',
  'zero net force but nonzero torque','nonzero net force only','zero force and zero torque','linear acceleration only',
  'A',
  'Equal opposite parallel forces form a couple.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ROTATIONAL_MOTION_V2_014',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_014';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_015',
  'medium',
  'A disc has I=1/2 MR^2. Its rotational kinetic energy at angular speed ω is:',
  '1/2 MR^2ω^2','1/4 MR^2ω^2','MR^2ω^2','1/8 MR^2ω^2',
  'B',
  'K=1/2 Iω^2=1/4 MR^2ω^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ROTATIONAL_MOTION_V2_015',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_015';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_016',
  'medium',
  'A torque of 6 N m acts on a body of moment of inertia 2 kg m^2. Angular acceleration is:',
  '2 rad/s^2','3 rad/s^2','6 rad/s^2','12 rad/s^2',
  'B',
  'α=τ/I=3 rad/s^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ROTATIONAL_MOTION_V2_016',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_016';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_017',
  'medium',
  'A ring and a solid disc have the same M and R. Which has larger moment of inertia about the central axis?',
  'ring','disc','same','depends on speed',
  'A',
  'I_ring=MR^2; I_disc=1/2 MR^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ROTATIONAL_MOTION_V2_017',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_017';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_018',
  'medium',
  'A skater reduces moment of inertia while external torque is negligible. Angular speed:',
  'decreases','increases','remains fixed','becomes zero',
  'B',
  'Angular momentum Iω is conserved.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ROTATIONAL_MOTION_V2_018',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_018';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_019',
  'medium',
  'The radius of gyration k is defined by:',
  'I=Mk','I=Mk^2','I=M^2k','I=k/M',
  'B',
  'By definition I=Mk^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ROTATIONAL_MOTION_V2_019',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_019';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_020',
  'medium',
  'For a uniform rod of length L about an axis through its center perpendicular to it, I is:',
  'ML^2','ML^2/2','ML^2/12','ML^2/3',
  'C',
  'Standard result for a thin uniform rod about its center.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ROTATIONAL_MOTION_V2_020',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_020';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_021',
  'medium',
  'For the same rod about an end perpendicular to it, I is:',
  'ML^2/12','ML^2/3','ML^2/2','ML^2',
  'B',
  'By parallel-axis theorem, I_end=ML^2/3.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ROTATIONAL_MOTION_V2_021',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_021';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_022',
  'medium',
  'A wheel rolls without slipping. Total kinetic energy is the sum of:',
  'translational and rotational','potential and thermal only','rotational only','translational only',
  'A',
  'Rolling combines center-of-mass translation and rotation.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ROTATIONAL_MOTION_V2_022',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_022';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_023',
  'challenge',
  'A solid cylinder rolls without slipping down from height h. Its speed at bottom is:',
  'sqrt(gh)','sqrt(4gh/3)','sqrt(2gh)','sqrt(gh/2)',
  'B',
  'mgh=1/2 mv^2+1/2(1/2 mR^2)(v^2/R^2)=3/4 mv^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ROTATIONAL_MOTION_V2_023',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_023';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_024',
  'challenge',
  'A point mass m is moved from distance r to 2r from a rotation axis. Its moment of inertia becomes:',
  'I/4','I/2','2I','4I',
  'D',
  'For a point mass I=mr^2.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ROTATIONAL_MOTION_V2_024',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_024';

INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text,
 choice_a, choice_b, choice_c, choice_d,
 correct_choice, explanation, active, source_type)
SELECT
  st.id,
  'IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_025',
  'challenge',
  'A body with I=4 kg m^2 changes angular velocity from 2 to 5 rad/s in 3 s. Average torque is:',
  '2 N m','4 N m','6 N m','12 N m',
  'B',
  'α=(5-2)/3=1 rad/s^2 and τ=Iα=4 N m.',
  1,
  'neet-2026-quality-v2'
FROM education_subtopics st
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code='ROTATIONAL_MOTION'
  AND st.subtopic_code='ROTATIONAL_MOTION_CORE';

INSERT OR IGNORE INTO education_question_metadata
(question_id, exam_level, question_format, syllabus_version,
 quality_status, archetype_code, source_note)
SELECT
  q.id,
  'NEET',
  'SINGLE_CHOICE',
  'NEET_2026',
  'DRAFT',
  'ROTATIONAL_MOTION_V2_025',
  'GYAN NEET 2026 quality rebuild v2'
FROM education_questions q
WHERE q.question_key='IN_PROGRAM_NEET_PHYSICS_ROTATIONAL_MOTION_025';

-- ------------------------------------------------------------
-- Verification: first five Physics topics should now have 25 active questions each.
-- ------------------------------------------------------------

SELECT
  t.sort_order,
  t.topic_code,
  COUNT(q.id) AS active_questions,
  SUM(
    CASE
      WHEN qm.syllabus_version='NEET_2026'
       AND qm.quality_status IN ('DRAFT','REVIEWED','PUBLISHED')
      THEN 1 ELSE 0
    END
  ) AS tracked_neet_2026_questions
FROM education_topics t
JOIN education_subjects s
  ON s.id=t.subject_id
JOIN education_subtopics st
  ON st.topic_id=t.id
 AND st.enabled=1
LEFT JOIN education_questions q
  ON q.subtopic_id=st.id
 AND q.active=1
LEFT JOIN education_question_metadata qm
  ON qm.question_id=q.id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND t.topic_code IN (
    'PHYSICS_AND_MEASUREMENT',
    'KINEMATICS',
    'LAWS_OF_MOTION',
    'WORK_ENERGY_POWER',
    'ROTATIONAL_MOTION'
  )
GROUP BY
  t.id,
  t.sort_order,
  t.topic_code
ORDER BY
  t.sort_order;

SELECT
  COUNT(q.id) AS active_questions_first_five
FROM education_questions q
JOIN education_subtopics st ON st.id=q.subtopic_id
JOIN education_topics t ON t.id=st.topic_id
JOIN education_subjects s ON s.id=t.subject_id
WHERE s.country_code='IN'
  AND s.grade_code='PROGRAM_NEET'
  AND s.subject_code='PHYSICS'
  AND q.active=1
  AND t.topic_code IN (
    'PHYSICS_AND_MEASUREMENT',
    'KINEMATICS',
    'LAWS_OF_MOTION',
    'WORK_ENERGY_POWER',
    'ROTATIONAL_MOTION'
  );
